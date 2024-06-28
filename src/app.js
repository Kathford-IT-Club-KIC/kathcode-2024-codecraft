import express from "express";
import cors from "cors";
import http from "http";
import { Server } from "socket.io";
import UserRoute from "./routes/user.routes.js";
// import propertyRoute from "./routes/property.routes.js";
// import chatRoutes from "./routes/chat.routes.js";
// import { saveMessage, getMessages } from "./controllers/chat.controllers.js";
const app = express();

// Middleware configuration
app.use(
  cors({
    origin: process.env.CORS_ORIGIN,
    credentials: true,
  })
);
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//for chat system
const server = http.createServer(app);

// Initialize Socket.IO
const io = new Server(server);

// Socket.IO setup
io.on("connection", (socket) => {
  console.log("A user connected:", socket.id);

  // Handle incoming chat messages
  socket.on("chat message", async (message) => {
    console.log("Message received:", message);
    const chatMessage = await saveMessage(sender, receiver, message);
    io.emit("chat message", message); // Broadcast the message to all connected clients
  });

  // Handle disconnection
  socket.on("disconnect", () => {
    console.log("User disconnected:", socket.id);
  });
});

// Routes
app.use("/users", UserRoute);
// app.use("/properties", propertyRoute);
// app.use("/chats", chatRoutes);

export default server;
