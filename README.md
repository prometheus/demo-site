# Prometheus demo monitoring site

[![Build Status](https://travis-ci.org/prometheus/demo-site.svg?branch=master)](https://travis-ci.org/prometheus/demo-site)
[![License](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg)](https://opensource.org/licenses/MIT)
[![IRC](https://img.shields.io/badge/chat-on%20freenode-blue.svg)](http://webchat.freenode.net/?channels=prometheus)

## [demo.prometheus.io](https://demo.prometheus.io)

This repository provides an integration testing suite for our ansible roles as well as a demo site for [grafana](https://github.com/grafana/grafana), [prometheus](https://github.com/prometheus/prometheus), [alertmanager](https://github.com/prometheus/alertmanager) and [node_exporter](https://github.com/prometheus/node_exporter) (possibly more in the future).
Site is provisioned with ansible running every day and on almost all commits to master branch. Everything is fully automated with travis ci pipeline. If you want to check `ansible-playbook` output, go to [last build](https://travis-ci.org/prometheus/demo-site) or visit [ARA Records Ansible page](https://demo.prometheus.io/ara).

Have a look at the configuration file [group_vars/all/vars](group_vars/all/vars).

This demo site is powered by [Cloud Alchemy](https://github.com/cloudalchemy).

## Applications

All applications should be running on their default ports.

| App name          | Address                                                         | Status |  Uptime  |
|-------------------|-----------------------------------------------------------------|--------|----------|
| node_exporter     | [demo.prometheus.io:9100](http://demo.prometheus.io:9100) | [![Uptime Robot status](https://img.shields.io/uptimerobot/status/m779739001-48f8ed6c3aa6f23da1ec11e2.svg)](http://demo.prometheus.io:9100) | [![Uptime Robot status](https://img.shields.io/uptimerobot/ratio/7/m779739001-48f8ed6c3aa6f23da1ec11e2.svg)](http://demo.prometheus.io:9100) |
| snmp_exporter     | [demo.prometheus.io:9116](http://demo.prometheus.io:9116) | [![Uptime Robot status](https://img.shields.io/uptimerobot/status/m779739006-f784bd36e07d328bfacb6d17.svg)](http://demo.prometheus.io:9116) | [![Uptime Robot status](https://img.shields.io/uptimerobot/ratio/7/m779739006-f784bd36e07d328bfacb6d17.svg)](http://demo.prometheus.io:9116) |
| blackbox_exporter | [demo.prometheus.io:9115](http://demo.prometheus.io:9115) | [![Uptime Robot status](https://img.shields.io/uptimerobot/status/m779739004-8447f4012a129e08df4db247.svg)](http://demo.prometheus.io:9115) | [![Uptime Robot status](https://img.shields.io/uptimerobot/ratio/7/m779739004-8447f4012a129e08df4db247.svg)](http://demo.prometheus.io:9115) |
| prometheus        | [demo.prometheus.io:9090](http://demo.prometheus.io:9090) | [![Uptime Robot status](https://img.shields.io/uptimerobot/status/m779739002-6049a4d9177bdf92d7dce7d9.svg)](http://demo.prometheus.io:9190) | [![Uptime Robot status](https://img.shields.io/uptimerobot/ratio/7/m779739002-6049a4d9177bdf92d7dce7d9.svg)](http://demo.prometheus.io:9090) |
| alertmanager      | [demo.prometheus.io:9093](http://demo.prometheus.io:9093) | [![Uptime Robot status](https://img.shields.io/uptimerobot/status/m779739005-687f76da143b768d378502f8.svg)](http://demo.prometheus.io:9193) | [![Uptime Robot status](https://img.shields.io/uptimerobot/ratio/7/m779739005-687f76da143b768d378502f8.svg)](http://demo.prometheus.io:9193) |
| grafana           | [demo.prometheus.io:3000](http://demo.prometheus.io:3000) | [![Uptime Robot status](https://img.shields.io/uptimerobot/status/m779739003-21ce43d565a95d31564b438d.svg)](http://demo.prometheus.io:3000) | [![Uptime Robot status](https://img.shields.io/uptimerobot/ratio/7/m779739003-21ce43d565a95d31564b438d.svg)](http://demo.prometheus.io:3000) |

## Run yourself

You can easily run such setup yourself without much knowledge how any part of this works. You just need to do two things:

#### Change ansible inventory

First of all you need to configure your inventory, ours is located in [`hosts`](hosts) file. Here you set up your target hosts by changing value of `ansible_host` variable. Also here you can exclude parts of this demo site, so if you don't need our website, you just remove this part:

```
[web]
demo
```

Accordingly you can exclude grafana, prometheus, or influxdb.

#### Change passwords

For security measures we encrypted some of our passwords, but it is easy to use yours! You can do it by replacing a file located at [`group_vars/all/vault`](group_vars/all/vault) with following content:

```
vault_grafana_password: <<INSERT_YOUR_GRAFANA_PASSWORD>>
vault_influxdb_password <<INSERT_YOUR_INFLUXDB_PASSWORD>>
```

You need to specify both even if you don't use grafana nor influxdb. You can look over [`group_vars/all/vault`](group_vars/all/vars) to find why.

# 

[![DigitalOcean](https://snapshooter.io/powered_by_digital_ocean.png)](https://digitalocean.com)
