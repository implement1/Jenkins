FROM postgres:11
RUN apt-get update \
 && apt-get install --no-install-recommends -y postgresql-${PG_MAJOR}-pglogical \
 && apt-get install --no-install-recommends -y postgresql-${PG_MAJOR}-ip4r \
 && rm -rf /var/lib/apt/lists/*
ADD pgEntrypoint.sh /pgEntrypoint.sh
ENTRYPOINT ["bash", "/pgEntrypoint.sh"]
