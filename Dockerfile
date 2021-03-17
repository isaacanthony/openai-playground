FROM jupyter/tensorflow-notebook:latest

# Install OS dependencies.
USER root

RUN apt-get update -y && apt-get install -y \
  cmake \
  python-opengl \
  python-pygame \
  xvfb \
  zlib1g \
  zlib1g-dev

# Install Python dependencies.
USER ${NB_USER}

RUN conda install \
  swig==4.0.2

RUN pip3 install \
  gym[nomujoco]==0.18.0 \
  gym-notebook-wrapper==1.2.4 \
  h5py==2.10.0 \
  keras-rl2==1.0.4 \
  Pillow==7.2.0 \
  pyglet==1.5.0 \
  pystan==2.19.1.1 \
  tensorflow==2.4.1
