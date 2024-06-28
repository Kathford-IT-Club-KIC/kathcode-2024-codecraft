import { Product } from "../models/Property.models.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import { ApiError } from "../utils/apiError.js";
import { ApiResponse } from "../utils/apiResponse.js";

// Function to search for properties
const searchProperty = asyncHandler(async (req, res, next) => {
    const { query } = req.query;

    // Check if the search query is provided
    if (!query) {
        return next(new ApiError(400,"Search query is required"));
    }

    // Create a case-insenesitive search regex
    const searchRegex = new RegExp(query, "i");

    try{
        
    }