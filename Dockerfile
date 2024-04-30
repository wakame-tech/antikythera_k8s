FROM wakametech/asdf-erlang-elixir:latest

USER root
RUN apt-get update && apt-get -y install libexpat1-dev inotify-tools iputils-ping net-tools

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

USER asdf
WORKDIR /app

# COPY . .
RUN git clone -b feature/dockerize https://github.com/wakame-tech/antikythera_k8s.git .
RUN mix deps.get && mix deps.get
RUN mix compile

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
