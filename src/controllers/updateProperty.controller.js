import { Property } from "../models/Property.models.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { ApiError } from "../utils/apiError.js";
import { ApiResponse } from "../utils/apiResponse.js";

//function to update a product by ID
const updatePropertyById = asyncHandler(async (req, res, next) => {
    try{
        const {
            title,
            description,
            address,
            latitude,
            longitude,
            amount,
            categories,
            propertyImage,
        } = req.body;

        const updateProperty = await Property.findByIdAndUpdate(
            req.params.id,
            {
                title,
                description,
                address,
                latitude,
                longitude,
                amount,
                categories,
                propertyImage,
            },
            { new: true, runValidatiors: true },
        );

        if (!updateProperty) {
            return next(new ApiError(404, "Product not found"));
        }

        return res.status(200).json(new ApiResponse(200, "Property Updated"));
    } catch (error) {
        return res
        .status(500)
        .json({ message: "Profile occur while updating", error});
    }
});

export { updatePropertyById };

