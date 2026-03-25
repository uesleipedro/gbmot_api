import db from '../infra/database'

export class PostGradData {
  async getPostGrad() {
    return await db.manyOrNone(`SELECT * from gbmot.post_grad`)
  }
}
