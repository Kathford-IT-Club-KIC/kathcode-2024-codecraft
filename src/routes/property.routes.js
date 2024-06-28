import { Router } from "express";
import { upload } from "../middleware/multer.middleware.js";
import {
  addProperty,
  uploadPropertyImages,
} from "../controllers/addProperty.controller.js";

const router = Router();
router.route("/addProperty").post(
  upload.fields([
    {
      name: "propertyImage",
      maxCount: 3,
    },
  ]),
  addProperty
);

//to uplad image (make slider in frontend)
router.route("/uploadImages").post(
  upload.fields([
    {
      name: "propertyImage",
      maxCount: 10,
    },
  ]),
  uploadPropertyImages
);
export default router;
