FROM vborja/asdf-ubuntu:latest

USER root

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev

RUN asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
RUN asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
RUN export KERL_CONFIGURE_OPTIONS="--without-javac"
RUN asdf install erlang 24.3.4.13
RUN asdf install elixir 1.13.4-otp-24

RUN asdf global erlang 24.3.4.13
RUN asdf global elixir 1.13.4-otp-24

ENV PATH $PATH:~/.asdf/bin
ENV PATH $PATH:~/.asdf/shims

RUN mix local.hex --force
RUN mix local.rebar --force

RUN apt-get -y install libexpat1-dev inotify-tools

WORKDIR /app
COPY . .
