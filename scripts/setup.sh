#!/bin/bash

echo "Starting DDEV..."
ddev start

echo "Installing Composer packages and setting up Craft CMS..."
ddev composer install && ddev craft setup/keys

echo "Importing dummy database..."
ddev import-db --file=./databases/starter-db.sql

echo "Launching Craft Control Panel..."
ddev launch admin
echo "Craft CMS Setup complete!"
