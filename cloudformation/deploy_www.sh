#!/bin/sh

ENVIRONMENT="dev"
CUSTOMER="uwc"
APP="web"
MODULE="content"
COMPONENT="www"
REGION="us-east-1"
DOMAIN="underwaterclean.com"
DOMAIN_NAME="www.${DOMAIN}"
HOSTED_ZONE_ID="<YOUR_HOSTED_ZONE_ID>"

STACK_NAME="${CUSTOMER}-${APP}-${MODULE}-${COMPONENT}-${ENVIRONMENT}"
PUBLIC_CONTENT_BUCKET="${CUSTOMER}-${APP}-${MODULE}-public-${ENVIRONMENT}"
PRIVATE_BUCKET="${CUSTOMER}-${APP}-${MODULE}-private-${ENVIRONMENT}"

aws cloudformation deploy --stack-name $STACK_NAME --region $REGION --capabilities CAPABILITY_NAMED_IAM \
	--template-file  "${COMPONENT}_template.yml" --no-fail-on-empty-changeset \
	--tags \
	    application=$APP \
	    customer=$CUSTOMER \
	    environment=$ENVIRONMENT \
	--parameter-overrides \
	    EnvironmentName=$ENVIRONMENT \
	    PublicBucket=$PUBLIC_CONTENT_BUCKET \
	    PrivateBucket=$PRIVATE_BUCKET \
	    DomainName=$DOMAIN_NAME \
	    HostedZoneID=$HOSTED_ZONE_ID \
	    Domain=$DOMAIN \
