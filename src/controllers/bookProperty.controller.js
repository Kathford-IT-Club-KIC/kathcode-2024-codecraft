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
}
}