import { TurmaAlunoData } from '../data/turmaAlunoData';

const turmaAlunoData = new TurmaAlunoData();

export class TurmaAlunoController {
  async updateStatusTurmaAluno(data: any) {
    return await turmaAlunoData.updateStatusTurmaAluno(data);
  }
}


