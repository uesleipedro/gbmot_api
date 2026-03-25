import db from '../infra/database'

export class CursosData {
  async saveCursos(curso: any) {
    return await db.one('INSERT INTO gbmot.cursos (titulo, descricao, carga_horaria, post_grad_minimo) VALUES (UPPER($1), UPPER($2), $3, $4) returning *',
      [curso.titulo, curso.descricao, Number(curso.carga_horaria), Number(curso.post_grad_minimo)])
  }

  async getCursos() {
    return await db.manyOrNone('SELECT * FROM gbmot.cursos')
  }

  async updateCursos(curso: any) {
    await db.query('UPDATE gbmot.cursos SET titulo = UPPER($1), descricao = UPPER($2), carga_horaria = $3, post_grad_minimo = $4 WHERE id_curso = $5 returning *',
      [curso.titulo, curso.descricao, Number(curso.carga_horaria), Number(curso.post_grad_minimo), Number(curso.id_curso)])
  }


  async deleteCurso(data: any) {
    return await db.none('DELETE FROM gbmot.cursos WHERE id_curso = $1', [Number(data.id_curso)])
  }
}

