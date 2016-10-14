FROM alpine:3.1

RUN apk --update add collectd collectd-python py-pip git && \
    pip install envtpl

RUN mkdir /usr/share/collectd/plugins && mkdir /usr/share/collectd/plugins/mesos && mkdir /etc/collectd/collectd.conf.d/
RUN git clone https://github.com/guidogutierrez/collectd-mesos.git
RUN mv collectd-mesos/*.py /usr/share/collectd/plugins/mesos/
RUN mv collectd-mesos/*.tpl /etc/collectd/collectd.conf.d/
RUN mv collectd-mesos/collectd.conf /etc/collectd/collectd.conf


COPY ./run.sh /run.sh

ENTRYPOINT ["/run.sh"]
