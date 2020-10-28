FROM centos:7

RUN yum -y upgrade
RUN curl -LsS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash
RUN yum install -y MariaDB-server

ADD my.cnf /etc/my.cnf
RUN chmod 664 /etc/my.cnf
ADD setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 3306
CMD ["/usr/local/bin/setup.sh"]
