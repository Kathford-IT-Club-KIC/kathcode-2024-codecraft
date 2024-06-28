import { Router } from "express";
import { loginUser } from "../controllers/user.login.js";
import { changePassword } from "../controllers/user.passwordChange.js";
import { updateProfile } from "../controllers/user.profileUpdate.js";
import { registerUser } from "../controllers/user.registration.js";
import { logoutUser } from "../controllers/user.logout.js";
import { verifyJWT } from "../middleware/jwtauth.middleware.js";

const router = Router;

// Register route
router.route("/register").post(registerUser);
//login route
router.route("/login").post(loginUser);
//logout route
router.route("/logout").post(verifyJWT, logoutUser);
//change password
router.route("/passwordchange").post(verifyJWT, changePassword);
//update profile
router.route("/:id").put(updateUser);
//forgot password
router.route("/forgotpassword").post(forgotPassword);
//reset password
router.route("/passwordreset/:resetToken").put(resetPassword);
