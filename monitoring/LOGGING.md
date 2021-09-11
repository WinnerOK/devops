# Logging

## Screenshots

Promtail targets set up:
![](./images/logging/prom_tail_targets.png)

Container discovery at explorer:
![](./images/logging/loki_discovery.png)

Logs from python application:
![](./images/logging/python_app_logs.png)

## Best practices

- Perform log rotation. It can be done on docker-level ([logging](https://docs.docker.com/config/containers/logging/configure/) option) or application level
  (for python there is a [RotatingFileHandler](https://docs.python.org/3/library/logging.handlers.html#rotatingfilehandler)
  in default `logging` library)

- Use common log format for applications to simplify further log parsing and searching

- Backup long-term logs in external storage. I.e: S3 bucket.

- Make sure you never compromise sensitive data in logs.
