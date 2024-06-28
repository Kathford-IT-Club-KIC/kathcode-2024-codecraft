import { asyncHandler } from "../utils/asyncHandler.js";
import { ApiError } from "../utils/apiError.js";
import { apiResponse } from "../utils/apiResponse.js";

const registerUser = asyncHandler(async (req, res) => {
  const { firstname, lastname, email, password } = req.body;
  try {
    //validating the field
    if (
      [firstname, lastname, email, password].some(
        (field) => field?.trim() === ""
      )
    ) {
      throw new ApiError(400, "All fields are required");
    }

    //checking for existed user
    const existedUser = await User.findOne({ email });
    if (existedUser) {
      throw new ApiError(409, "User already exist");
    }

    //create a new user
    await User.create({
      firstname,
      lastname,
      email,
      password,
    });

    //respond the success message
    return res
      .status(201)
      .json(new apiResponse(200, "User registration completed"));
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Error occur while registration", error });
  }
});
export { registerUser };
