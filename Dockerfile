FROM node:lts

WORKDIR /docusaurus/clickhouse/

EXPOSE 3000 35729
RUN yarn install

CMD ["yarn", "start"]
