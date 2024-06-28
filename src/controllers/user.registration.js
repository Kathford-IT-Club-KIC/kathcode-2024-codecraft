import { asyncHandler } from "../utils/asyncHandler.js";
import { apiError } from "../utils/apiError.js";
import { ApiResponse } from "../utils/apiResponse.js";
import { User } from "../models/user.models.js";

const registerUser = asyncHandler(async (req, res) => {
  console.log(req.body);
  const { firstname, lastname, email, password } = req.body;

  // Validate fields
  if (
    [firstname, lastname, email, password].some(
      (field) => !field || field.trim() === ""
    )
  ) {
    throw new apiError(400, "All fields are required");
  }

  // Check for existing user
  const existedUser = await User.findOne({ email });
  if (existedUser) {
    throw new apiError(409, "User already exists");
  }

  // Create a new user
  await User.create({ firstname, lastname, email, password });

  // Respond with success message
  return res
    .status(201)
    .json(new ApiResponse(200, "User registration completed"));
});

export { registerUser };
