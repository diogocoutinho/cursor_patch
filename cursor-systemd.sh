#!/bin/bash -ex

BINDIR=$HOME/bin

mkdir -p $HOME/.config/systemd/user

cat <<EOF >  $HOME/.config/systemd/user/cursor-update.service
[Unit]
Description=Update Cursor

[Service]
ExecStart=$BINDIR/cursor-update.sh
Type=oneshot

[Install]
# WantedBy defines which target unit should trigger this service to start
# default.target is the systemd target that is activated when a user logs in
# This ensures the cursor-update service is started automatically at user login
WantedBy=default.target
EOF

systemctl --user enable cursor-update.service
systemctl --user start cursor-update.service
