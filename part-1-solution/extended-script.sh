#!/bin/bash

# Retrieve token from first API
TOKEN=$(curl -s https://151dd0e4-bd8b-453b-a01c-924e75053a8b.mock.pstmn.io/auth)

# Retrieve parameters from second API using token
PARAMETER1=$(curl -s "https://151dd0e4-bd8b-453b-a01c-924e75053a8b.mock.pstmn.io/parameters?TOKEN=$TOKEN" | jq -r '.PARAMETER1')
PARAMETER2=$(curl -s "https://151dd0e4-bd8b-453b-a01c-924e75053a8b.mock.pstmn.io/parameters?TOKEN=$TOKEN" | jq -r '.PARAMETER2')

# Create Kubernetes deployment YAML file
cat <<EOF > helloworld-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: helloworld
spec:
  replicas: 1
  selector:
    matchLabels:
      app: helloworld
  template:
    metadata:
      labels:
        app: helloworld
    spec:
      containers:
      - name: hello-world
        image: alpine:latest
        command: ["/bin/sh"]
        args: ["-c", "while true; do echo 'HELLO WORLD, $PARAMETER1 - $PARAMETER2'; sleep 10;done"]
EOF

# Print out the generated YAML file
cat helloworld-deployment.yaml
kubectl apply -f helloworld-deployment.yaml
