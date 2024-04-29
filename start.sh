#!/bin/bash
cd /app

# antikythera
git clone -b feature/dockerize https://github.com/wakame-tech/antikythera_k8s.git .
mix deps.get && mix deps.get

# gears
export ANTIKYTHERA_INSTANCE_DEP="{:antikythera_k8s, [github: \"wakame-tech/antikythera_k8s\"]}"

GEARS=""
mkdir gears
(cd gears && git clone https://github.com/access-company/testgear.git)
GEARS="$GEARS gears/testgear"

mix antikythera_local.start $GEARS
