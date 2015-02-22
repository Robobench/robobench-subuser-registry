# This is a Docker image for the Drone CI system.
# Use the following command to start the container:
#    docker run -p 127.0.0.1:80:80 -t drone/drone

FROM robobench/drone
ENV DRONE_SERVER_PORT :80

# Add the subuser uuid 
ADD ./subuser/ /subuser

ENTRYPOINT ["/usr/local/bin/droned"]
