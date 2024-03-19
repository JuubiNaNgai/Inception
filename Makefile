all:
	docker-compose -f srcs/docker-compose.yml up -d --build
	
stop:
	docker-compose -f srcs/docker-compose.yml stop

clean:
	docker-compose -f srcs/docker-compose.yml down -v

fclean:
	docker system prune -af
	
eval:
	docker stop $$(docker ps -qa)
	docker rm $$(docker ps -qa)
	docker rmi -f $$(docker images -qa)
	docker volume rm $$(docker volume ls -q)
	docker network rm $$(docker network ls -q) 2>/dev/null
	
reboot:
	docker-compose -f srcs/docker-compose.yml down
	docker-compose -f srcs/docker-compose.yml up -d --build
