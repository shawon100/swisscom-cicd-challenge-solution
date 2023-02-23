#!/bin/bash

# Retrieve token from first API
TOKEN=$(curl -s https://151dd0e4-bd8b-453b-a01c-924e75053a8b.mock.pstmn.io/auth)

# Retrieve parameters from second API using token
PARAMETER1=$(curl -s "https://151dd0e4-bd8b-453b-a01c-924e75053a8b.mock.pstmn.io/parameters?TOKEN=$TOKEN" | jq -r '.PARAMETER1')
PARAMETER2=$(curl -s "https://151dd0e4-bd8b-453b-a01c-924e75053a8b.mock.pstmn.io/parameters?TOKEN=$TOKEN" | jq -r '.PARAMETER2')

# Create a ConfigMap with the parameter values
kubectl create configmap hello-world-params --from-literal=PARAMETER1=$PARAMETER1 --from-literal=PARAMETER2=$PARAMETER2
