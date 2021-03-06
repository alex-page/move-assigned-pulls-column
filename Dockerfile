# Use the latest version of Node.js
#
# You may prefer the full image:
# FROM node
#
# or even an alpine image (a smaller, faster, less-feature-complete image):
# FROM node:alpine
#
# You can specify a version:
# FROM node:10-slim
FROM node:alpine

# Labels for GitHub to read your action
LABEL "com.github.actions.name"="Move assigned pull requests column"
LABEL "com.github.actions.description"="✨ Magically move assigned pull requests to a column."
LABEL "com.github.actions.icon"="move"
LABEL "com.github.actions.color"="green"
LABEL "repository"="https://github.com/alex-page/move-assigned-pulls-column"
LABEL "homepage"="https://github.com/alex-page/move-assigned-pulls-column"
LABEL "maintainer"="Alex Page <alex@alexpage.com.au>".

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of your action's code
COPY . .

# Run `node /index.js`
ENTRYPOINT ["node", "/index.js"]
