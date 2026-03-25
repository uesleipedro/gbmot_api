import { AlunosData } from '../data/alunosData';

const alunosData = new AlunosData();

export class AlunosController {
  async getAlunos() {
    return await alunosData.getAlunos();
  }

  async getAlunoByMatricula(matricula: number) {
    return await alunosData.getAlunoByMatricula(matricula);
  }

  async updateAluno(data: any) {
    return await alunosData.updateAluno(data);
  }

}


