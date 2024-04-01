#!/usr/bin/env sh

set -xe

pushd $HOME
mkdir -pv tmp_backup_folder
rclone mount nc:Backups/jiyu tmp_backup_folder --daemon
restic --repo tmp_backup_folder backup programs .dotfiles Videos Pictures Documents Music TODO .ssh .gnupg Downloads
umount tmp_backup_folder
rm -r tmp_backup_folder
popd
