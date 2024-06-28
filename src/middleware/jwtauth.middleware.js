import { apiError } from "../utils/apiError.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import jwt from "jsonwebtoken";
import { User } from "../models/user.models.js";

const verifyJWT = asyncHandler(async (req, res, next) => {
  try {
    const token = req.header("Authorization")?.replace("Bearer ", "");

    if (!token) {
      return next(new apiError(401, "Unauthorized request"));
    }

    let decodeToken;
    try {
      decodeToken = jwt.verify(token, process.env.ACCESS_TOKEN_SECRET);
    } catch (err) {
      return next(new apiError(401, "Invite access token"));
    }

    const user = await User.findById(decodeToken?._id).select(
      "-password -refreshToken"
    );

    if (!user) {
      return next(new apiError(401, "Invalid Access Token"));
    }

    req.user = user;
    next();
  } catch (error) {
    next(new apiError(401, error?.message || "Invalid Access Token"));
  }
});

export { verifyJWT };
