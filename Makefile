
TAG := stele-image

IP := `ifconfig en0 | grep inet | awk '$$1=="inet" {print $$2}'`

image:
	docker build . -f Dockerfile -t $(TAG)

refresh:
	docker build . -f Dockerfile -t $(TAG) --no-cache

run:
	xhost + $(IP); docker run -ti --rm -e DISPLAY=$(IP):0 $(TAG)
