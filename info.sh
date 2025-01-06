#!/bin/bash

# Directory to search for YAML files (default to current directory if not provided)
echo ""
echo "Deployments:"
kubectl get deployment

echo ""
echo "Services:"
kubectl get service


echo ""
echo "Pods:"
kubectl get pod

echo ""
echo "Ingress:"
kubectl get ingress
