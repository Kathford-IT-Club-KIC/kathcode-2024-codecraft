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
    return next(error);
  }

  const options = {
    page: parseInt(page, 10) || 1,
    limit: parseInt(limit, 10) || 10,
  };

  try {
    const aggregateQuery = Property.aggregate([
      {
        $geoNear: {
          near: location,
          distanceField: "distance",
          maxDistance: parseFloat(distance),
          spherical: true,
        },
      },
    ]);

    const results = await Property.aggregatePaginate(aggregateQuery, options);
    res.status(200).json({
      status: 200,
      message: "Properties fetched successfully",
      data: results.docs,
      meta: {
        totalDocs: results.totalDocs,
        limit: results.limit,
        totalPages: results.totalPages,
        page: results.page,
        pagingCounter: results.pagingCounter,
        hasPrevPage: results.hasPrevPage,
        hasNextPage: results.hasNextPage,
        prevPage: results.prevPage,
        nextPage: results.nextPage,
      },
    });
  } catch (error) {
    return next(new apiError(500, "Error fetching properties by location."));
  }
});

export { getPropertyByLocation };
