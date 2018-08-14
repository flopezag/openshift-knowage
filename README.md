# OpenShift FIWARE Knowage docker image
[![License badge](https://img.shields.io/badge/license-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Dockerfile description and OpenShift configuration file of the [FIWARE Knowage Server](https://github.com/KnowageLabs/Knowage-Server)
enabler in order to create a docker image and deploy a corresponding service instance in 
an OpenShift environment.

## Create the Docker Image


The first steps is to login inside the docker system through the execution of
the command:

```console
docker login
```

In order to create the proper image you need to have installed docker engine.
The first command is used to generate the docker image from the defined Dockerfile.

```console
docker build -f Dockerfile -t flopez/knowage:6.2.0-s $PWD
```

It creates the corresponding docker image tagged with flopez/knowage. Currently, 
there are two versions available in the docker image repository, the version 6.1.1 
and the version 6.2.0-s. Down versions to 6.1.1 are on a best-effort basis. The 
next step is upload the image into a repository (in our case [Docker Hub](https://hub.docker.com/)).

```console
docker push flopez/knowage:6.2.0-s
```

## OpenShift deployment

To start to work with OpenShift, you need to be registered in the corresponding 
environment. Just execute the following command:

```console
oc login <OpenShift server>
```

This command will request you the username and password to access to the proper 
OpenShift environment. Now, to deploy a new application, the first step is the 
creation of the proper application in the OpenShift environment. Just execute 
the command:

```console
oc new-app -e DB_ENV_MYSQL_DATABASE=<mysql knowage database name> \
           -e DB_ENV_MYSQL_PASSWORD=<MySQL user password> \
           -e DB_ENV_MYSQL_USER=<MySQL user name> \
           -e DB_PORT_3306_TCP_ADDR=<MySQL hostname> \
           -e DB_PORT_3306_TCP_PORT=<MySQL port> \
           flopez/knowage:6.2.0-s \
           --name knowage \
           -o yaml > knowage.yaml
```

Keep in mind that it is needed to specify the MySQL server hostname inside 
the OpenShift environment in order to know to which DB should be connected the 
Knowage instance. The docker image flopez/knowage is deployed publicly
in [Hub Docker public repository](https://hub.docker.com/r/flopez/knowage/). This 
operation will create the definition of the new application *knowage* with the 
corresponding yaml description file. We do not use this created description file 
but the one that we provided, due to we need to edit the content. You can compare 
the generated description application with the content inside the 
[config folder](https://github.com/flopezag/openshift-knowage/config) 
to see the differences. Finally, keep in mind that in OpenShift the hostname of 
the different services follow the next format:

```text
<service name>.<project name>.svc
```

Furthermore, to deploy our *knowage* application just execute the corresponding 
command:

```console
oc create -f config/
```

Last but not least, if we want to delete completely all the resources generated 
with these configuration files, just execute the corresponding command, specifying 
the name of the application that was created in the execution of the ```oc new-app``` 
command:

```console
oc delete all -l app=knowage
```


## License

These scripts are licensed under Apache License 2.0.
