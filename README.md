# Kong and the Great Timestamp Discontent

## Notes

This uses Kong `0.8.3` and Postgres `9.4`

## Start

To start Kong and PG instance, run `make run`

This exposes the management API on `<docker ip>:8001` and the Postgres instance on `<docker ip>:5432`

## Test

1. Create a new API (substitute the `docker-machine` command for `localhost` if running via Docker Native): 
  `make create-api DOCKER_IP=$(docker-machine ip default)` 
1. Attempt to update using the same `created_at` timestamp method as the create action: 
  `make update-api-error DOCKER_IP=$(docker-machine ip default) API_ID=<id generated from prior command>`
1. Update instance using the epoch time format (as an integer): 
  `make update-api DOCKER_IP=$(docker-machine ip default) API_ID=<id generated from prior command>`

## Logs

You can tail the Kong logs using `make logs`
