# Installation

The geospatial package has many dependencies, such as [GeoPandas](https://geopandas.org) and [localtileserver](https://github.com/banesullivan/localtileserver). These optional dependencies can sometimes be a challenge to install, especially on Windows. Therefore, we advise you to closely follow the recommendations below to avoid installation problems.

## Video Tutorial

[![Introducing geospatial](images/thumbnail.png)](https://youtu.be/Y1xB7d2VbFY "Introducing geospatial")

## Installing using uv

[uv](https://docs.astral.sh/uv/) is an extremely fast Python package and project manager, written in Rust. It is designed to be a drop-in replacement for pip. You can install `geospatial` using `uv` as follows:

```bash
uv pip install geospatial
```

If you are on Linux and want to install GDAL, you can use the following command:

```bash
uv pip install --find-links https://girder.github.io/large_image_wheels gdal pdal pyproj
```

For windows and macOS users, you can install GDAL using mamba as shown in the following section.

## Installing using conda

To install geospatial and all its dependencies, we recommend you use the [mamba](https://mamba.readthedocs.io/en/latest/user_guide/mamba.html) package manager. This can be obtained by installing the [Anaconda Distribution](https://www.anaconda.com/download) (a free Python distribution for data science), or through [Miniconda](https://docs.anaconda.com/miniconda/) (minimal distribution only containing Python and the conda package manager).

```bash
conda create -n geo python
conda activate geo
conda install -c conda-forge mamba
mamba install -c conda-forge geospatial
```

## Installing using pip

geospatial is also available on [PyPI](https://pypi.org/project/geospatial). It can be installed with pip using the following command:

```bash
pip install geospatial
```

All optional dependencies of geospatial are listed in [requirements_dev.txt](https://github.com/opengeos/geospatial/blob/master/requirements_dev.txt).

## Installing from source

You may install the latest development version by cloning the GitHub repository with [Git](https://git-scm.com) and using pip to install from the local directory:

```bash
git clone https://github.com/opengeos/geospatial.git
cd geospatial
pip install .
```

It is also possible to install the latest development version directly from the GitHub repository with:

```bash
pip install git+https://github.com/opengeos/geospatial.git
```

## Using Docker

If you are familiar with [Docker](https://www.docker.com), you can use the following command to pull the latest geospatial image from the [GitHub Container Registry](https://github.com/opengeos/geospatial/pkgs/container/geospatial)

```bash
docker pull ghcr.io/opengeos/geospatial:latest
```

## Upgrading geospatial

If you have installed geospatial before and want to upgrade to the latest version, you can run the following command in your terminal:

```bash
pip install -U geospatial
```

If you use conda, you can update geospatial to the latest version by running the following command in your terminal:

```bash
conda update -c conda-forge geospatial
```
