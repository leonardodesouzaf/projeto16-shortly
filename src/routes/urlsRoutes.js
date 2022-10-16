import express from 'express';
import { deleteUrl, getUrlsId, getUrlsOpen, postUrls } from '../controllers/urlsControllers.js';
import authorizationMiddleware from '../middlewares/authorizationMiddleware.js';
import urlSchema from '../schemas/urlSchema.js';

const urlsRoutes = express.Router();
urlsRoutes.post("/urls/shorten", authorizationMiddleware, urlSchema, postUrls); 
urlsRoutes.get("/urls/:id", getUrlsId);
urlsRoutes.get("/urls/open/:shortUrl", getUrlsOpen);
urlsRoutes.delete("/urls/:id", authorizationMiddleware, deleteUrl);

export default urlsRoutes;