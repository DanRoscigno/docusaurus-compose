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

### Ensure that the container will run Docusaurus as you

Docusaurus will generate files, and they should be generated with your `UID` and `GID` so that you can manage them outside of the container.  To do this the compose file has a line `user: ${MY_UID}:${MY_GID}`, which will set the UID and GID.  To get this set to your values export them before running `docker compose`.

Export your `UID` and `GID`
user: ${MY_UID}:${MY_GID}

#### build the image

```bash
cd docusaurus-compose 
MY_UID="$(id -u)" MY_GID="$(id -g)" docker compose build
```

Note: If `docker compose` does not work for you try `docker-compose` and if neither work please install `docker-compose` for your version of Docker.  The latest version of Docker has `docker compose` built in, but I think the old Python `docker-compose` probably works fine.

#### Run the compose file

```bash
MY_UID="$(id -u)" MY_GID="$(id -g)" docker compose up
```

See earlier note, you might need `docker-compose up`

### Connect with a browser

You should see a message in the docker compose output about `[SUCCESS] Docusaurus website is running at: http://localhost:3000/docs/`.  Open a browser to the URL presented and you should see the ClickHouse top menu and Page not Found, click on `Docs`

### Test it

Edit a markdown file in either of the ClickHouse repos (pick one under the `docs` dir) and save your edits.  Navigate to the corresponding page in the browser window connected to the Docusaurus container and see if the edits are showing there.
