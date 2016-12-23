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
        sudo apt-get install automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev m4
      fi
      ;;
  esac
  . $HOME/.asdf/asdf.sh
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
  asdf install erlang 19.2
}
