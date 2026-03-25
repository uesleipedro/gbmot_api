import { NextFunction, Request, Response, Router } from 'express';
import { InscricaoController } from '../controllers/inscricaoController';
import { TurmasController } from '../controllers/turmasController';

const turmasController = new TurmasController();
const inscricaoController = new InscricaoController();
const router = Router();

router.post('/', async function (req: Request, res: Response, next: NextFunction) {
  try {
    const response = await inscricaoController.saveInscricao(req.body)
    res.status(201).json(response)
  } catch (e: any) {
    console.error("Error in POST /inscricao:", e);
    next(e)
  }
})
/*
router.put('/', async function (req: Request, res: Response, next: NextFunction) {
  try {
    await turmasController.updateTurma(req.body)
    res.status(201).json({ success: true })
  } catch (e: any) {
    next(e)
  }
})

router.get('/', async function (req: Request, res: Response, next: NextFunction) {
  try {
    const response = await turmasController.getTurmas()
    res.status(200).json(response)
  } catch (e: any) {
    next(e)
  }
})

router.delete('/', async function (req: Request, res: Response, next: NextFunction) {
  try {
    const response = await turmasController.deleteTurma(req.query)

    if (!response.success) return res.status(400).json({ error: "Não é possível deletar uma turma concluída" })

    return res.status(201).json(response)
  } catch (e: any) {
    next(e)
  }
})
*/
export default router;
