import express, { Request, Response, NextFunction } from "express";
import empresaRoute from "./routes/empresaRoute";
import emailRoute from "./routes/emailRoute";
import userRoute from "./routes/userRoute";
import cursosRoute from "./routes/cursosRoute";
import turmasRoute from "./routes/turmasRoute";
import alunosRoute from "./routes/alunosRoute";
import inscricaoRoute from "./routes/inscricaoRoute";
import postGradRoute from "./routes/postGradRoute";
import turmaAlunoRoute from "./routes/turmaAlunoRoute";
import uploadRouter from "./routes/uploadRouter";
import { Middleware } from "./middlewares/middleware";
import cors from "cors";

const fileUpload = require("express-fileupload");
const middleware = new Middleware();
export const app = express();

const options: cors.CorsOptions = {
  origin: "*",
};
app.use(fileUpload());
app.use(express.static("public"));

app.use(cors(options));
app.use(express.json());
app.use(express.static(__dirname + "/static", { dotfiles: "allow" }));


app.use("/empresa", middleware.verificarToken, empresaRoute);
app.use("/users", userRoute);
app.use("/cursos", cursosRoute);
app.use("/turmas", turmasRoute);
app.use("/inscricao", inscricaoRoute);
app.use("/alunos", alunosRoute);
app.use("/turma_aluno", turmaAlunoRoute);
app.use("/post_grad", postGradRoute);
app.use("/sendEmail", middleware.verificarToken, emailRoute);
app.use("/uploads", uploadRouter); // Servir arquivos publicamente

app.use((err: any, req: Request, res: Response, next: NextFunction) => {
  const statusCode = err.status || 500;
  const message = err.message || "Erro interno do servidor";
  res.status(statusCode).json({ error: message });
});
