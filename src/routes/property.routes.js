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
import { searchProperty } from "../controllers/searchProperty.controller.js";

import { nearestLocation } from "../controllers/nearestlocationRecommendation.controller.js";
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

//search Property
router.route("/searchProperty").get(searchProperty);

//nearest location recommendation
router.route("/nearest").get(nearestLocation);

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
