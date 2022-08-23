#!/usr/bin/env bash

# ./filebeat modules disable elasticsearch
./filebeat modules enable logstash
./filebeat modules enable kibana
./filebeat setup

bash -c "/usr/local/bin/docker-entrypoint $*"