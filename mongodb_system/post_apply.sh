#!/bin/bash



################################################
# Add url to /etc/hosts/
################################################

# Variables
HOSTNAME="my-mongo-tut.example"
HOSTS_FILE="/etc/hosts"


# Get the IP from the Ingress resource
IP=$(kubectl get ingress mongodb-express-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
echo "$IP"


# Check if the IP was found
if [[ -z "$IP" ]]; then
  echo "Error: Could not retrieve IP for ingress 'mongodb-express-ingress'."
  exit 1
fi

# Check if the entry already exists
if grep -q "$IP $HOSTNAME" "$HOSTS_FILE"; then
  echo "Entry $IP $HOSTNAME already exists in $HOSTS_FILE."
else
  # Add the entry
  echo "$IP $HOSTNAME" | sudo tee -a "$HOSTS_FILE" > /dev/null
  echo "Added $IP $HOSTNAME to $HOSTS_FILE."
fi

cat $HOSTS_FILE