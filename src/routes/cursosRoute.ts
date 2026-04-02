import { NextFunction, Request, Response, Router } from 'express';
import { CursosController } from '../controllers/cursosController';

const cursosController = new CursosController();
const router = Router();

router.post('/', async function (req: Request, res: Response, next: NextFunction) {
  try {
    const response = await cursosController.saveCursos(req.body)
    res.status(201).json(response)
  } catch (e: any) {
    next(e)
  }
})

router.put('/', async function (req: Request, res: Response, next: NextFunction) {
  try {
    await cursosController.updateCursos(req.body)
    res.status(201).json({ success: true })
  } catch (e: any) {
    next(e)
  }
})

router.get('/', async function (req: Request, res: Response, next: NextFunction) {
  try {
    const response = await cursosController.getCursos()
    res.status(200).json(response)
  } catch (e: any) {
    next(e)
  }
})

router.get('/aluno', async function (req: Request, res: Response, next: NextFunction) {
  try {
    const response = await cursosController.getCursosByAluno(Number(req.query.id_aluno))
    res.status(200).json(response)
  } catch (e: any) {
    next(e)
  }
})

router.delete('/', async function (req: Request, res: Response, next: NextFunction) {
  try {
    const response = await cursosController.deleteCurso(req.query)
    res.status(201).json(response)
  } catch (e: any) {
    next(e)
  }
})

export default router;
