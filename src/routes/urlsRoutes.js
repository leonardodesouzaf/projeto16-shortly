import express from 'express';
import { getUrlsId, postUrls } from '../controllers/urlsControllers.js';
import authorizationMiddleware from '../middlewares/authorizationMiddleware.js';
import urlSchema from '../schemas/urlSchema.js';

const urlsRoutes = express.Router();
urlsRoutes.post("/urls/shorten", authorizationMiddleware, urlSchema, postUrls); 
urlsRoutes.get("/urls/:id", getUrlsId);

export default urlsRoutes;