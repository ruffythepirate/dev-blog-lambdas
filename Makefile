validate-ecr:
	aws cloudformation validate-template --template-body file://ecr.yml

deploy-ecr: validate-ecr
	aws cloudformation update-stack --stack-name ecr-repository --template-body file://ecr.yml

validate-lambdas:
	aws cloudformation validate-template --template-body file://lambdas.yml

deploy-lambdas: validate-lambdas
	aws cloudformation update-stack --stack-name dev-blog-lambdas --capabilities CAPABILITY_IAM --template-body file://lambdas.yml

