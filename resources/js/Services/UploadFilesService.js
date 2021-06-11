import http from "../http-common";

class UploadFilesService {
  upload(message, onUploadProgress) {
    let formData = new FormData();

    formData.append("file", message.currentFile);
    formData.append("user", message.user_id);
    formData.append("receiver", message.receiver);
    formData.append("message", message.message);

    return http.post("/messages", formData, {
      headers: {
        "Content-Type": "multipart/form-data"
      },
      onUploadProgress
    });
  }

  getFiles() {
    return http.get("/files");
  }
}

export default new UploadFilesService();