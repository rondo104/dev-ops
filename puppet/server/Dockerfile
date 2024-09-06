# Base Image
FROM centos:7

# Set environment variables
ENV PUPPET_SERVER_VERSION=7.0.0

# Use an alternative CentOS mirror
RUN sed -i 's|^mirrorlist=|#mirrorlist=|g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|^#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Base.repo

# Install Puppet Server dependencies
RUN yum update -y && \
    yum install -y epel-release && \
    yum install -y wget curl sudo systemd && \
    yum clean all

# Add Puppet repositories
RUN rpm -Uvh https://yum.puppet.com/puppet7-release-el-7.noarch.rpm && \
    yum install -y puppetserver-${PUPPET_SERVER_VERSION}

# Set up Puppet Server
RUN /opt/puppetlabs/server/bin/puppetserver gem install --no-rdoc --no-ri puppet

# Expose necessary ports
EXPOSE 8140

# Set environment variables for Puppet
ENV PATH="/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:${PATH}"

# Create the entrypoint script for systemd and start Puppet Server
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# Define default command to run Puppet Server
CMD ["/opt/puppetlabs/server/apps/puppetserver/puppetserver", "foreground"]
