import db from '../infra/database'

export class TurmasData {
  async saveTurma(turma: any) {
    return await db.one('INSERT INTO gbmot.turmas (id_curso, dt_inicio, dt_fim, local, horario, status) VALUES ($1, $2, $3, $4, $5, $6) returning *',
      [turma.id_curso, turma.dt_inicio, turma.dt_fim, turma.local, turma.horario, "Aberto"])
  }

  async getTurmas() {
    return await db.manyOrNone(`
      SELECT 
        t.id_turma, t.id_curso, t.dt_inicio, t.dt_fim, t.local, t.horario, t.status,
        c.titulo, c.carga_horaria, c.descricao
      FROM gbmot.turmas t
      INNER JOIN gbmot.cursos c ON t.id_curso = c.id_curso`)
  }

  async getAlunos(id_turma: number) {
    return await db.manyOrNone(`
      SELECT 
        ta.id_turma, ta.status,
        a.id_aluno, a.nome, a.nome_guerra, pg.abreviacao as post_grad, a.whatsapp, a.matricula, u.sigla as lotacao, a.qbmg,
        c.titulo as curso,
        t.dt_inicio, t.dt_fim, t.local, t.status as status_turma
      FROM gbmot.turma_aluno ta 
      INNER JOIN gbmot.alunos a ON ta.id_aluno = a.id_aluno
      INNER JOIN gbmot.post_grad pg ON a.post_grad = pg.id_post_grad
      INNER JOIN gbmot.unidades u ON a.lotacao = u.id_unidade
      INNER JOIN gbmot.cursos c ON ta.id_curso = c.id_curso
      INNER JOIN gbmot.turmas t ON ta.id_turma = t.id_turma
      WHERE ta.id_turma = $1`
      , [id_turma])
  }

  async updateTurma(turma: any) {
    await db.query('UPDATE gbmot.turmas SET id_curso = $1, dt_inicio = $2, dt_fim = $3, local = $4, horario = $5, status = $6 WHERE id_turma = $7 returning *',
      [turma.id_curso, turma.dt_inicio, turma.dt_fim, turma.local, turma.horario, turma.status, Number(turma.id_turma)])
  }

  async consolidarTurma(turma: any, dbOrTx: any) {
    await dbOrTx.query('UPDATE gbmot.turmas SET status = $1 WHERE id_turma = $2 returning *',
      ['Consolidada', Number(turma.id_turma)])
  }

  async deleteTurma(data: any) {
    const result = await db.result(`DELETE FROM gbmot.turmas WHERE id_turma = $1 AND status <> 'Concluido'`, [Number(data.id_turma)])
    return {
      success: result.rowCount > 0
    }
  }
}

