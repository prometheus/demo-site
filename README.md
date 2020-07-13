# Prometheus monitoring demo site

[![Build Status](https://circleci.com/gh/prometheus/demo-site.svg?style=svg)](https://circleci.com/gh/prometheus/demo-site)
[![License](https://img.shields.io/badge/license-Apache%20License-brightgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![IRC](https://img.shields.io/badge/chat-on%20freenode-blue.svg)](http://webchat.freenode.net/?channels=prometheus)

## [demo.do.prometheus.io](https://demo.do.prometheus.io)

This repository provides a demo site for [prometheus](https://github.com/prometheus/prometheus), [alertmanager](https://github.com/prometheus/alertmanager), prometheus exporters, and [grafana](https://github.com/grafana/grafana).
Site is provisioned with ansible running every day and on all commits to master branch. Everything is fully automated with travis ci pipeline. If you want to check `ansible-playbook` output, go to [last build](https://travis-ci.org/prometheus/demo-site).

Have a look at configuration files in [group_vars/](group_vars).

## Applications

All applications should be running on their default ports.

| App name          | Address (HTTP)                                       | Address (HTTPS)                                           |
|-------------------|------------------------------------------------------|-----------------------------------------------------------|
| node_exporter     | [demo.do.prometheus.io:9100][node_exporter_http]     | [node.demo.do.prometheus.io][node_exporter_https]         |
| prometheus        | [demo.do.prometheus.io:9090][prometheus_http]        | [prometheus.demo.do.prometheus.io][prometheus_https]      |
| alertmanager      | [demo.do.prometheus.io:9093][alertmanager_http]      | [alertmanager.demo.do.prometheus.io][alertmanager_https]  |
| grafana           | [demo.do.prometheus.io:3000][grafana_http]           | [grafana.demo.do.prometheus.io][grafana_https]            |

## Important notice

Before running, golang is required to be installed on deployer machine (neccessary to install random_exporter).

Most services can be accessed in two ways (links in [Applications](#Applications) section. As an example, prometheus can be accessed via:
  - **http**://demo.do.prometheus.io:9090 - default way
  - **https**://prometheus.do.prometheus.io - workaround which in backgroud communicates with prometheus via insecure, "default" channel mentioned above

This workaround was needed to solve issue [cloudalchemy/demo-site#13](https://github.com/cloudalchemy/demo-site/issues/13).

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

For security measures we encrypted some of our passwords, but it is easy to use yours! You can do it by replacing a file located at [`group_vars/grafana/vault`](group_vars/grafana/vault) with following content:

```
vault_grafana_password: <<INSERT_YOUR_GRAFANA_PASSWORD>>
```

#### Download the 'random' exporter binary

You will have to manually run `go` command to download & copy the [`random`](https://github.com/prometheus/client_golang/tree/master/examples/random) exporter binary to [`playbooks/files`](playbooks/files) directory.

- The binary will be downloaded at `GOPATH` location. The value of `GOPATH` can be found by running `go env|grep GOPATH` command on your system.

```
go get -u github.com/prometheus/client_golang/examples/random
cp <GOPATH>/bin/random /path/to/demo-site/playbooks/files/
```

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

demo site is deployed using [Cloud Alchemy](https://github.com/cloudalchemy) ansible roles.

[![DigitalOcean](https://snapshooter.io/powered_by_digital_ocean.png)](https://digitalocean.com)



[node_exporter_http]: http://demo.do.prometheus.io:9100
[node_exporter_https]: https://node.demo.do.prometheus.io

[prometheus_http]: http://demo.do.prometheus.io:9090
[prometheus_https]: https://prometheus.demo.do.prometheus.io

[alertmanager_http]: http://demo.do.prometheus.io:9093
[alertmanager_https]: https://alertmanager.demo.do.prometheus.io

[grafana_http]: http://demo.do.prometheus.io:3000
[grafana_https]: https://grafana.demo.do.prometheus.io
