FROM jupyter/pyspark-notebook:latest

ENV NB_USER "tester"
ENV JUPYTER_NB_PASS "bester"
ENV INSTALL_PACKAGES_PIP plotly elasticsearch-dsl seaborn scikit-learn ipywidgets tqdm requests dask pyspark splunk-sdk huntlib

RUN pip install jupyter_contrib_nbextensions ${INSTALL_PACKAGES_PIP}

RUN jupyter nbextension enable toc2/main && \
  jupyter nbextension enable execute_time/ExecuteTime && \
  jupyter nbextension enable python-markdown/main

RUN jupyter labextension install --minimize=false jupyterlab-plotly  @jupyterlab/toc

RUN /opt/conda/bin/python -c 'import plotly' 

RUN mkdir -p /home/${NB_USER}/.jupyter ; JUPYTER_NB_PASS=${JUPYTER_NB_PASS}  python /tmp/passwd-helper.py >> /home/${NB_USER}/.jupyter/jupyter_notebook_config.py

