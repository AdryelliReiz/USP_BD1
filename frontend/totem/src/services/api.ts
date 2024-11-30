import axios from "axios";

const api = axios.create({
  baseURL: "http://0.tcp.sa.ngrok.io:11663/api/",
});

export default api;