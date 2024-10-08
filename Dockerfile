# Use the official Node.js image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js application
RUN npm run build

# Set environment variables
ENV MOVIE_CATALOG_SERVICE=http://localhost:8080

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
