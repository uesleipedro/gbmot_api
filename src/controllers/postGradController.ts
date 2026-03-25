import { PostGradData } from '../data/postGradData';

const postGradData = new PostGradData();

export class PostGradController {
  async getPostGrad() {
    return await postGradData.getPostGrad();
  }
}


