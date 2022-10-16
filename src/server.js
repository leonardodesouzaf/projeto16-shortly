import dotenv from 'dotenv';
import express from 'express';
import cors from 'cors';
import authRoutes from './routes/authRoutes.js';
import urlsRoutes from './routes/urlsRoutes.js';
import usersRoutes from './routes/usersRoutes.js';
import rankingRoutes from './routes/rankingRoutes.js';

dotenv.config();
const app = express();
app.use(cors());
app.use(express.json());

const router = express.Router();
router.use(authRoutes);
router.use(urlsRoutes);
router.use(usersRoutes);
router.use(rankingRoutes);

app.use(router);

app.listen(process.env.PORT, () => console.log(`Sever running on port ` + process.env.PORT));