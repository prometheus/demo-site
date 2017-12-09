Cloud Alchemy demo monitoring site
==================================

[![Build Status](https://travis-ci.org/cloudalchemy/demo-site.svg?branch=master)](https://travis-ci.org/cloudalchemy/demo-site) [![License](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg)](https://opensource.org/licenses/MIT)

demo.cloudalchemy.org
---------------------

This repository provides an integration testing suite for our ansible roles as well as demo site for grafana, prometheus, alertmanager and node_exporter (possibly more in the future).
Site is provisioned with ansible running vvry week and on commits to master branch. Everything is fully automated with travis ci pipeline. If you want to check `ansible-playbook` output, go to [last build](https://travis-ci.org/cloudalchemy/demo-site).

Have a look at the configuration file [group_vars/all/vars](group_vars/all/vars).

**We are looking for hosting. Please contact [@paulfantom](https://github.com/paulfantom) if you can arrange VM with 1 vCPU and 512MB of RAM.**

Applications
------------

All applications should be running on their default ports.

| App name          | Address                                                         | Status |
|-------------------|-----------------------------------------------------------------|--------|
| node_exporter     | [demo.cloudalchemy.org:9100](http://demo.cloudalchemy.org:9100) | [![site](https://img.shields.io/website-up-down-green-red/http/demo.cloudalchemy.org:9100/metrics.svg?label=site)](http://demo.cloudalchemy.org:9100/metrics) |
| snmp_exporter     | [demo.cloudalchemy.org:9116](http://demo.cloudalchemy.org:9116) | [![site](https://img.shields.io/website-up-down-green-red/http/demo.cloudalchemy.org:9116/metrics.svg?label=site)](http://demo.cloudalchemy.org:9116/metrics) |
| blackbox_exporter | [demo.cloudalchemy.org:9115](http://demo.cloudalchemy.org:9115) | [![site](https://img.shields.io/website-up-down-green-red/http/demo.cloudalchemy.org:9115/metrics.svg?label=site)](http://demo.cloudalchemy.org:9115/metrics) |
| prometheus        | [demo.cloudalchemy.org:9090](http://demo.cloudalchemy.org:9090) | [![site](https://img.shields.io/website-up-down-green-red/http/demo.cloudalchemy.org:9090.svg?label=site)](http://demo.cloudalchemy.org:9190) |
| alertmanager      | [demo.cloudalchemy.org:9093](http://demo.cloudalchemy.org:9093) | [![site](https://img.shields.io/website-up-down-green-red/http/demo.cloudalchemy.org:9093.svg?label=site)](http://demo.cloudalchemy.org:9193) |
| grafana           | [demo.cloudalchemy.org:3000](http://demo.cloudalchemy.org:3000) | [![site](https://img.shields.io/website-up-down-green-red/http/demo.cloudalchemy.org:3000.svg?label=site)](http://demo.cloudalchemy.org:3000) |

