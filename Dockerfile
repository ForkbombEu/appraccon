FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy application code
COPY scraper.js ./

# Make the script executable
RUN chmod +x scraper.js

# Set the entrypoint
ENTRYPOINT ["node", "scraper.js"]
