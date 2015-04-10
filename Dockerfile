FROM silarsis/base
MAINTAINER Michael Kunzmann

ENV SAP_PROXY=http://proxy.wdf.sap.corp:8080

RUN http_proxy=$SAP_PROXY https_proxy=$SAP_PROXY apt-get -yq update

RUN http_proxy=$SAP_PROXY https_proxy=$SAP_PROXY apt-get -yq install squid iptables
ADD squid.conf /etc/squid3/squid.conf
ADD start_squid.sh /usr/local/bin/start_squid.sh

EXPOSE 3128

CMD ["/usr/local/bin/start_squid.sh"]
