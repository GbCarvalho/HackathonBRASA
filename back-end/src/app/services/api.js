import axios from "axios";

const api = axios.create({
  baseURL: "https://gateway.gr1d.io/production/focusnfe/v2/nfe/53200300853663000159650020000162941000162956",
  headers: {
    X-Api-Key: "d40f36a4-a785-4557-bfcf-ef2702c69436"
  }
});

export default api;
