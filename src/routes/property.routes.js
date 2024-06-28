import { Router } from "express";
import { upload } from "../middleware/multer.middleware.js";
import {
  addProperty,
  uploadPropertyImages,
} from "../controllers/addProperty.controller.js";
import { bookProperty } from "../controllers/bookProperty.controller.js";
import { cancelBooking } from "../controllers/bookProperty.controller.js";
import { deletePropertyById } from "../controllers/deleteProperty.controller.js";
import {
  getAllProperties,
  getPropertyById,
} from "../controllers/fetchProperty.controller.js";
import { getPropertyByLocation } from "../controllers/location.controller.js";

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

//get property by location
router.route("/location").get(getPropertyByLocation);
//delete Property
router.route("/:id").delete(deletePropertyById);

//fetch product by id
router.route("/:id").get(getPropertyById);

//get all Property
router.route("/").get(getAllProperties);

//to book property
router.route("/booking").post(bookProperty);

//to cancel booked property
router.route("/booking/:bookingId/cancel").put(cancelBooking);

export default router;
