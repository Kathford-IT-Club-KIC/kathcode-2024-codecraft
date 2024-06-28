import { Booking } from "";
import { Property } from "";
import { User } from "";

//Add a new booking
const bookProperty = async (req, res) => {
    try {
        const { propertyId, userId, startDate, endDate } = req.body;

        //Validate property and user existence
        const property = await Property.findById(propertyId);
        if (!property) {
            return res.status(404).json({ message: "Property not found" });
        }

        if (property.status === "booked") {
            return res.status(400).json({ message: "Property is already booked" });
        }

        const user = await User.findById(userId);
        if (!user) {
            return res.status(404).json({ message: "User not found" });
        }

        //Create new booking
        const newBooking = new Booking ({
            property: propertyId,
            user: userId,
            startDate,
            endDate,
        });

        //Save booking and update property status
        await newBooking.save();
        property.status = "booked";
        await property.save();

        res.status(201).json({
            message: "Booking created successfully",
            booking: newBooking,
        });
} catch (error) {
    res.status(500).json({ message: error.message });
  }
};