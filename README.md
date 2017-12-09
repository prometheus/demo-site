Cloud Alchemy demo monitoring site
==================================

[![Build Status](https://travis-ci.org/cloudalchemy/demo-site.svg?branch=master)](https://travis-ci.org/cloudalchemy/demo-site) [![License](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg)](https://opensource.org/licenses/MIT)

demo.cloudalchemy.org
---------------------

This repository provides an integration testing suite for our ansible roles as well as demo site for grafana, prometheus, alertmanager and node_exporter (possibly more in the future).
Site is provisioned with ansible running every week and on almost all commits to master branch. Everything is fully automated with travis ci pipeline. If you want to check `ansible-playbook` output, go to [last build](https://travis-ci.org/cloudalchemy/demo-site).

Have a look at the configuration file [group_vars/all/vars](group_vars/all/vars).

**We are looking for hosting. Please contact [@paulfantom](https://github.com/paulfantom) if you can arrange VM with 1 vCPU and 512MB of RAM.**

Applications
------------

All applications should be running on their default ports.

| App name          | Address                                                         | Status |
|-------------------|-----------------------------------------------------------------|--------|
| node_exporter     | [demo.cloudalchemy.org:9100/metrics](http://demo.cloudalchemy.org:9100/metrics) | [![Uptime Robot status](https://img.shields.io/uptimerobot/status/m779739001-48f8ed6c3aa6f23da1ec11e2.svg)](http://demo.cloudalchemy.org:9100/metrics) |
| snmp_exporter     | [demo.cloudalchemy.org:9116/metrics](http://demo.cloudalchemy.org:9116/metrics) | [![Uptime Robot status](https://img.shields.io/uptimerobot/status/m779739006-f784bd36e07d328bfacb6d17.svg)](http://demo.cloudalchemy.org:9116/metrics) |
| blackbox_exporter | [demo.cloudalchemy.org:9115/metrics](http://demo.cloudalchemy.org:9115/metrics) | [![Uptime Robot status](https://img.shields.io/uptimerobot/status/m779739004-8447f4012a129e08df4db247.svg)](http://demo.cloudalchemy.org:9115/metrics) |
| prometheus        | [demo.cloudalchemy.org:9090](http://demo.cloudalchemy.org:9090) | [![Uptime Robot status](https://img.shields.io/uptimerobot/status/m779739002-6049a4d9177bdf92d7dce7d9.svg)](http://demo.cloudalchemy.org:9190) |
| alertmanager      | [demo.cloudalchemy.org:9093](http://demo.cloudalchemy.org:9093) | [![Uptime Robot status](https://img.shields.io/uptimerobot/status/m779739005-687f76da143b768d378502f8.svg)](http://demo.cloudalchemy.org:9193) |
| grafana           | [demo.cloudalchemy.org:3000](http://demo.cloudalchemy.org:3000) | [![Uptime Robot status](https://img.shields.io/uptimerobot/status/m779739003-21ce43d565a95d31564b438d.svg)](http://demo.cloudalchemy.org:3000) |

