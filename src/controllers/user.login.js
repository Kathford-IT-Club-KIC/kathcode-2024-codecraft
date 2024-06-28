import { asyncHandler } from "../utils/asyncHandler.js";
import { User } from "../models/user.models.js";
import { apiError } from "../utils/apiError.js";
import { ApiResponse } from "../utils/apiResponse.js";
import bcrypt from "bcryptjs";

const loginUser = asyncHandler(async (req, res) => {
  try {
    const { email, password } = req.body;

    // Validation
    if (!email || !password || email.trim() === "" || password.trim() === "") {
      throw new apiError(400, "All fields are required");
    }

    // Check if user exists
    const user = await User.findOne({ email });
    if (!user) {
      throw new apiError(401, "Invalid email address");
    }

    // Check password
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      throw new apiError(401, "Invalid email or password");
    }

    // Respond with success message
    return res.status(200).json(new ApiResponse(200, "Login successful"));
  } catch (error) {
    // Handle errors
    console.error("Error occurred while logging in:", error);
    return res.status(error.statusCode || 500).json({
      message: error.message || "Error occurred while logging in",
      error: error,
    });
  }
});

export { loginUser };
