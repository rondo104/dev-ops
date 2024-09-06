#!/bin/bash
set -e

# Start systemd
/usr/sbin/init &

# Start Puppet Server
/opt/puppetlabs/server/bin/puppetserver foreground
