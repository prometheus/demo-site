# Prometheus demo monitoring site

[![Build Status](https://travis-ci.org/prometheus/demo-site.svg?branch=master)](https://travis-ci.org/prometheus/demo-site)
[![License](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg)](https://opensource.org/licenses/MIT)
[![IRC](https://img.shields.io/badge/chat-on%20freenode-blue.svg)](http://webchat.freenode.net/?channels=prometheus)

## [demo.prometheus.io](https://demo.prometheus.io)

This repository provides an integration testing suite for our ansible roles as well as a demo site for [grafana](https://github.com/grafana/grafana), [prometheus](https://github.com/prometheus/prometheus), [alertmanager](https://github.com/prometheus/alertmanager) and [node_exporter](https://github.com/prometheus/node_exporter) (possibly more in the future).
Site is provisioned with ansible running every day and on almost all commits to master branch. Everything is fully automated with travis ci pipeline. If you want to check `ansible-playbook` output, go to [last build](https://travis-ci.org/prometheus/demo-site).

Have a look at the configuration file [group_vars/all/vars](group_vars/all/vars).

This demo site is powered by [Cloud Alchemy](https://github.com/cloudalchemy).

## Applications

All applications should be running on their default ports.

| App name          | Address (HTTP)                                       | Address (HTTPS)                                           |
|-------------------|------------------------------------------------------|-----------------------------------------------------------|
| node_exporter     | [demo.prometheus.io:9100][node_exporter_http]     | [node.demo.prometheus.io][node_exporter_https]         |
| snmp_exporter     | [demo.prometheus.io:9116][snmp_exporter_http]     | [snmp.demo.prometheus.io][snmp_exporter_https]         |
| blackbox_exporter | [demo.prometheus.io:9115][blackbox_exporter_http] | [blackbox.demo.prometheus.io][blackbox_exporter_https] |
| prometheus        | [demo.prometheus.io:9090][prometheus_http]        | [prometheus.demo.prometheus.io][prometheus_https]      |
| alertmanager      | [demo.prometheus.io:9093][alertmanager_http]      | [alertmanager.demo.prometheus.io][alertmanager_https]  |
| grafana           | [demo.prometheus.io:3000][grafana_http]           | [grafana.demo.prometheus.io][grafana_https]            |

## Important notice

This repository consists of two playbooks:
  - [site.yml](site.yml) - which deploys basic prometheus/grafana stack without additional http proxies and with software listening on default ports
  - [extras.yml](extras.yml) - adds random_exporter and deploys caddy http proxy to allow HTTPS connections to services like prometheus

Such setup causes that mose of services can be accessed in two ways. As an example, prometheus can be accessed via:
  - **http**://demo.prometheus.io:9090 - default way
  - **https**://prometheus.prometheus.io - workaround which in backgroud communicates with prometheus via insecure, "default" channel mentioned above

This workaround was needed to solve issue [#13](https://github.com/cloudalchemy/demo-site/issues/13) and still provide a playbook which could be used by everyone - [site.yml](site.yml).

## Run yourself

You can easily run such setup yourself without much knowledge how any part of this works. You just need to do two things:

#### Change ansible inventory

First of all you need to configure your inventory, ours is located in [`hosts`](hosts) file. Here you set up your target hosts by changing value of `ansible_host` variable. Also here you can exclude parts of this demo site, so if you don't need our website, you just remove this part:

```
[web]
demo
```

Accordingly you can exclude grafana, prometheus.

#### Change passwords

For security measures we encrypted some of our passwords, but it is easy to use yours! You can do it by replacing a file located at [`group_vars/all/vault`](group_vars/all/vault) with following content:

```
vault_grafana_password: <<INSERT_YOUR_GRAFANA_PASSWORD>>
```

You need to specify both even if you don't use grafana. You can look over [`group_vars/all/vault`](group_vars/all/vars) to find why.

#### Run as usual Ansible playbook

```bash
# Download roles
ansible-galaxy install -r roles/requirements.yml

# Run playbook
ansible-playbook site.yml
# or when using vault encrypted variables
ansible-playbook --vault-id @prompt site.yml
```

# 

[![DigitalOcean](https://snapshooter.io/powered_by_digital_ocean.png)](https://digitalocean.com)



[node_exporter_http]: http://demo.cloudalchemy.org:9100
[node_exporter_https]: https://node.demo.cloudalchemy.org

[snmp_exporter_http]: http://demo.cloudalchemy.org:9116
[snmp_exporter_https]: https://snmp.demo.cloudalchemy.org

[blackbox_exporter_http]: http://demo.cloudalchemy.org:9115
[blackbox_exporter_https]: https://blackbox.demo.cloudalchemy.org

[prometheus_http]: http://demo.cloudalchemy.org:9090
[prometheus_https]: https://prometheus.demo.cloudalchemy.org

[alertmanager_http]: http://demo.cloudalchemy.org:9093
[alertmanager_https]: https://alertmanager.demo.cloudalchemy.org

[grafana_http]: http://demo.cloudalchemy.org:3000
[grafana_https]: https://grafana.demo.cloudalchemy.org
