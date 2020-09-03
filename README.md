# docker-mcl-3dl

## Usaage
```
$ docker run --rm -it --net host tiger0421/mcl_3dl /bin/bash
```

You can use the script below, if you want to use rviz in a container
launch.sh
```
#!/bin/sh
xhost +local:root

docker run -it --rm --name ros \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    --gpus all \
    tiger0421/mcl_3dl \
    /bin/bash

xhost -local:root
```
