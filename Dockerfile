FROM mambaorg/micromamba:2.0.5

COPY --chown=$MAMBA_USER:$MAMBA_USER binder/environment.yml /tmp/environment.yml

RUN micromamba install -y -n base -f /tmp/environment.yml && \
    micromamba clean --all --yes
