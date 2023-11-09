#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
set -u

echo "Install noVNC - HTML5 based VNC viewer"
mkdir -p $NO_VNC_DEFAULT_HOME/utils/websockify
# use older version of websockify to prevent hanging connections on offline containers, see https://github.com/ConSol/docker-headless-vnc-container/issues/50
wget --no-check-certificate -O- https://github.com/novnc/noVNC/archive/refs/tags/v1.0.0.tar.gz > noVNC.tgz
tar xvf noVNC.tgz -C $NO_VNC_DEFAULT_HOME --strip 1
# use older version of websockify to prevent hanging connections on offline containers, see https://github.com/ConSol/docker-headless-vnc-container/issues/50
wget --no-check-certificate -O- https://github.com/novnc/websockify/archive/refs/tags/v0.6.1.tar.gz > websock.tgz
tar xvf websock.tgz -C $NO_VNC_DEFAULT_HOME/utils/websockify --strip 1
chmod +x -v $NO_VNC_DEFAULT_HOME/utils/*.sh
## create index.html to forward automatically to `vnc_lite.html`
