# RHODS Cluster Deployment for 2022

## Requirements

* OpenShift Cluster 4.9+
* OpenShift CLI (`oc`)
* Make

## Usage

### 1. Create an Environment File

Scripts will use default variables from the `.env` file. This will be used by the various scripts to inject variables into their deployments. To override these variables, copy the `.env.local.example` into a file named `.env.local`.


### 2. Logging in

Logging in manually is supported.  From there you can just execute your `make deploy` commands as normal.

You can also login by creating the appropriate variables in your `.env.local` file.

The `OC_` variables require a token and cluster API URL. This is the target OpenShift cluster that services will be deployed onto.

```
OC_URL=https://the-cluster.openshiftapps.com:6443
OC_TOKEN=sha256~thisis-atoken-itsrandom # to be used instead of OC_USER and OC_PASSWORD
```

After setting the authentications in your `.env.local` file. You can then use `make login` as part of your normal installation sequence.  e.g
```shell
make login deploy
```


