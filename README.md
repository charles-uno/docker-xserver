
# To Start: Firefox

Based on instructions [here](https://fredrikaverpil.github.io/2016/07/31/docker-for-mac-and-gui-applications/).

Grab Jessie's Firefox image [here](https://github.com/jessfraz/dockerfiles/tree/master/firefox).

Install XQuartz [here](https://www.xquartz.org/) then open the preferences and allow connections from network clients. This step is necessary because OSX doesn't natively run an X server. Log out, then back in, and start XQuartz with:

```
open -a XQuartz
```

Then, in the Makefile, make the image with:

```
TAG := firefox
docker build . -f Dockerfile -t $(TAG)
```

And run it with:

```
IP := `ifconfig en0 | grep inet | awk '$$1=="inet" {print $$2}'`
xhost + $(IP); docker run -ti --rm -e DISPLAY=$(IP):0 $(TAG)
```
