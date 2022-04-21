FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift@sha256:eaef7e4dce017464ad1183d51a9cddc38cddcb0609bb323d5567684f0935b8c2

USER root


RUN yum install xorg-x11-fonts-75dpi
RUN yum -y install libjpeg libXrender libXext 


USER 185
