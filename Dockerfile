FROM wakametech/asdf-erlang-elixir:latest

USER root
RUN apt-get update && apt-get -y install libexpat1-dev inotify-tools iputils-ping net-tools

USER asdf
WORKDIR /app

COPY . .
RUN ./start.sh
