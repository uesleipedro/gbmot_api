import db from "../infra/database";

export class TurmaAlunoData {
  async saveTurmaAluno(inscricao: any) {
    try {
      return await db.one(
        "INSERT INTO gbmot.turma_aluno (id_turma, id_aluno, status, dt_inscricao, id_curso) VALUES ($1, $2, $3, $4, $5) returning *",
        [
          inscricao.id_turma,
          inscricao.id_aluno,
          "pre-inscrito",
          new Date(),
          inscricao.id_curso,
        ],
      );
    } catch (error: any) {
      console.error("Error saving inscrição:", error);

      if (error.code === "23505") {
        throw new Error(
          "Você já está inscrito neste curso. Aguarde a confirmação e convocação",
        );
      }

      if (error.code === "23503") {
        throw new Error(
          "Referência inválida (registro relacionado não existe)",
        );
      }

      throw new Error(error.message || "Erro ao salvar inscrição");
    }
  }

  async updateStatusTurmaAluno(turmas: any[]) {
    const values = turmas
      .map((t, i) => `($${i * 3 + 1}, $${i * 3 + 2}, $${i * 3 + 3})`)
      .join(",");

    const params = turmas.flatMap((t) => [
      "consolidado",
      Number(t.id_turma),
      Number(t.id_aluno),
    ]);

    const query = `
    UPDATE gbmot.turma_aluno AS ta
    SET status = v.status
    FROM (VALUES ${values}) AS v(status, id_turma, id_aluno)
    WHERE ta.id_turma = v.id_turma
      AND ta.id_aluno = v.id_aluno
    RETURNING ta.*;
  `;

    const result = await db.query(query, params);
    return result.rows;
  }

  async deleteTurmaAluno(id_turma: number, status: string, dbOrTx: any) {
    const result = await dbOrTx.result(
      `DELETE FROM gbmot.turma_aluno WHERE id_turma = $1 AND status = $2`,
      [id_turma, status],
    );
    return {
      success: result.rowCount > 0,
    };
  }

  async concluirTurmaAluno(id_turma: number, dbOrTx: any) {
    const result = await dbOrTx.result(
      `UPDATE gbmot.turma_aluno SET status = $2, dt_conclusao = NOW() WHERE id_turma = $1`,
      [id_turma, "Concluido"],
    );
    return {
      success: result.rowCount > 0,
    };
  }
}
