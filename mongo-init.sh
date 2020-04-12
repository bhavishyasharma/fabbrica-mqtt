#!/bin/bash
set -e

mongo <<EOF
use admin
db.createUser(
  {
      user: '$API_DB_USER',
      pwd: '$API_DB_PASSWORD',
      roles: [
          {
              role: "readWrite",
              db: '$MONGO_INITDB_DATABASE'
          }
      ]
  }
);
db.createUser(
  {
      user: '$EMQX_DB_USER',
      pwd: '$EMQX_DB_PASSWORD',
      roles: [
          {
              role: "read",
              db: '$MONGO_INITDB_DATABASE'
          }
      ]
  }
);
EOF