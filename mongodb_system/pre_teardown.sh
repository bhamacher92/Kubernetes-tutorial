#!/bin/bash

################################################
# remove url to /etc/hosts/
################################################

# Variables
HOSTNAME="my-mongo-tut.example"
HOSTS_FILE="/etc/hosts"

# Get the IP from the Ingress resource
IP=$(kubectl get ingress mongodb-express-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

# Check if the IP was found
if [[ -z "$IP" ]]; then
  echo "Error: Could not retrieve IP for ingress 'mongodb-express-ingress'."
  exit 1
fi

# Remove the entry
if grep -q "$IP $HOSTNAME" "$HOSTS_FILE"; then
  sudo sed -i.bak "/$IP $HOSTNAME/d" "$HOSTS_FILE"
  echo "Removed $IP $HOSTNAME from $HOSTS_FILE."
else
  echo "Entry $IP $HOSTNAME not found in $HOSTS_FILE."
fi

cat $HOSTS_FILE