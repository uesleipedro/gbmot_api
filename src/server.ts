import 'dotenv/config'
import { app } from './app'
import http from 'http'
import { initSocket } from './socket'

const PORT = process.env.PORT
const httpServer = http.createServer(app)
initSocket(httpServer)

httpServer.listen(PORT, () => {
  console.log(`HTTP Server running on port ${PORT}`)
})


