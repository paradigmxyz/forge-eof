FROM ubuntu:jammy-20240212 as solc-builder

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    cmake \
    git \
    libboost-all-dev \
    && \
    update-ca-certificates

COPY patches /app/patches
COPY .git /app/.git
COPY .gitmodules /app

WORKDIR /app

RUN git submodule init && git submodule update --recursive

WORKDIR /app/patches/solidity

RUN mkdir build && \
    cd build && \
    ls -al /app/patches/solidity && \
    cmake .. -DCMAKE_BUILD_TYPE=Release \
             -DCMAKE_CXX_FLAGS="-Wno-error=conversion" && \
    make solc

FROM ubuntu:jammy-20240212

# Copy the compiled solc binary to a standard location
COPY --from=solc-builder /app/patches/solidity/build/solc/solc /usr/local/bin/solc
RUN chmod +x /usr/local/bin/solc

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git && \
    curl -L https://foundry.paradigm.xyz | bash && \
    ~/.foundry/bin/foundryup && \
    cp ~/.foundry/bin/* /usr/local/bin
ENV PATH="${HOME}/.foundry/bin:${PATH}"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY solc-eof.sh /usr/local/bin/solc-eof.sh
RUN chmod +x /usr/local/bin/solc-eof.sh

COPY solc-legacy.sh /usr/local/bin/solc-legacy.sh
RUN chmod +x /usr/local/bin/solc-legacy.sh

EXPOSE 8545

ENTRYPOINT ["/entrypoint.sh"]
