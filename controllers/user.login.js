import { asyncHandler } from "../utils/asyncHandler.js";
import { User } from "../models/user.models.js";
import { ApiError } from "../utils/apiError.js";
import { apiResponse } from "../utils/apiResponse.js";
import bcrypt from "bcryptjs";
const loginUser = asyncHandler(async (req, res) => {
  const { email, password } = req.body;
  //validation
  if ([email, password].some((field) => field?.trim() === "")) {
    throw new ApiError(400, "All fields are required");
  }

  // Check if user exists
  const user = await User.findOne({ email });
  if (!user) {
    throw new ApiError(401, "Invalid email or password");
  }

  //check password
  const isMatch = await bcrypt.compare(password, User.password);
  if (!isMatch) {
    throw new ApiError(401, "Invalid email or password");
  }
  //response the success message
  return res.status(201).json(new apiResponse(200, "Login successfully"));
});

export { loginUser };
