import db from '../infra/database'

export class AlunosData {
  async saveAluno(aluno: any) {
    return await db.one('INSERT INTO gbmot.alunos (nome, nome_guerra, post_grad, whatsapp, matricula, lotacao, qbmg) VALUES ($1, $2, $3, $4, $5, $6, $7) returning *',
      [aluno.nome.toUpperCase(), aluno.nome_guerra.toUpperCase(), Number(aluno.post_grad), aluno.whatsapp, Number(aluno.matricula), Number(aluno.lotacao), Number(aluno.qbmg)])
  }

  async getAlunos() {
    return await db.manyOrNone(`
        SELECT 
          a.id_aluno, a.nome, a.nome_guerra, pg.abreviacao as post_grad, a.whatsapp, a.matricula, a.lotacao, a.qbmg
        FROM gbmot.alunos a
        INNER JOIN gbmot.post_grad pg ON a.post_grad = pg.id_post_grad
    `)
  }

  async getAlunoByMatricula(matricula: number) {
    return await db.query(`
        SELECT 
          *
        FROM gbmot.alunos WHERE matricula = $1`, [matricula])
  }

  async updateAluno(aluno: any) {
    return await db.query('UPDATE gbmot.alunos SET nome = $1, nome_guerra = $2, post_grad = $3, whatsapp = $4, matricula = $5, lotacao = $6, qbmg = $7 WHERE matricula = $5 returning *',
      [aluno.nome.toUpperCase(), aluno.nome_guerra.toUpperCase(), Number(aluno.post_grad), aluno.whatsapp, Number(aluno.matricula), aluno.lotacao, Number(aluno.qbmg)])
  }

  async incluirCadastroReserva(id_turma: number) {
    await db.query(`
      UPDATE gbmot.turma_aluno SET id_turma = 1 WHERE status <> 'consolidado' AND id_turma = $1`, [id_turma])
  }

}

