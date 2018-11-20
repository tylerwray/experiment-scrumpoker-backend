build:
	docker build -t scrumpoker:local .

start: build
	docker run -it scrumpoker:local
