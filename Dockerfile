FROM ubuntu:latest
RUN apt update && apt upgrade -y && apt install -y wget
WORKDIR /opt
RUN wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh \
        https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.2-linux-x86_64.tar.gz && \
    sh Anaconda3-2021.05-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    tar -zxvf julia-1.6.2-linux-x86_64.tar.gz && \
    rm -f Anaconda3-2021.05-Linux-x86_64.sh julia-1.6.2-linux-x86_64.tar.gz
ENV PATH /opt/anaconda3/bin:/opt/julia-1.6.2/bin:$PATH
RUN julia -e 'using Pkg; Pkg.add("IJulia"); using IJulia'
WORKDIR /
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]