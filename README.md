# README

## Cloudwalk Assestment

Technical challenge for Cloudwalk company

## Dependencies

The following dependencies are required to run the project:
- `docker`
- `docker-compose`

## Getting Started

Setup the databases and build the project by running:

```
$ make setup
```

## Database setup

Setup databases and migrations

```bash
make setup
```

## Testing the API

You can run all containers with:

```
make start
```

And check if the service is up by running:

```
make check
```

If everything is up, you are ready to test the code!

## Tests

If you want to run a test suite, for example, just run:

```
make test
```
