# Use a modern, maintained FFmpeg image based on Ubuntu
FROM jrottenberg/ffmpeg:6.1-ubuntu2204

LABEL maintainer="Paul Visco <paul.visco@gmail.com>"

# Install Node.js, npm, and git
RUN apt-get update && \
    apt-get install -y curl git && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /usr/src/app

# Install dependencies
COPY package.json package-lock.json* ./
RUN npm install

# Copy the rest of the app
COPY . .

# Expose the port
EXPOSE 3000

# Start the app
CMD ["node", "app.js"]
