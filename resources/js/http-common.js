import axios from "axios";

export default axios.create({
  baseURL: "https://api.digital-vinci.com",
  // baseURL: "http://localhost:8000",
  headers: {
    "Content-type": "application/json"
  }
});