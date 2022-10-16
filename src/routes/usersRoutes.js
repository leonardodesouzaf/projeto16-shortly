import express from 'express';
import { getUsers } from '../controllers/usersControllers.js';
import authorizationMiddleware from '../middlewares/authorizationMiddleware.js';

const usersRoutes = express.Router();
usersRoutes.get("/users/me", authorizationMiddleware, getUsers);

export default usersRoutes;