# mongo_docker_bootstrap

Simple shell script to create a local mongo docker container.

Running `./buildMongo.sh` will prompt the user to enter username/password of the global admin account. Upon successful creation of said user, the next three prompts will ask for the name of the database and username/password of a user that has read/write access to the database to-be-created.

`docker-compose` needs to be in the path for the script to work properly.
