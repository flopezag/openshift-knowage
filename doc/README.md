# Supported tags and respective Dockerfile link
*   6.2.0-s, 6.1.1 [Dockerfile](https://github.com/flopezag/openshift-knowage/blob/master/Dockerfile)


# Quick reference

-	**Where to get help**:  
	[the Docker Community Forums](https://forums.docker.com/), [the Docker Community Slack](https://blog.docker.com/2016/11/introducing-docker-community-directory-docker-community-slack/), or [Stack Overflow](https://stackoverflow.com/search?q=fiware-knowage)

-	**Where to file issues**:  
	[https://github.com/flopezag/openshift-knowage/issues](https://github.com/flopezag/openshift-knowage/issues)

-	**Maintained by**:  
	[the FIWARE OpenShift Docker Maintainers](https://github.com/flopezag/openshift-knowage)

-	**Source of this description**:  
	[docs OpenShift FIWARE Knowage directory](https://github.com/flopezag/openshift-knowage/blob/master/doc) ([history](https://github.com/flopezag/openshift-knowage/commits/master/doc))

-	**Supported Docker versions**:  
	[the 18.06.0-ce release](https://github.com/docker/docker-ce/releases/tag/v18.06.0-ce) 
	(down to 18.06.0-ce on a best-effort basis)

# What is this FIWARE Knowage image

This docker image has been generated in order to be used in OpenShift without any 
kind of privileges or user definition. It is based on the original [Dockerfile](https://github.com/KnowageLabs/Knowage-Server-Docker/blob/master/Dockerfile) 
of the FIWARE Knowage component version 6.2.0-s. For that purpose, it is needed 
to define the corresponding MYSQL environment variables in order to connect to 
the correct DB instance. 

# How to use this image

## Hosting a simple docker service locally

In order to create the proper image just execute:

```console
docker build -f Dockerfile -t flopez/knowage:6.2.0-s $PWD
```

Just the next step is to upload the image to the current repository:

```console
docker push flopez/knowage:6.2.0-s
```

Alternatively, to run this docker image just execute the following commands:

```console
docker run --name <some container name> \
            -e DB_ENV_MYSQL_DATABASE=<mysql knowage database name> \
            -e DB_ENV_MYSQL_PASSWORD=<MySQL user password> \
            -e DB_ENV_MYSQL_USER=<MySQL user name> \
            -e DB_PORT_3306_TCP_ADDR=<MySQL hostname> \
            -e DB_PORT_3306_TCP_PORT=<MySQL port> \
           <docker image ID>
```

This will create a container listening on port 3306. Keep in mind that is component
is be be run together with a MySQL instance, therefore it not possible to execute
it in standalone process.

## OpenShift deployment

It is possible to deploy this docker image inside a OpenShift instance, just 
selecting deploy image and specifying the proper Image Name. In this case,
the value of the Image name or pull spec is **docker.io/flopez/knowage:6.2.0-s**
and specifying the corresponding environment variables.

Also it is possible to use the previous version of FIWARE Knowage (6.1.1) from the hub
docker. You only need to specify the correct name **docker.io/flopez/knowage:6.1.1**
with the proper environment variables as well.


# License

View [license information](https://github.com/KnowageLabs/Knowage-Server-Docker/blob/master/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under 
other licenses (such as Bash, etc from the base distribution, along with any direct or 
indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that 
any use of this image complies with any relevant licenses for all software contained 
within.

For the additional configuration content defined in this repo, view license information 
contained in the repository [license information](https://github.com/flopezag/openshift-knowage/blob/master/LICENSE).