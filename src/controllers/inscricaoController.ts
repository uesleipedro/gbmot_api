import { TurmaAlunoData } from '../data/turmaAlunoData';
import { AlunosData } from '../data/alunosData';

const turmaAlunoData = new TurmaAlunoData();
const alunosData = new AlunosData();

export class InscricaoController {
  async saveInscricao(data: any) {
    try {
      let arrData = data;

      const aluno = await this.saveAluno(data)
      arrData.id_aluno = aluno.id_aluno


      return await turmaAlunoData.saveTurmaAluno(data);
    } catch (error: any) {
      console.error("Error saving inscrição:", error);

      if (error.code === '23505') {
        throw new Error("Você já está inscrito nesta turma");
      }

      if (error.code === '23503') {
        throw new Error("Referência inválida (registro relacionado não existe)");
      }

      throw new Error(error.message || "Erro ao salvar inscrição");
    }
  }

  async saveAluno(data: any) {
    const response = await alunosData.getAlunoByMatricula(data.matricula);

    if (response.length > 0) {
      const response = await alunosData.updateAluno(data);
      return response[0];
    }

    return await alunosData.saveAluno(data);
  }

  /*
    async getTurmas() {
      return await turmasData.getTurmas();
    }
  
    async updateTurma(data: any) {
      return await turmasData.updateTurma(data);
    }
  
    async deleteTurma(data: any) {
      return await turmasData.deleteTurma(data);
    }
    */
}


