FROM postgres:9.4.19
MAINTAINER pat
#ENV POSTGRES_USER admin  
#ENV POSTGRES_PASSWORD password  

EXPOSE 5432

COPY pg_hba.conf /etc/postgresql/9.4/main/
#COPY dump.sql /docker-entrypoint-initdb.d/
COPY dump.sql /
WORKDIR /
CMD ["psql","-U","postgres","-f","dump.sql"]
