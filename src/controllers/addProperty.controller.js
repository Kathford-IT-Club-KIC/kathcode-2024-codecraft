import { Property } from "../models/Property.models.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { apiError } from "../utils/apiError.js";
import { uploadCloudinary } from "../utils/cloudinary.js";
import { parseAndValidateLocation } from "../controllers/parseAndValidateLocation.controller.js";

const uploadPropertyImages = asyncHandler(async (req, res, next) => {
  const propertyImageFiles = req.files?.propertyImage;
  const propertyImageUrls = await handleImageUpload(propertyImageFiles, next);
  if (!propertyImageUrls) return;
  return { imageUrls: propertyImageUrls };
});

const handleImageUpload = async (files, next) => {
  if (!files || files.length === 0) {
    return next(new apiError(400, "At least one property image is required"));
  }
  try {
    return await Promise.all(
      files.map(async (file) => {
        try {
          const imageUrl = await uploadCloudinary(file.path);
          return imageUrl.url;
        } catch (error) {
          throw new apiError(500, "Error uploading image to Cloudinary");
        }
      })
    );
  } catch (error) {
    throw new apiError(500, `Error uploading image: ${error.message}`);
  }
};

const addProperty = asyncHandler(async (req, res, next) => {
  const {
    title,
    description,
    address,
    latitude,
    longitude,
    amount,
    contactNumber,
    amenities,
    categories,
  } = req.body;

  if (!title || !description || !address || !amount || !categories) {
    return next(new apiError(400, "All fields are required"));
  }

  let validLatitude = parseFloat(latitude);
  let validLongitude = parseFloat(longitude);
  if (
    validLatitude < -90 ||
    validLatitude > 90 ||
    validLongitude < -180 ||
    validLongitude > 180
  ) {
    if (
      validLatitude >= -180 &&
      validLatitude <= 180 &&
      validLongitude >= -90 &&
      validLongitude <= 90
    ) {
      [validLatitude, validLongitude] = [validLongitude, validLatitude];
    } else {
      return next(new apiError(400, "Invalid latitude or longitude values"));
    }
  }

  let parsedLocation;
  try {
    parsedLocation = parseAndValidateLocation(validLatitude, validLongitude);
  } catch (error) {
    return next(new apiError(400, "Invalid location data"));
  }

  const propertyImageFiles = req.files?.propertyImage;
  const propertyImageUrls = await handleImageUpload(propertyImageFiles, next);
  if (!propertyImageUrls) return;

  try {
    const newProperty = new Property({
      title,
      description,
      address,
      location: parsedLocation,
      propertyImage: propertyImageUrls,
      amount,
      categories,
      contactNumber,
      amenities,
    });

    try {
      await newProperty.validate();
    } catch (validationError) {
      console.error(
        "Validation Error: Property validation failed",
        validationError
      );
      return next(
        new apiError(400, `Validation error: ${validationError.message}`)
      );
    }

    await newProperty.save();

    return res.status(201).json({
      status: 201,
      message: "Property added successfully",
      property: newProperty,
    });
  } catch (error) {
    console.error("Database error: Error adding property to database", error);
    return next(
      new apiError(500, `Error adding property to database: ${error.message}`)
    );
  }
});

export { addProperty, uploadPropertyImages };
