#!/bin/sh
cd /app

export ANTIKYTHERA_INSTANCE_DEP="{:antikythera_k8s, [github: \"wakame-tech/antikythera_k8s\"]}"
mkdir gears
(cd gears && git clone https://github.com/access-company/testgear.git)

rm -rf deps/antikythera/tmp
mix antikythera_k8s.start gears/testgear
sleep infinity
