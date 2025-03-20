import axios from 'axios';

const API_URL = 'http://localhost:8080/api/services';

export default {
  async getServices() {
    try {
      const response = await axios.get(API_URL);
      return response.data;
    } catch (error) {
      console.error("Lỗi khi tải dịch vụ:", error);
      throw error;
    }
  }
};