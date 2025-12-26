FROM dhi.io/python:3.14-dev AS base

FROM base AS builder

RUN apt update && apt install gcc -y

COPY ./requirements.txt ./

RUN python3 -m pip install -U pip

RUN python3 -m pip install --no-cache-dir --prefix="/build" -U -r ./requirements.txt

FROM base

ENV OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
ENV PYTHONUNBUFFERED=1

RUN echo 'path-exclude=/usr/share/doc/*' >> /etc/dpkg/dpkg.cfg.d/01_nodoc && \
    echo 'path-exclude=/usr/share/man/*' >> /etc/dpkg/dpkg.cfg.d/01_nodoc && \
    echo 'path-exclude=/usr/share/groff/*' >> /etc/dpkg/dpkg.cfg.d/01_nodoc && \
    echo 'path-exclude=/usr/share/info/*' >> /etc/dpkg/dpkg.cfg.d/01_nodoc && \
    apt update && apt full-upgrade --no-install-recommends --no-install-suggests -y && \
    apt install git curl sshpass openssh-client jq --no-install-recommends --no-install-suggests -y && \
    apt clean && \
    update-ca-certificates --fresh && \
    find /usr/share/locale -mindepth 1 -maxdepth 1 ! -name 'en_US' ! -name 'en_GB' ! -name 'pt_PT' ! -name 'locale.alias' -exec rm -rf {} + && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apt/* /var/lib/apt/lists/* /usr/share/doc/* /usr/share/man/* /usr/share/groff/* /usr/share/info/* && \
    sync

COPY ./requirements.yml ./

COPY --from=builder /build /opt/python

RUN ansible-galaxy collection install -r ./requirements.yml &&\
    find /opt/python -type f \( -name '*.pyc' -o -name '*.pyo' \) -delete &&\
    find /opt/python -type d -name __pycache__ -delete &&\
    sync

CMD ["/bin/bash"]
