# Use an official GCC image as a base
FROM gcc:latest

# Install necessary build tools
RUN apt-get update && apt-get install -y \
    cmake \
    make \
    wget \
    unzip

# Set the working directory
WORKDIR /usr/src/app

# Download and extract the X-Plane SDK
RUN wget https://developer.x-plane.com/wp-content/plugins/code-sample-generation/sdk_zip_files/XPSDK410.zip && \
    unzip XPSDK410.zip -d /usr/src/app && \
    rm XPSDK410.zip

# Copy the source code into the container
COPY . /usr/src/app

# Build the plugin
# RUN mkdir build && cd build && \
#     cmake .. && \
#     make

# Create an alias for the build command
# RUN echo 'alias build="mkdir -p build && cd build && cmake .. && make"' >> ~/.bashrc

# Copy the entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# ENTRYPOINT: This specifies the executable that should be run when a container is started from the image.
# In this case: docker-entrypoint.sh. This script will always be run when a container is started the Docker image
ENTRYPOINT ["docker-entrypoint.sh"]

# CMD: This provides default arguments to the ENTRYPOINT.
# If no arguments are passed to docker run, the values specified in CMD will be used.
# The docker-entrypoint.sh script will be run with bash as the argument.
CMD ["bash"]
