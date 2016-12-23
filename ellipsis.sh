#!/usr/bin/env bash
#
# tbjers/dot-elixir ellipsis package

pkg.install() {
  git.clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.0
  case $(os.platform) in
    osx)
      if utils.cmd_exists brew; then
        brew install automake autoconf openssl libyaml readline libxslt libtool unixodbc
      fi
      ;;
    linux)
      if utils.cmd_exists apt-get; then
        sudo apt-get -y install \
          automake \
          autoconf \
          libreadline-dev \
          libncurses-dev \
          libssl-dev \
          libyaml-dev \
          libxslt-dev \
          libffi-dev \
          libtool \
          unixodbc-dev \
          m4 \
          libssh-dev \
          libwxgtk3.0-dev \
          freeglut3-dev \
          libglew-dev \
          libglu1-mesa \
          libglu1-mesa-dev \
          libgl1-mesa-glx \
          libgl1-mesa-dev \
          libglew1.5-dev \
          libglu1-mesa-dev \
          libgl1-mesa-dev \
          libpng-dev \
          default-jre-headless \
          openjdk-8-jre-headless
      fi
      ;;
  esac
  . $HOME/.asdf/asdf.sh
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
  ERLANG_EXTRA_CONFIGURE_OPTIONS='--without-wx' asdf install erlang 19.2
  asdf install elixir 1.4.0-rc.1
}
