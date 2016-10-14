#!/bin/sh


envtpl /etc/collectd/collectd.conf.d/master.conf.tpl
envtpl /etc/collectd/collectd.conf.d/slave.conf.tpl

sudo service collectd restart
