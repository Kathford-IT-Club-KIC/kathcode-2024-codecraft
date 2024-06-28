import { Property } from "../models/Property.models.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { apiError } from "../utils/apiError.js";
import { parseAndValidateLocation } from "../controllers/parseAndValidateLocation.controller.js";

// Function to get properties by location with pagination
const getPropertyByLocation = asyncHandler(async (req, res, next) => {
  const { latitude, longitude, distance, page, limit } = req.query;

  if (!latitude || !longitude || !distance) {
    return next(
      new apiError(400, "Latitude, longitude, and distance are required.")
    );
  }

  // Validate and parse location
  let location;
  try {
    location = parseAndValidateLocation(latitude, longitude);
  } catch (error) {
    console.error("Location validation error:", error);
    return next(new apiError(400, "Invalid location data."));
  }

  const pageNum = parseInt(page, 10) || 1;
  const limitNum = parseInt(limit, 10) || 10;
  const skip = (pageNum - 1) * limitNum;

  try {
    const aggregateQuery = [
      {
        $geoNear: {
          near: location,
          distanceField: "distance",
          maxDistance: parseFloat(distance),
          spherical: true,
        },
      },
      {
        $skip: skip,
      },
      {
        $limit: limitNum,
      },
    ];

    const countQuery = [
      {
        $geoNear: {
          near: location,
          distanceField: "distance",
          maxDistance: parseFloat(distance),
          spherical: true,
        },
      },
      {
        $count: "total",
      },
    ];

    const results = await Property.aggregate(aggregateQuery);
    const countResult = await Property.aggregate(countQuery);

    const totalDocs = countResult.length > 0 ? countResult[0].total : 0;
    const totalPages = Math.ceil(totalDocs / limitNum);

    res.status(200).json({
      status: 200,
      message: "Properties fetched successfully",
      data: results,
      meta: {
        totalDocs,
        limit: limitNum,
        totalPages,
        page: pageNum,
        hasPrevPage: pageNum > 1,
        hasNextPage: pageNum < totalPages,
        prevPage: pageNum > 1 ? pageNum - 1 : null,
        nextPage: pageNum < totalPages ? pageNum + 1 : null,
      },
    });
  } catch (error) {
    console.error("Error fetching properties by location:", error);
    return next(new apiError(500, "Error fetching properties by location."));
  }
});

export { getPropertyByLocation };
