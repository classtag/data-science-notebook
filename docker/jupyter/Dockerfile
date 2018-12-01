# Distributed under the terms of the Modified BSD License.
FROM jupyter/pyspark-notebook:latest
MAINTAINER Duo An <anduo@qq.com>

USER root
RUN sed -i 's/Python 3/P36-ML/g' /opt/conda/share/jupyter/kernels/python3/kernel.json
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    cmake \
    git \
    fonts-dejavu \
    tzdata \
    gfortran \
    gcc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


USER $NB_UID

RUN conda update -n base conda
RUN conda install --quiet -y graphviz gcc tensorflow keras
RUN conda install --quiet -y jupyter_contrib_nbextensions jupyter_nbextensions_configurator -c conda-forge
RUN conda install --quiet -y -c pytorch pytorch-nightly-cpu
RUN conda install --quiet -y -c fastai torchvision-nightly-cpu
RUN conda install --quiet -y -c fastai fastai
RUN conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# Add shortcuts to distinguish pip for python2 and python3 envs
RUN ln -s $CONDA_DIR/envs/python2/bin/pip $CONDA_DIR/bin/pip2 && \
    ln -s $CONDA_DIR/bin/pip $CONDA_DIR/bin/pip3

RUN pip install --upgrade pip xgboost lightgbm
RUN pip install pydot
RUN pip install yapf tqdm
RUN jupyter nbextension enable execute_time/ExecuteTime

RUN pip install https://github.com/mli/notedown/tarball/master

RUN mkdir /home/$NB_USER/dat && \
    mkdir /home/$NB_USER/nbs && \
    mkdir /home/$NB_USER/tflogs && \
    fix-permissions /home/$NB_USER

USER root
RUN echo "c.NotebookApp.contents_manager_class='notedown.NotedownContentsManager'" >> /etc/jupyter/jupyter_notebook_config.py

USER $NB_UID
