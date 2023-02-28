FROM ubuntu:22.04

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y ssh curl wget build-essential && \
    rm -rf /var/lib/apt/lists/*

RUN wget -nv https://julialang-s3.julialang.org/bin/linux/x64/1.9/julia-1.9.0-beta4-linux-x86_64.tar.gz
RUN tar xf julia-1.9.0-beta4-linux-x86_64.tar.gz
RUN rm julia-1.9.0-beta4-linux-x86_64.tar.gz
RUN ln -s /julia-1.9.0-beta4/bin/julia /usr/local/bin/julia
RUN mkdir -p ~/.julia/config

COPY src src
COPY sysimage sysimage
COPY Project.toml Project.toml
COPY Manifest.toml Manifest.toml

RUN julia --project=sysimage -e 'import Pkg; Pkg.build(); include(joinpath("sysimage", "build_sysimage.jl")); build()'
RUN julia -J sysimage/sysimage.so -e 'import Pkg; Pkg.add("Revise")'
RUN julia --project -J sysimage/sysimage.so -e 'using Revise'
