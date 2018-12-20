FROM postgres:9.5.15
MAINTAINER pat
#ENV POSTGRES_USER admin  
#ENV POSTGRES_PASSWORD password  
#ENV POSTGRES_DB app_staging

EXPOSE 5432

ADD pg_hba.conf /etc/postgresql/9.5/main/
ADD dump.sql /docker-entrypoint-initdb.d/
