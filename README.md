# 2048
[LinkedIn-Full-Article ](https://www.linkedin.com/posts/sivaranjandevopscloud_docker-gamedevelopment-devops-activity-7206000655151353856-A8xf?utm_source=share&utm_medium=member_desktop
)


A small clone of [1024](https://play.google.com/store/apps/details?id=com.veewo.a1024), based on [Saming's 2048](http://saming.fr/p/2048/) (also a clone).

Made just for fun. [Play it here!](http://gabrielecirulli.github.io/2048/)

The official app can also be found on the [Play Store](https://play.google.com/store/apps/details?id=com.gabrielecirulli.app2048) and [App Store!](https://itunes.apple.com/us/app/2048-by-gabriele-cirulli/id868076805)

### Contributions

[Anna Harren](https://github.com/iirelu/) and [sigod](https://github.com/sigod) are maintainers for this repository.

Other notable contributors:

 - [TimPetricola](https://github.com/TimPetricola) added best score storage
 - [chrisprice](https://github.com/chrisprice) added custom code for swipe handling on mobile
 - [marcingajda](https://github.com/marcingajda) made swipes work on Windows Phone
 - [mgarciaisaia](https://github.com/mgarciaisaia) added support for Android 2.3

Many thanks to [rayhaanj](https://github.com/rayhaanj), [Mechazawa](https://github.com/Mechazawa), [grant](https://github.com/grant), [remram44](https://github.com/remram44) and [ghoullier](https://github.com/ghoullier) for the many other good contributions.

### Screenshot

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/1175750/8614312/280e5dc2-26f1-11e5-9f1f-5891c3ca8b26.png" alt="Screenshot"/>
</p>

That screenshot is fake, by the way. I never reached 2048 :smile:

## Contributing
Changes and improvements are more than welcome! Feel free to fork and open a pull request. Please make your changes in a specific branch and request to pull into `master`! If you can, please make sure the game fully works before sending the PR, as that will help speed up the process.

You can find the same information in the [contributing guide.](https://github.com/gabrielecirulli/2048/blob/master/CONTRIBUTING.md)

## License & Code Credit
2048 is licensed under the [MIT license.](https://github.com/gabrielecirulli/2048/blob/master/LICENSE.txt)


## DOCKER-FILE:
Here's a detailed explanation of each line in the Dockerfile:

### Base Image

1. `FROM ubuntu:22.04`
   - **Purpose**: This line sets the base image for your Dockerfile. It tells Docker to use Ubuntu 22.04 as the starting point for the new image.
   - **Explanation**: Docker images are often built on top of other images. By using `ubuntu:22.04`, you ensure that your environment starts with a clean installation of Ubuntu 22.04.

### Update and Install Packages

2. `RUN apt-get update`
   - **Purpose**: Updates the package lists for the `apt` package manager.
   - **Explanation**: This ensures that `apt-get` knows about the latest versions of packages and their dependencies.

3. `RUN apt-get install -y nginx zip unzip curl`
   - **Purpose**: Installs necessary packages: `nginx` (a web server), `zip` and `unzip` (for handling ZIP files), and `curl` (a tool for transferring data with URLs).
   - **Explanation**: The `-y` flag automatically answers "yes" to any prompts during the installation process. These packages are essential for setting up the web server and handling the web application files.

### Configure Nginx

4. `RUN echo "daemon off;" >> /etc/nginx/nginx.conf`
   - **Purpose**: Modifies the Nginx configuration to prevent it from running as a daemon.
   - **Explanation**: By default, Nginx runs as a daemon (in the background). Docker expects the main process to run in the foreground to keep the container running. Adding `daemon off;` to the Nginx configuration ensures that Nginx runs in the foreground.

### Download and Extract Web Application

5. `RUN curl -o /var/www/html/master.zip -L https://github.com/SivaranjanAsokan/5.1.DOCKER_PROJECT_Game_Deploy_With_Code/2048/archive/refs/heads/master.zip`
   - **Purpose**: Downloads a ZIP file from a specified URL and saves it to `/var/www/html/master.zip`.
   - **Explanation**: `curl` is used to download the file. The `-o` option specifies the output file, and the `-L` option tells `curl` to follow any redirects.

6. `RUN unzip /var/www/html/master.zip -d /var/www/html/`
   - **Purpose**: Extracts the contents of the downloaded ZIP file into the `/var/www/html/` directory.
   - **Explanation**: The `unzip` command is used to extract the ZIP file. The `-d` option specifies the destination directory for the extracted files.

### Organize and Clean Up

7. `RUN mv /var/www/html/2048-master/* /var/www/html/ && rm -rf /var/www/html/2048-master /var/www/html/master.zip`
   - **Purpose**: Moves the extracted files to the web root directory and removes unnecessary files.
   - **Explanation**: The `mv` command moves all files from the extracted folder (`/var/www/html/2048-master/`) to the web root directory (`/var/www/html/`). The `rm -rf` command then removes the now-empty extracted folder and the original ZIP file to clean up.

### Expose Port and Start Nginx

8. `EXPOSE 80`
   - **Purpose**: Informs Docker that the container will listen on port 80 at runtime.
   - **Explanation**: Port 80 is the default port for HTTP traffic. This line doesn't actually publish the port; it just indicates that the container will use this port.

9. `CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]`
   - **Purpose**: Specifies the command to run when the container starts.
   - **Explanation**: This command starts Nginx using the specified configuration file. `"/usr/sbin/nginx"` is the path to the Nginx executable, and `"-c /etc/nginx/nginx.conf"` specifies the configuration file to use.

### Summary
This Dockerfile creates a Docker image that sets up an Nginx web server on Ubuntu 22.04, downloads a web application from a GitHub repository, and serves it from the container. It ensures that Nginx runs in the foreground, making it compatible with Docker's containerization model.

### Context

The `CMD` instruction in a Dockerfile specifies the command that will be executed when a container starts. It's important to note that there can only be one `CMD` instruction in a Dockerfile. If multiple `CMD` instructions are present, only the last one will take effect.


### Breakdown of the CMD Instruction

1. **`CMD`**:
   - **Purpose**: This keyword indicates the default command to run when a container starts.
   - **Explanation**: The command specified here will be executed unless an alternative command is provided when running the container.

2. **`["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]`**:
   - **Purpose**: This array syntax specifies the command to execute and its arguments in JSON array format.
   - **Explanation**: Using the JSON array format ensures that the command is executed directly without invoking a shell. This is generally preferred as it avoids potential issues with shell-specific features or expansions.

### Detailed Breakdown of the Command and Arguments

- **`/usr/sbin/nginx`**:
  - **Purpose**: Specifies the path to the Nginx executable.
  - **Explanation**: This is the main executable file for the Nginx web server. When this command is run, it starts the Nginx server.

- **`-c`**:
  - **Purpose**: A command-line option for the Nginx executable.
  - **Explanation**: The `-c` option allows you to specify a custom Nginx configuration file instead of using the default configuration file (`/etc/nginx/nginx.conf`).

- **`/etc/nginx/nginx.conf`**:
  - **Purpose**: Specifies the path to the Nginx configuration file to use.
  - **Explanation**: This file contains the configuration settings for the Nginx server. By specifying this file, you ensure that Nginx uses the configurations defined within it to run the server.

### Full Command Execution

When the container starts, the `CMD` instruction ensures that the following command is executed:

```bash
/usr/sbin/nginx -c /etc/nginx/nginx.conf
```

This command starts the Nginx server using the configuration file located at `/etc/nginx/nginx.conf`. 

### Why This Command is Important

- **Foreground Execution**: The earlier instruction `RUN echo "daemon off;" >> /etc/nginx/nginx.conf` in the Dockerfile ensures that Nginx runs in the foreground (`daemon off;`). This is crucial because Docker expects the main process of the container to run in the foreground. If Nginx were to run as a daemon (background process), the Docker container would exit immediately after starting since it would have no foreground process to keep it running.
  
- **Container Lifecycle**: The process specified in `CMD` becomes the main process of the container. If this process stops, the container stops. Therefore, it’s essential that the main process runs continuously to keep the container alive.

### Summary

The `CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]` instruction ensures that when the Docker container starts, the Nginx web server is started using the specified configuration file. This setup is crucial for running a web server within a Docker container, allowing the container to serve web traffic as expected.





















<!--FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y nginx zip unzip  curl
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN curl -o /var/www/html/master.zip -L https://github.com/gabrielecirulli/2048/archive/refs/heads/master.zip
# Extract the zip file
RUN unzip /var/www/html/master.zip -d /var/www/html/

# Move the contents to the web root and clean up
RUN mv /var/www/html/2048-master/* /var/www/html/ && rm -rf /var/www/html/2048-master /var/www/html/master.zip


EXPOSE 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"] -->
