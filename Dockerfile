FROM wakametech/asdf-erlang-elixir:latest

USER root
RUN apt-get update && apt-get -y install libexpat1-dev inotify-tools

USER asdf
WORKDIR /app

COPY . .
RUN ./start.sh
