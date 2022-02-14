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

deploy: serving kfnbc dashboard

##################################

.PHONY: login dashboard dashboard-undeploy kfnbc kfnbc-undeploy serving serving-undeploy

login:
ifdef OC_TOKEN
	$(info **** Using OC_TOKEN for login ****)
	oc login ${OC_URL} --token=${OC_TOKEN}
else
	$(info **** Using OC_USER and OC_PASSWORD for login ****)
	oc login ${OC_URL} -u ${OC_USER} -p ${OC_PASSWORD} --insecure-skip-tls-verify=true
endif

##################################

dashboard:
	./dashboard/deploy.sh

dashboard-undeploy:
	./dashboard/undeploy.sh

##################################

kfnbc:
	./kfnbc/deploy.sh

kfnbc-undeploy:
	./kfnbc/undeploy.sh

##################################

serving:
	./serving/deploy.sh

serving-undeploy:
	./serving/undeploy.sh

##################################
