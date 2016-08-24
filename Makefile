setup:
	docker-compose build

run: setup
	docker-compose up

logs:
	docker exec -it kongfail_app_1 tail -f /usr/local/kong/logs/error.log

create-api:
	curl -X "POST" "http://${DOCKER_IP}:8001/apis" \
	  -H "Content-Type: application/json" \
	  -d "{\"created_at\":\"now\",\"name\":\"profiles\",\"request_path\":\"/profiles\",\"strip_request_path\":true,\"upstream_url\":\"http://profiles.com/profiles\"}"

update-api-error:
	curl -X "PUT" "http://${DOCKER_IP}:8001/apis" \
 	  -H "Content-Type: application/json" \
	  -d "{\"created_at\":\"now\",\"id\":\"${API_ID}\",\"name\":\"profiles\",\"request_path\":\"/profiles\",\"strip_request_path\":true,\"upstream_url\":\"http://profiles.priv/priv/profiles\"}"

update-api:
	curl -X "PUT" "http://${DOCKER_IP}:8001/apis" \
 	  -H "Content-Type: application/json" \
	  -d "{\"created_at\":$(shell date +'%s'),\"id\":\"${API_ID}\",\"name\":\"profiles\",\"request_path\":\"/profiles\",\"strip_request_path\":true,\"upstream_url\":\"http://profiles.priv/priv/profiles\"}"

delete-api:
	curl -X "DELETE" "http://${DOCKER_IP}:8001/apis/${API_ID}"
