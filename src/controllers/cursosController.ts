import { CursosData } from '../data/cursosData';

const cursosData = new CursosData();

export class CursosController {
  async saveCursos(data: any) {
    return await cursosData.saveCursos(data);
  }

  async getCursos() {
    return await cursosData.getCursos();
  }

  async getCursosByAluno(id_aluno: number) {
    return await cursosData.getCursosByAluno(id_aluno);
  }

  async updateCursos(data: any) {
    return await cursosData.updateCursos(data);
  }

  async deleteCurso(data: any) {
    return await cursosData.deleteCurso(data);
  }
}


