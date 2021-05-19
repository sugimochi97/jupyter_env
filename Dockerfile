FROM ubuntu:latest
RUN touch test
RUN apt update && apt upgrade
RUN apt install -y wget
WORKDIR /opt
RUN wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
# RUN export PATH=/opt/anaconda3/bin:$PATH
CMD ["bash"]