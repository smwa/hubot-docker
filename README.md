# hubot-docker

Hubot script for managing docker containers

See [`src/docker.coffee`](src/docker.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-docker --save`

Then add **hubot-docker** to your `external-scripts.json`:

```json
[
  "hubot-docker"
]
```

## Sample Interaction

```
user1>> hubot docker ps
hubot>> containername: Up for 2 weeks
```

```
user1>> hubot docker restart containername
hubot>> Restarting containername...
hubot>> containername
```
