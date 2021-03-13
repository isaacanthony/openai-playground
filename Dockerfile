FROM jupyter/tensorflow-notebook:latest

# Install OS dependencies.
USER root

RUN apt-get update -y && apt-get install -y \
  cmake \
  python-opengl \
  xvfb \
  zlib1g \
  zlib1g-dev

# Install Python dependencies.
USER ${NB_USER}

RUN conda install \
  swig

RUN pip3 install \
  atari_py \
  box2d-py \
  gym \
  gym[atari] \
  h5py \
  keras-rl \
  Pillow \
  pystan \
  pyvirtualdisplay
