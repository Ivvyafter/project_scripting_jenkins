# Utiliser une image de base officielle Node.js
FROM node:14

# Créer et définir le répertoire de l'application
WORKDIR /usr/src/project_scripting_jenkins

# Installer les dépendances de l'application
COPY package*.json ./

RUN npm install

# Copier le reste des fichiers de l'application
COPY . .

# Exposer le port de l'application
EXPOSE 3000

# Définir la commande à exécuter
CMD ["npm", "start"]
