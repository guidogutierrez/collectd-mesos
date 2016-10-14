#!/bin/sh

set -e

envtpl /etc/collectd/collectd.conf.d/master.conf.tpl
envtpl /etc/collectd/collectd.conf.d/slave.conf.tpl

collectd -f
