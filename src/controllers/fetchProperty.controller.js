import { Property } from "../models/Property.models.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { ApiError } from "../utils/apiError.js";
import { ApiResponse } from "../utils/apiResponse.js";

//Function to fetch all properties
const getAllProperties = asyncHandler(async (req, res) => {
    const properties = await Property.find();
    res.status(200).json({
        success: true,
        data: properties,
    });
});

