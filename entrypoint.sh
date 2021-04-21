#!/bin/sh

set -e

export AWS_ACCESS_KEY_ID="$INPUT_AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="$INPUT_AWS_SECRET_ACCESS_KEY"

echo "aws version"

aws --version

echo "Attempting to update kubeconfig for aws"

echo "$INPUT_AWS_ACCESS_KEY_ID" | sed 's/./& /g'
echo "$INPUT_AWS_REGION" | sed 's/./& /g'
echo "$INPUT_CLUSTER_NAME" | sed 's/./& /g'

aws eks --region "$INPUT_AWS_REGION" update-kubeconfig --name "$INPUT_CLUSTER_NAME"
kubectl "$@"