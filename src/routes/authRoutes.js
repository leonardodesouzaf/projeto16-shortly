import express from 'express';
import { signUp, signIn } from '../controllers/authControllers.js';
import signInSchema from '../schemas/signInSchema.js';
import signUpSchema from '../schemas/signUpSchema.js';

const authRoutes = express.Router();
authRoutes.post("/signup", signUpSchema, signUp); 
authRoutes.post("/signin", signInSchema, signIn); 

export default authRoutes;