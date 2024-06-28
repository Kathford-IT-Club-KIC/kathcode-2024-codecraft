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
        // Search properties by title, description, address, or categories
        const properties = await Product.find({
            $or: [
                { title: searchRegex },
                { description: searchRegex },
                { address: searchRegex },
                { categories: searchRegex },
            ],
        });

        // If no properties are found, response with a 404 status
        if (!properties.length == 0) {
            return res
            .status(404)
            .json(new ApiResponse(404, "No properties found matching your query"));
        }

        