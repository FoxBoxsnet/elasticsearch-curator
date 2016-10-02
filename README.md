# airforon/elasticsearch-curator
![License MIT](https://img.shields.io/badge/license-MIT-blue.svg) [![](https://img.shields.io/docker/stars/airforon/elasticsearch-curator.svg)](https://hub.docker.com/r/airforon/elasticsearch-curator/ 'DockerHub') [![](https://img.shields.io/docker/pulls/airforon/elasticsearch-curator.svg)](https://hub.docker.com/r/airforon/elasticsearch-curator/ 'DockerHub') [![](https://images.microbadger.com/badges/image/airforon/elasticsearch-curator.svg)](https://microbadger.com/images/airforon/elasticsearch-curator)


## How To
```
version: '2'

services:
  elasticsearch:
  image: airforon/elasticsearch
  container_name: elasticsearch
  ports:
    - 9200:9200
  environment:
    CLUSTER_NAME: "es"
    NODE_NAME: "node0"
    NODE_RACK: "es1"
  elasticsearch-curator:
  image: airforon/elasticsearch-curator
  container_name: elasticsearch-curator
  environment:
    CU_HOST: "elasticsearch"
    CU_PREFIX: "logstash"
    CU_CLOSE_DAY: "45"
    CU_DELETE_DAY: "60"
  links:
    - elasticsearch:elasticsearch
```

| Name | Description |
|:-----|:---|
| `CU_HOST` | elasticsearch host (default: elasticsearch)|
| `CU_PREFIX` | elasticsearch index prefix (default: logstash)
| `CU_CLOSE_DAY` | elasticsearch index close (default: 30days)
| `CU_DELETE_DAY` | elasticsearch index delete (default: 60days)
