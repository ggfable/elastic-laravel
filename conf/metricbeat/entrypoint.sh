#!/usr/bin/env bash

./metricbeat modules enable elasticsearch-xpack
./metricbeat modules enable kibana-xpack
./metricbeat modules enable nginx

bash -c "/usr/local/bin/docker-entrypoint $*"