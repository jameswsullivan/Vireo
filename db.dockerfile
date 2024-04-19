FROM postgres:9.5.7

# Set locale to UTF8.
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

ENV POSTGRES_PASSWORD 1234
ENV PGDATA "/var/lib/postgresql/data/pgdata"

RUN mkdir /home/postgres && \
    touch /home/postgres/.psql_history && \
    chown postgres:postgres /home/postgres/.psql_history && \
    chmod 755 /home/postgres/.psql_history

COPY init.sql /docker-entrypoint-initdb.d/