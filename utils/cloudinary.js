import { v2 as cloudinary } from "cloudinary";
import fs from "fs";
const uploadCloudinary = async (localFilepath) => {
  try {
    if (!localFilepath) return null;
    //upload local file to cloudinary
    const response = await cloudinary.uploadCloudinary.upload(localFilepath, {
      resource_type: "auto",
      public_id: publicId,
    });
    fs.unlinSync(localFilepath);
    return response;
  } catch (error) {
    console.log("Error occured while uploading on Cloudinary");
    fs.unlinkSync(localFilepath);
    throw error;
  }
};

export { uploadCloudinary };
