DEFAULT_ENV_FILE := .env
ifneq ("$(wildcard $(DEFAULT_ENV_FILE))","")
include ${DEFAULT_ENV_FILE}
export $(shell sed 's/=.*//' ${DEFAULT_ENV_FILE})
endif

ENV_FILE := .env.local
ifneq ("$(wildcard $(ENV_FILE))","")
include ${ENV_FILE}
export $(shell sed 's/=.*//' ${ENV_FILE})
endif

##################################

deploy: serving notebooks ui
undeploy: undeploy-serving undeploy-notebooks undeploy-ui

##################################

.PHONY: login ui undeploy-ui notebooks undeploy-notebooks serving undeploy-serving

login:
ifdef OC_TOKEN
	$(info **** Using OC_TOKEN for login ****)
	oc login ${OC_URL} --token=${OC_TOKEN}
else
	$(info **** Using OC_USER and OC_PASSWORD for login ****)
	oc login ${OC_URL} -u ${OC_USER} -p ${OC_PASSWORD} --insecure-skip-tls-verify=true
endif

##################################

deploy:
	./ui/deploy.sh

undeploy:
	./ui/undeploy.sh

##################################

notebooks:
	./notebooks/deploy.sh

undeploy-notebooks:
	./notebooks/undeploy.sh

##################################

serving:
	./serving/deploy.sh

undeploy-serving:
	./serving/undeploy.sh

##################################
