FROM docker.elastic.co/beats/filebeat:8.3.3

ARG FILEBEAT_FILE=./conf/filebeat/conf/filebeat.yml
COPY ${FILEBEAT_FILE} /usr/share/filebeat/filebeat.yml

USER root

RUN mkdir /var/log/filebeat \
    && chown root /usr/share/filebeat/filebeat.yml \
    && chmod go-w /usr/share/filebeat/filebeat.yml \
    && chown root /var/log/filebeat

COPY ./conf/filebeat/entrypoint.sh /usr/local/bin/custom-entrypoint
RUN chmod +x /usr/local/bin/custom-entrypoint

ENTRYPOINT ["/usr/local/bin/custom-entrypoint"]