build:
	@docker build -t openai-playground .

start:
	@docker run \
		--name jupyter \
		-d \
		-e JUPYTER_ENABLE_LAB=yes \
		-p 8888:8888 \
		-v $(PWD)/data:/home/jovyan/data \
		-v $(PWD)/notebooks:/home/jovyan/notebooks \
		openai-playground
	@sleep 3
	@make -s token

token:
	@docker exec -it jupyter jupyter server list

stop:
	@docker stop jupyter
	@docker rm jupyter
