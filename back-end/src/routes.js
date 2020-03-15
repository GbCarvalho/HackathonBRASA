import { Router } from "express";
import multer from "multer";
import multerConfig from "./config/multer";
import api from "./app/services/api";

import FileController from "./app/controllers/FileController";
import ProviderController from "./app/controllers/ProviderController";

const routes = new Router();

routes.get(
  "/api",
  async () => await api.get("/33190403282458000179550010001434641841176079")
);

const upload = multer(multerConfig);

routes.post("/files", upload.single("file"), FileController.store);

routes.post("/providers", ProviderController.store);

export default routes;
