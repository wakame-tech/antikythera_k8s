#!/bin/bash
chown -R root:root /app/antikythera_k8s
cd /app/antikythera_k8s
mix deps.get && mix deps.get
mix antikythera_local.start
# mix antikythera_local.start ../testgear
