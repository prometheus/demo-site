Cloud Alchemy demo monitoring site
==================================

[![Build Status](https://travis-ci.org/cloudalchemy/demo-site.svg?branch=master)](https://travis-ci.org/cloudalchemy/demo-site) [![License](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg)](https://opensource.org/licenses/MIT)

demo.cloudalchemy.org
---------------------

This repository provides an integration testing suite for our ansible roles as well as demo site for grafana, prometheus, alertmanager and node_exporter (possibly more in the future).
Site is provisioned with ansible running in travis pipeline which is run everyday and on every commit to master branch. If you want to check `ansible-playbook` output, go to [last build](https://travis-ci.org/cloudalchemy/demo-site).

Have a look at the configuration file [group_vars/all](group_vars/all).

Applications
------------

All applications should be running on their default ports.

| App name          | Address                                                         |
|-------------------|-----------------------------------------------------------------|
| node_exporter     | [demo.cloudalchemy.org:9100](http://demo.cloudalchemy.org:9100) |
| snmp_exporter     | [demo.cloudalchemy.org:9116](http://demo.cloudalchemy.org:9116) |
| blackbox_exporter | [demo.cloudalchemy.org:9115](http://demo.cloudalchemy.org:9115) |
| prometheus        | [demo.cloudalchemy.org:9090](http://demo.cloudalchemy.org:9090) |
| alertmanager      | [demo.cloudalchemy.org:9093](http://demo.cloudalchemy.org:9093) |
| grafana           | [demo.cloudalchemy.org:3000](http://demo.cloudalchemy.org:3000) |

