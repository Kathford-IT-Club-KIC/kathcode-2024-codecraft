import { v2 as cloudinary } from "cloudinary";
import fs from "fs";

const uploadCloudinary = async (localFilepath, publicId) => {
  try {
    if (!localFilepath) return null;
    // upload local file to cloudinary
    const response = await cloudinary.uploader.upload(localFilepath, {
      resource_type: "auto",
      public_id: publicId,
    });
    fs.unlinkSync(localFilepath);
    return response;
  } catch (error) {
    console.log("Error occurred while uploading on Cloudinary");
    fs.unlinkSync(localFilepath);
    throw error;
  }
};

export { uploadCloudinary };
