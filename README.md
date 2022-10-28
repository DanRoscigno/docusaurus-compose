# docusaurus-compose

Compose file and Dockerfile to render and serve the ClickHouse docs in a dev environment.

A big hassle when writing docs for ClickHouse is copying the right file into the right place from `ClickHouse/ClickHouse/docs` to `clickhouse-docs/docs` and keeping things current.  What if docker-compose mounted the right things in the right place and we never had to copy files around by hand?  And what if the continer built the pages for us on the fly?

## Using docker compose to put everything in place

0. Clone the ClickHouse repos if you do not have them:

```bash
git clone ...
git clone ...
```

1. clone this repo into the same directory as you have `ClickHouse/ClickHouse` and `ClickHouse/clickhouse-docs`

  Note: once this is tested I will add it to `ClickHouse/clickhouse-docs`

1. build the image

```bash
docker compose build
```

Note: If `docker compose` does not work for you try `docker-compose` and if neither work please install `docker-compose` for your version of Docker.  The latest version of Docker has `docker compose` built in, but I think the old Python `docker-compose` probably works fine.

1. Run the compose file

```bash
docker compose up
```

See earlier note, you might need `docker-compose up`

1. Connect with a browser

You should see a message in the docker compose output about `[SUCCESS] Docusaurus website is running at: http://localhost:3000/docs/`.  Open a browser to the URL presented and you should see the ClickHouse top menu and Page not Found, click on `Docs`
