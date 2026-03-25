let io: any;

export function initSocket(server: any) {
  const { Server } = require("socket.io");

  io = new Server(server, {
    origin: "http://localhost:3000",
    methods: ["GET", "POST"],
    credentials: true
  });

  return io;
}

export function getIO() {
  if (!io) throw new Error("Socket.io não inicializado!");
  return io;
}
