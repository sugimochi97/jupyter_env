FROM ubuntu:latest
RUN touch test
RUN apt update && apt upgrade
RUN apt install -y wget
WORKDIR /opt
RUN wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh && \
    sh Anaconda3-2021.05-Linux-x86_64.sh -b -p /opt/anaconda3
ENV PATH /opt/anaconda3/bin:$PATH
WORKDIR /
CMD ["jupyter" "lab" "--ip=0.0.0.0" " --allow-root" "-LabApp.token=="]