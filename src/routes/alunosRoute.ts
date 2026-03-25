import { NextFunction, Request, Response, Router } from 'express';
import { AlunosController } from '../controllers/alunosController';

const alunosController = new AlunosController();
const router = Router();

router.get('/', async function (req: Request, res: Response, next: NextFunction) {
  try {
    const response = await alunosController.getAlunos()
    res.status(200).json(response)
  } catch (e: any) {
    next(e)
  }
})

router.get('/matricula/:matricula', async function (req: Request, res: Response, next: NextFunction) {
  try {
    const response = await alunosController.getAlunoByMatricula(Number(req.params.matricula))
    res.status(200).json(response)
  } catch (e: any) {
    next(e)
  }
})

export default router;
