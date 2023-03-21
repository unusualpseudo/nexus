#!/bin/bash


# To delete all containers including its volumes use,
docker rm -vf $(docker ps -aq) || :

# To delete all the images
docker rmi -f $(docker images -aq) || :

# This will remove:
#      - all stopped containers
#      - all networks not used by at least one container
#      - all volumes not used by at least one container
#      - all images without at least one container associated to them
#     - all build cache
yes Y | docker system prune -a --volumes