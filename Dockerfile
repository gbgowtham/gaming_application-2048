FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y nginx zip unzip  curl
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN curl -o /var/www/html/master.zip -L https://github.com/gabrielecirulli/2048/archive/refs/heads/master.zip
# Extract the zip file
RUN unzip /var/www/html/master.zip -d /var/www/html/

# Move the contents to the web root and clean up
RUN mv /var/www/html/2048-master/* /var/www/html/ && rm -rf /var/www/html/2048-master /var/www/html/master.zip


EXPOSE 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]

# This Dockerfile outlines the steps to create a Docker image based on Ubuntu 22.04 that installs and configures the Nginx web server, 
# downloads and deploys a specific web application from a GitHub repository, and sets up the server to run Nginx in the foreground. 
# Here’s a detailed explanation of each part of the Dockerfile:

#     ### 1. Base Image
#     ```dockerfile
#     FROM ubuntu:22.04
#     ```
#     - **FROM ubuntu:22.04**: 
    # This specifies that the base image for the Docker container will be Ubuntu 22.04. 
    # All subsequent instructions in the Dockerfile will build upon this base image.
    
#     ### 2. Update Package List
#     ```dockerfile
#     RUN apt-get update
#     ```
#     - **RUN apt-get update**: This command updates the package list in the Ubuntu container to ensure that the latest versions of packages are available for installation.
    
#     ### 3. Install Required Packages
#     ```dockerfile
#     RUN apt-get install -y nginx zip unzip curl
#     ```
#     - **RUN apt-get install -y nginx zip unzip curl**: This installs several packages:
#       - **nginx**: A popular web server.
#       - **zip** and **unzip**: Tools for handling ZIP files.
#       - **curl**: A tool to transfer data from or to a server, used here to download files.
    
#     ### 4. Configure Nginx
#     ```dockerfile
#     RUN echo "daemon off;" >> /etc/nginx/nginx.conf
#     ```
#     - **RUN echo "daemon off;" >> /etc/nginx/nginx.conf**: This appends `daemon off;` to the Nginx configuration file. This directive tells Nginx to run in the foreground, which is necessary for Docker to manage the Nginx process properly.
    
#     ### 5. Download the Application
#     ```dockerfile
#     RUN curl -o /var/www/html/master.zip -L https://github.com/SivaranjanAsokan/5.1.DOCKER_PROJECT_Game_Deploy_With_Code/2048/archive/refs/heads/master.zip
#     ```
#     - **RUN curl -o /var/www/html/master.zip -L <URL>**: 
    # This uses `curl` to download a ZIP file from the specified GitHub repository URL and saves it to `/var/www/html/master.zip`.
    
#     ### 6. Extract the ZIP File
#     ```dockerfile
#     RUN unzip /var/www/html/master.zip -d /var/www/html/
#     ```
#     - **RUN unzip /var/www/html/master.zip -d /var/www/html/**: This unzips the downloaded file into the `/var/www/html/` directory.
    
#     ### 7. Move Contents and Clean Up
#     ```dockerfile
#     RUN mv /var/www/html/2048-master/* /var/www/html/ && rm -rf /var/www/html/2048-master /var/www/html/master.zip
#     ```
#     - **RUN mv /var/www/html/2048-master/* /var/www/html/**: 
    # This moves the contents of the extracted directory (`2048-master`) to the web root directory (`/var/www/html/`).
#     - **rm -rf /var/www/html/2048-master /var/www/html/master.zip**: 
    # This removes the now-empty extracted directory and the original ZIP file to clean up unnecessary files.
    
#     ### 8. Expose Port
#     ```dockerfile
#     EXPOSE 80
#     ```
#     - **EXPOSE 80**: This instruction informs Docker that the container will listen on port 80 at runtime, which is the default port for HTTP traffic.
    
#     ### 9. Start Nginx
#     ```dockerfile
#     CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
#     ```
#     - **CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]**: 
    # This sets the default command to run when the container starts. It launches Nginx with the specified configuration file.
    
#     In summary, this Dockerfile builds an image that runs an Nginx web server with a specific web application downloaded from a GitHub repository, configured to run in the foreground, and listens for HTTP requests on port 80.

