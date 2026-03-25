#!/usr/bin/env bash
set -euo pipefail

# --- CONFIGURATION ---
# Ensure this matches the folder on your VM where docker-compose.yml lives
DOCKER_PROJECT_DIR="/home/is214/odoo17" 
TEMP_DIR="/home/is214/deploy-temp"

echo "[1] Stop Odoo Containers"
cd "${DOCKER_PROJECT_DIR}"
sudo docker compose down

echo "[2] Syncing updated code from deployment temp"
# Copies new code from the repo clone into your live docker folder
sudo cp -r "${TEMP_DIR}/." "${DOCKER_PROJECT_DIR}/"

echo "[3] Start Odoo Containers (Detached Mode)"
sudo docker compose up -d

echo "Deployment complete."