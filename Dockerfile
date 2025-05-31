# ------------------------------
# Base image from Jupyter stack
# ------------------------------
FROM quay.io/jupyter/base-notebook:latest

# ------------------------------
# 1. Switch to root to install system packages
# ------------------------------
USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ------------------------------
# 2. Install conda packages into base env
# ------------------------------
RUN mamba install -n base -c conda-forge -y \
    gdal \
    proj \
    geos \
    pyproj \
    geospatial \
    && mamba clean --all --yes \
    && fix-permissions $CONDA_DIR

# ------------------------------
# 3. Set geospatial environment variables
# ------------------------------
ENV PROJ_LIB=$CONDA_DIR/share/proj \
    GDAL_DATA=$CONDA_DIR/share/gdal \
    LOCALTILESERVER_CLIENT_PREFIX='proxy/{port}'

# ------------------------------
# 4. Copy source code after env setup
# ------------------------------
COPY . /home/jovyan/geospatial
WORKDIR /home/jovyan/geospatial

# ------------------------------
# 5. Install geospatial from source
# ------------------------------
# Prevent version resolution errors in CI
ENV SETUPTOOLS_SCM_PRETEND_VERSION_FOR_GEOSPATIAL=0.0.0

RUN pip install -U . && \
    rm -rf ./build ./dist *.egg-info && \
    mkdir -p /home/jovyan/work && \
    fix-permissions /home/jovyan

# ------------------------------
# 6. Switch back to default user
# ------------------------------
USER $NB_UID
WORKDIR /home/jovyan

# ------------------------------
# Usage:
# docker pull ghcr.io/opengeos/geospatial:latest
# docker run -it -p 8888:8888 -v $(pwd):/home/jovyan/work ghcr.io/opengeos/geospatial:latest
# ------------------------------
