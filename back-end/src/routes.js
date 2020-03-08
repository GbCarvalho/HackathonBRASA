import { Router } from 'express';
import multer from 'multer';
import multerConfig from './config/multer';

import FileController from './app/controllers/FileController';
import ProviderController from './app/controllers/ProviderController';

const routes = new Router();
const upload = multer(multerConfig);

routes.post('/files', upload.single('file'), FileController.store);

routes.post('/providers', ProviderController.store)


export default routes;