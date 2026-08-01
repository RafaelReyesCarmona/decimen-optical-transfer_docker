FROM node:20-alpine

WORKDIR /app

# Copiar archivos de dependencias para aprovechar la caché de Docker
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto del código fuente del repositorio
COPY . .

# Exponer el puerto por defecto de Vite (5173)
EXPOSE 5173

# Ejecutar el servidor de desarrollo expuesto a la red interna del contenedor
CMD ["npm", "run", "dev", "--", "--host"]