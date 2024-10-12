all: 
	mkdir -p /home/blebas/data/wordpress /home/blebas/data/mysql
	@docker-compose -f ./srcs/docker-compose.yml up

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f srcs/docker-compose.yml up --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	sudo rm -rf /home/blebas/data/mysql /home/blebas/data/wordpress

.PHONY: all re down clean

# sudo nano /etc/hosts
