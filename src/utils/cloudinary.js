import { v2 as cloudinary } from "cloudinary";
import fs from "fs";

// Ensure Cloudinary configuration
cloudinary.config({
  cloud_name: process.env.CLOUDINARY_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET,
});

const uploadCloudinary = async (localFilepath, publicId) => {
  try {
    if (!localFilepath) return null;

    console.log(
      `Uploading file: ${localFilepath} to Cloudinary with public ID: ${publicId}`
    );

    // Upload local file to Cloudinary
    const response = await cloudinary.uploader.upload(localFilepath, {
      resource_type: "auto",
      public_id: publicId,
    });

    console.log(`File uploaded successfully. Cloudinary URL: ${response.url}`);

    // Delete local file
    if (fs.existsSync(localFilepath)) {
      fs.unlinkSync(localFilepath);
    }

    return response;
  } catch (error) {
    console.error(
      "Error occurred while uploading on Cloudinary:",
      error.message
    );

    // Delete local file in case of error
    if (fs.existsSync(localFilepath)) {
      fs.unlinkSync(localFilepath);
    }

    throw new Error(`Cloudinary upload failed: ${error.message}`);
  }
};

export { uploadCloudinary };
