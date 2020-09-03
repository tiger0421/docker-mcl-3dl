FROM tiger0421/ros-gpu-gazebo:1.0-glvnd-runtime-ubuntu18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=melodic

WORKDIR /root/catkin_ws/src
RUN git clone https://github.com/at-wat/mcl_3dl.git && \
    git clone https://github.com/at-wat/mcl_3dl_msgs.git

WORKDIR /root/catkin_ws
RUN apt update && \
    rosdep init && \
    rosdep update && \
    rosdep install --from-paths src --ignore-src -y && \
    bash -c "source /opt/ros/melodic/setup.bash && catkin build" \
    && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo /root/catkin_ws/devel/setup.bash >> /root/.bashrc

WORKDIR /root
CMD ["/bin/bash"]
