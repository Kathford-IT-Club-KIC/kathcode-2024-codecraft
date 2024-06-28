import { Property } from "../models/Property.models.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { ApiError } from "../utils/apiError.js";
import { uploadOnCloudinary } from "../utils/cloudinary.js";
import { parseAndValidateLocation } from "../parseAndValidateLocation.controller.js";

const uploadPropertyImages= asyncHandler(async (req, res, next) => {
    const propertyImagefiles = req.files?.propertyImage;
    const propertyImageUrls = await handleImageUpload(propertyImagefiles, next);
    if (!propertyImageUrls) return;
    return { imageUrls: propertyImageUrls };
});

//New function to handle image upload
const handleImageUpload = async (files, next) => {
    if (files || files.length == 0){
        return next(new ApiError(400, "At least one property image is required"));
    }
    try{
        return await Promise.all(
            files.map(async (file) => {
                try{
                   const imageUrl = await uploadOnCloudinary(file.path);
                   return imageUrl.url;
                } catch (error){
                    console.error("Cloudinary Upload Error", error);
                    throw new ApiError(500, "Error uploading image is Cloudinary");
                }
            }),
        );
} catch (error) {
    console.error("Image Upload Error", error);
    throw new ApiError(500, `Error uploading image: ${error.message}`);
    }
};

//to create property
const addProperty = asyncHandler(async (req, res, next) => {
    const { 
        title,
        description,
        address,
        latitude,
        longitude,
        amount,
        contactNumber,
        amentities,
        categories,
} = req.body;
);
