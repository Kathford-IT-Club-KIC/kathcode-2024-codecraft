import { asyncHandler } from "../utils/asyncHandler.js";
import { Property } from "../models/Property.models.js";
import { apiError } from "../utils/apiError.js";

// to delete a product by ID

const deletePropertyById = asyncHandler(async (req, res, next) => {
  const deletedProperty = await Property.findByIdAndDelete(req.params.id);

  if (!deletedProperty) {
    return next(new apiError(404, "Property not found"));
  }

  res.status(200).json({
    success: true,
    message: "Product deleted successfully",
  });
});

export { deletePropertyById };
