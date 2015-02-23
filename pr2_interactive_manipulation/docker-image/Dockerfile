# This is a Docker image for the Drone CI system.
# Use the following command to start the container:
#    docker run -p 127.0.0.1:80:80 -t drone/drone

FROM jonweisz/ubuntu-ros-devel:groovy-precise-pr2-im-nvidia
MAINTAINER Jon Weisz <jon.weisz@gmail.com>
#Builds the pr2-interactive-manipulation pipeline with some helpful scripts for running and profiling parts of the pipeline
#

ENV DEBIAN_FRONTEND noninteractive
RUN sudo rm -rf /subuser
ADD ./subuser /subuser_back
ADD ./.hostdata/nvidia-driver.run /tmp/nvidia-driver.run



RUN bash /subuser_back/install_client_gpu.bash

ENTRYPOINT "/bin/bash ~/Dev/pr2_im_ws/pr2_im_launch.sh"
