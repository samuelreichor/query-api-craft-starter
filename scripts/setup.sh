#!/bin/bash

echo "Starting DDEV..."
ddev start

echo "Installing Composer packages and setting up Craft CMS..."
ddev composer install && ddev craft setup/keys

echo "Importing dummy database..."
ddev import-db --file=./databases/starter-db.sql

echo "Installing Node packages"
ddev npm install

echo "Launching Craft Control Panel..."
ddev launch admin && ddev launch

echo "Setup complete!"
