import { asyncHandler } from "../utils/asyncHandler.ja";
import { User } from "../models/user.models.js";
import { ApiError } from "../utils/apiError.js";
import { ApiResponse } from "../utils/apiResponse.js";
const updateProfile = asyncHandler(async (req, res) => {
  try {
    const { id } = req.params;
    const { firstname, lastname, email, password } = req.body;
    // Validation
    if (
      [firstname, lastname, email, password].some(
        (field) => field?.trim() === ""
      )
    ) {
      throw new ApiError(400, "All fields are required");
    }

    //validate if user exist or not
    const user = await User.findById(id);
    if (!user) {
      throw new ApiError(409, "User not found");
    }

    //check if email is available
    const takenEmail = await User.findOne({ email, _id: { $ne: id } });
    if (takenEmail) {
      throw new ApiError(409, "Email is already taken");
    }

    //update the information
    user.firstname = firstname;
    user.lastname = lastname;
    user.email = email;
    if (password) {
      user.password = password; // Assuming password hashing middleware is in place
    }
    await user.save();
    //return the response

    return res
      .status(200)
      .json(new ApiResponse(200, "User updated successfully", user));
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Error occur while updating profile", error });
  }
});
export { updateProfile };
