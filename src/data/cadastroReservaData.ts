import db from '../infra/database'

export class CadastroReservaData {
  async incluirCadastroReserva(id_turma: any, dbOrTx: any) {
    return await dbOrTx.query(`
      INSERT INTO gbmot.cadastro_reserva (id_aluno, status, dt_inscricao, id_curso)
      SELECT id_aluno, status, dt_inscricao, id_curso
      FROM gbmot.turma_aluno
      WHERE id_turma = $1 AND status <> 'consolidado'
    `, [id_turma])
  }
}


