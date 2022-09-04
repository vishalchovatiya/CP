### side note
- all these instructions are for windows & tested for windows
- requirement 
  - Install docker 
  - Install vscode 
  - Clone this repo

- Build the image from repository directory terminal
```
docker build -t cp .
```


- Run the container from repository directory terminal
```
docker run -d -p 2222:22 --security-opt seccomp:unconfined -v %cd%:/CP --name cp cp
```


The -d parameter detaches the Docker container from the terminal. The -p parameter links the port 2222 to the exposed 22 port of the container. As debugging requires running privileged operations, you'll run the container in unconfined mode, thus the --security-opt set to seccomp:unconfined. The -v parameter creates a bind mount that maps the local file system (%cd% - print working directory) into the container (/CP). Therefore, you need to be inside the source code folder while you run this command, or you can change the $PWD value with a full path to the source directory.



- Start existing container

```
docker start -i cp
```
