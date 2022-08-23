FROM docker.elastic.co/beats/metricbeat:8.3.3

ARG METRICBEAT_FILE=./conf/metricbeat/metricbeat.yml
COPY ${METRICBEAT_FILE} /usr/share/metricbeat/metricbeat.yml

USER root

RUN mkdir /var/log/metricbeat \
    && chown root /usr/share/metricbeat/metricbeat.yml \
    && chmod go-w /usr/share/metricbeat/metricbeat.yml \
    && chown root /var/log/metricbeat

COPY ./conf/metricbeat/entrypoint.sh /usr/local/bin/custom-entrypoint
RUN chmod +x /usr/local/bin/custom-entrypoint

USER root

ENTRYPOINT ["/usr/local/bin/custom-entrypoint"]