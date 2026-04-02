import { TurmasData } from "../data/turmasData";
import { TurmaAlunoData } from "../data/turmaAlunoData";
import { CadastroReservaData } from "../data/cadastroReservaData";
import db from "../infra/database";

const turmasData = new TurmasData();
const turmaAlunoData = new TurmaAlunoData();
const cadastroReservaData = new CadastroReservaData();

export class TurmasController {
  async saveTurma(data: any) {
    return await turmasData.saveTurma(data);
  }

  async getTurmas() {
    return await turmasData.getTurmas();
  }

  async getTurmasByStatus(status: string) {
    return await turmasData.getTurmasByStatus(status);
  }

  async getAlunos(id_turma: any) {
    return await turmasData.getAlunos(id_turma);
  }

  async updateTurma(data: any) {
    return await turmasData.updateTurma(data);
  }
  /*
    async consolidarTurma(data: any) {
      const responseTurma = await turmasData.consolidarTurma(data);
      const responseCadastroReserva = await cadastroReservaData.incluirCadastroReserva(Number(data.id_turma));
      const responseAlunos = await turmaAlunoData.deleteTurmaAluno(Number(data.id_turma), 'pre-inscrito');
      return {
        turma: responseTurma,
        cadastroReservaData: responseCadastroReserva,
        alunos: responseAlunos
      }
    } */

  async consolidarTurma(data: any) {
    if (data.status_turma === "Consolidada") {
      throw new Error("Turma Já foi consolidada anteriormente!");
    }
    return db.tx(async (t: any) => {
      const responseTurma = await turmasData.consolidarTurma(data, t);

      const responseCadastroReserva =
        await cadastroReservaData.incluirCadastroReserva(
          Number(data.id_turma),
          t,
        );

      const responseAlunos = await turmaAlunoData.deleteTurmaAluno(
        Number(data.id_turma),
        "pre-inscrito",
        t,
      );

      return {
        turma: responseTurma,
        cadastroReservaData: responseCadastroReserva,
        alunos: responseAlunos,
      };
    });
  }

  async concluirTurma(data: any) {
    if (data.status_turma === "Concluida") {
      throw new Error("Turma Já foi concluída anteriormente!");
    }
    return db.tx(async (t: any) => {
      const responseTurma = await turmasData.concluirTurma(data, t);

      const responseConcluirTurmaAluno =
        await turmaAlunoData.concluirTurmaAluno(Number(data.id_turma), t);

      return {
        turma: responseTurma,
        cadastroReservaData: responseConcluirTurmaAluno,
      };
    });
  }

  async deleteTurma(data: any) {
    return await turmasData.deleteTurma(data);
  }
}
