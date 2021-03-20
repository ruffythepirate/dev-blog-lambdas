validate:
	aws cloudformation validate-template --template-body file://bucket-and-cdn.yml

validate-ecr:
	aws cloudformation validate-template --template-body file://ecr.yml

deploy-ecr: validate-ecr
	aws cloudformation update-stack --stack-name ecr-repository --template-body file://ecr.yml

deploy: validate
	aws cloudformation update-stack --stack-name blog-infrastructure --template-body file://bucket-and-cdn.yml

validate-athena:
	aws cloudformation validate-template --template-body file://athena.yml

deploy-athena: validate-athena
	aws cloudformation update-stack --capabilities CAPABILITY_IAM --stack-name athena-access-logs --template-body file://athena.yml

