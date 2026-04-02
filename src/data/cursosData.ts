import db from '../infra/database'

export class CursosData {
  async saveCursos(curso: any) {
    return await db.one('INSERT INTO gbmot.cursos (titulo, descricao, carga_horaria, post_grad_minimo) VALUES (UPPER($1), UPPER($2), $3, $4) returning *',
      [curso.titulo, curso.descricao, Number(curso.carga_horaria), Number(curso.post_grad_minimo)])
  }

  async getCursos() {
    return await db.manyOrNone('SELECT * FROM gbmot.cursos')
  }


  async getCursosByAluno(id_aluno: number) {
    return await db.manyOrNone(`SELECT 
      ta.id_aluno,
      ta.status,
      ta.dt_inscricao,
      ta.dt_conclusao,
      c.titulo as curso,
      t.dt_inicio,
      t.dt_fim,
      a.nome,
      pg.abreviacao as post_grad
    FROM gbmot.turma_aluno ta 
    INNER JOIN gbmot.cursos c ON c.id_curso = ta.id_curso 
    INNER JOIN gbmot.turmas t ON t.id_turma = ta.id_turma 
    INNER JOIN gbmot.alunos a ON a.id_aluno = ta.id_aluno 
    INNER JOIN gbmot.post_grad pg ON pg.id_post_grad = a.post_grad 
    WHERE ta.id_aluno = $1
    AND ta.status = 'Concluido'`, [id_aluno])
  }

  async updateCursos(curso: any) {
    await db.query('UPDATE gbmot.cursos SET titulo = UPPER($1), descricao = UPPER($2), carga_horaria = $3, post_grad_minimo = $4 WHERE id_curso = $5 returning *',
      [curso.titulo, curso.descricao, Number(curso.carga_horaria), Number(curso.post_grad_minimo), Number(curso.id_curso)])
  }


  async deleteCurso(data: any) {
    return await db.none('DELETE FROM gbmot.cursos WHERE id_curso = $1', [Number(data.id_curso)])
  }
}

