#!/bin/bash
set -e

# Start systemd
/usr/sbin/init &

# Start Puppet Agent
/opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

# Keep container running
tail -f /dev/null
