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

userSchema.pre("save", async function(next){
    if (!this.isModified("password")) return next();

    this.password = await bcrypt.hash(this.password, 10);
    next();
});

// checking if password is correct
userSchema.methods.isPasswordCorrect = async function(password){
    return await bcrypt.compare(password, this.password);
};

userSchema.methods.generateAccessToken = function (){
    try{
        //'this' refers to the current user interface
        const token = jwt.sign(
            {_id: this._id, email: this.email, username: this.username },
            process.env.ACCESS_TOKEN_SECRET,
            {
                expiresIn : process.env.ACCESS_TOKEN_EXPIRY,
            },
        );
        return token;
    } catch (error) {
        console.error("Error generating access token:", error);
        throw error;
    }
};

userSchema.methods.generateAccessToken = function(){
    try{
        const token = jwt.sign(
            {_id: this_id },
            process.env.REFRESH_TOKEN_SECRET,
            {
                expiresIn: process.env.REFRESH_TOKEN_EXPIRY,
            },
        );
        return token;
        } catch (error) {
            console.error("Error generating access token", error);
            throw error;
        }
    };
    export const User = mongoose.mode("User", userSchema);


