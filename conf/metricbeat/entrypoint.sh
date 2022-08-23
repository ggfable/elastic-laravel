#!/usr/bin/env bash

./metricbeat modules enable elasticsearch-xpack
./metricbeat modules enable logstash-xpack
# ./metricbeat modules disable beat-xpack
./metricbeat modules enable kibana-xpack
./metricbeat modules enable nginx
./metricbeat setup 

bash -c "/usr/local/bin/docker-entrypoint $*"