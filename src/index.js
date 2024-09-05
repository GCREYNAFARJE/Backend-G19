import express from "express";
import morgan from "morgan";

const servidor = express();

// Agregamos logger kde los request de nuestro servidor 
servidor.use(morgan('common'));

const PORT = process.env.PORT;

servidor.listen(PORT, () => {
   console.log(`servidor corriendo exitosamente en el puerto ${PORT}`);
});