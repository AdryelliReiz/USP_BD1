import axios from "axios";

const api = axios.create({
  baseURL: "http://172.115.11.32:8000/api",
});

export default api;