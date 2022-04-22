FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift@sha256:eaef7e4dce017464ad1183d51a9cddc38cddcb0609bb323d5567684f0935b8c2

USER root
# Copy entitlements
COPY ./etc-pki-entitlement /etc/pki/entitlement
# Copy subscription manager configurations
COPY ./rhsm-conf /etc/rhsm
COPY ./rhsm-ca /etc/rhsm/ca
# Delete /etc/rhsm-host to use entitlements from the build container
RUN rm /etc/rhsm-host && \
    # Initialize /etc/yum.repos.d/redhat.repo
    # See https://access.redhat.com/solutions/1443553
    yum repolist --disablerepo=* && \
    subscription-manager repos --enable=rhel-7-server-rpms && \
    subscription-manager repos --enable=rhel-7-server-optional-rpms && \
    yum -y update && \
    yum install libpng16-16
    


USER 185
