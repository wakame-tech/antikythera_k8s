FROM wakametech/asdf-erlang-elixir:latest

USER root
RUN apt-get update && apt-get -y install libexpat1-dev inotify-tools iputils-ping net-tools

USER asdf
WORKDIR /app

# COPY . .
RUN git clone -b feature/dockerize https://github.com/wakame-tech/antikythera_k8s.git .
RUN mix deps.get && mix deps.get
RUN mix compile

RUN export ANTIKYTHERA_INSTANCE_DEP="{:antikythera_k8s, [github: \"wakame-tech/antikythera_k8s\"]}"
RUN mkdir gears
RUN (cd gears && git clone https://github.com/access-company/testgear.git)

ENTRYPOINT ["entrypoint.sh"]
