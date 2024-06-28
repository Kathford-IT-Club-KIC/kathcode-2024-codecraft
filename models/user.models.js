import mongoose, {Schema} from "mongoose";
import jet from "jsonwebtoken";
import bcrypt from "bcrypt";

const userSchema = new mongoose.Schema(
    {
        email:{
            type: String,
            required: true,
            unique: true,
            lowercase: true,
            trim: true,
        },
        firstname: {
            type: String,
            reequired: true,
        },
        lastname: {
            type: String,
            required: [true, "Password is required"],
        },
        password: {
            type: String,
            required: [true, "Password is required"],
        },
        resetPasswordToken: {
            type: String,
        },
        resetPasswordExpire: {
            type: Date,
        },
    },
    { timestamps: true },
);

