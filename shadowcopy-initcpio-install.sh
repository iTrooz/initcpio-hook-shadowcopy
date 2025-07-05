#!/bin/bash

build() {
  if [[ -f /etc/shadow.initramfs ]]; then
    echo "shadowcopy: Using /etc/shadow.initramfs"
    add_file /etc/shadow.initramfs /etc/shadow
  else
    echo "shadowcopy: Using /etc/shadow"
    add_file /etc/shadow /etc/shadow
  fi
}

help() {
    echo "Copies /etc/shadow into initramfs /etc/shadow"
}
