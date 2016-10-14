FROM ubuntu:14.04
RUN apt-get update && apt-get install -y git collectd python-pip
RUN mkdir /usr/share/collectd/plugins && mkdir /usr/share/collectd/plugins/mesos
RUN git clone https://github.com/guidogutierrez/collectd-mesos.git
RUN mv collectd-mesos/*.py /usr/share/collectd/plugins/mesos/
RUN mv collectd-mesos/*tpl /etc/collectd/collectd.conf.d/
RUN mv collectd-mesos/collectd.conf /etc/collectd/collectd.conf
RUN pip install envtpl

COPY ./run.sh /run.sh

ENTRYPOINT ["/run.sh"]
