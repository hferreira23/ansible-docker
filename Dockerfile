FROM python:3.12-slim AS base

FROM base AS builder

RUN apt update && apt install gcc -y

COPY ./requirements.txt ./

RUN python3 -m pip install -U pip

RUN python3 -m pip install --prefix="/build" -U -r ./requirements.txt

FROM base

ENV OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
ENV PYTHONUNBUFFERED=1

RUN apt update && apt full-upgrade -y && \
    apt install -y git curl sshpass openssh-client jq --no-install-recommends && \
    update-ca-certificates --fresh && \
    rm -rf /tmp/* /var/tmp/* /var/cache/* && \
    sync

COPY ./requirements.yml ./

COPY --from=builder /build /usr/local

RUN ansible-galaxy collection install -r ./requirements.yml

CMD ["/bin/bash"]
