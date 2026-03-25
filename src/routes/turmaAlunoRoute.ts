import { NextFunction, Request, Response, Router } from 'express';
import { TurmaAlunoController } from '../controllers/turmaAlunoController';

const turmaAlunoController = new TurmaAlunoController();
const router = Router();

router.put('/', async function (req: Request, res: Response, next: NextFunction) {
  try {
    const response = await turmaAlunoController.updateStatusTurmaAluno(req.body)
    res.status(200).json(response)
  } catch (e: any) {
    next(e)
  }
})

export default router;
