import { Router, Request, Response, NextFunction } from 'express';
import { PostGradController } from '../controllers/postGradController';

const router = Router();
const postGradController = new PostGradController();

router.get('/', async function (req: Request, res: Response, next: NextFunction) {
  try {
    const response = await postGradController.getPostGrad()
    res.status(200).json(response)
  } catch (e: any) {
    next(e)
  }
})

export default router;
