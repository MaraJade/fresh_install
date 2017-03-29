#!/usr/bin/env bash

function install() {
  sudo apt-get install "arandr curl suckless-tools feh gcc git i3-wm i3lock" \
                       "i3status keychain npm python python3 python3-dev pip" \
                       "python3-pip pithos redshift redshift-gtk terminator" \
                       "texlive-full vim vlc wget"

  sudo pip3 install theFuck
  sudo npm install -g tldr

  if (($1)); then
    sudo apt-get install wine
  fi

  if (($2)); then

  fi

  # Install dot files
  bash <(curl -sL https://git.io/vSsE0)

}

function dirs() {
  mv Documents documents
  mv Downloads downloads
  mv Music music
  mv Pictures pictures
  mv Public public
  mv Templates templates
  mv Videos videos
}

function choose() {
  read -p "Type of computer: Home/Work/Game (h/w/g)? " choice
  case "$choice" in
    w|W)
      install
      ;;
    h|H)
      install 1
      ;;
    g|G)
      install 2
      ;;
    *)
      echo "${choice} is not a valid option"
      ;;
  esac
}
