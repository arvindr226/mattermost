# mattermost

The simplest way to build mattermost application on Docker.

Step1: Git clone the repository.  
            $ git clone https://github.com/arvindr226/mattermost.git

Step2: Install Docker Engine and Docker-compose.

            $ sudo apt-get install -y docker-engine docker.io
            $ sudo apt install -y python-pip
            $ sudo pip install docker-compose
            $ sudo pip install --upgrade pip
            
 Reference-: https://docs.docker.com/engine/installation/linux/ubuntulinux/  
 
 Step3: Build and run docker container using docker-compose.  
	             $ cd mattermost  
	             $ docker-compose up -d
             
               
 Note-: To check the running container run $ docker ps and to check the volume mounted $ cd volume.
