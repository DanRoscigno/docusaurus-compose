# docusaurus-compose

Compose file and Dockerfile to render and serve the ClickHouse docs in a dev environment.

A big hassle when writing docs for ClickHouse is copying the right file into the right place from `ClickHouse/ClickHouse/docs` to `clickhouse-docs/docs` and keeping things current.  What if docker-compose mounted the right things in the right place and we never had to copy files around by hand?  And what if the continer built the pages for us on the fly?

## Using docker compose to put everything in place

### Clone the repos:

The ClickHouse and clickhouse-docs repos:
```bash
git clone git@github.com:ClickHouse/ClickHouse.git
git clone git@github.com:ClickHouse/clickhouse-docs.git
```

This repo:
```bash
git clone git@github.com:DanRoscigno/docusaurus-compose.git
```

  Note: once this is tested I will add it to `ClickHouse/clickhouse-docs`

### build the image

```bash
cd docusaurus-compose 
docker compose build
```

Note: If `docker compose` does not work for you try `docker-compose` and if neither work please install `docker-compose` for your version of Docker.  The latest version of Docker has `docker compose` built in, but I think the old Python `docker-compose` probably works fine.

### Run the compose file

```bash
docker compose up
```

See earlier note, you might need `docker-compose up`

### Connect with a browser

You should see a message in the docker compose output about `[SUCCESS] Docusaurus website is running at: http://localhost:3000/docs/`.  Open a browser to the URL presented and you should see the ClickHouse top menu and Page not Found, click on `Docs`

### Test it

Edit a markdown file in either of the ClickHouse repos (pick one under the `docs` dir) and save your edits.  Navigate to the corresponding page in the browser window connected to the Docusaurus container and see if the edits are showing there.
