FROM pytorch/pytorch as lab

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN /opt/conda/bin/conda install -y nodejs Cython jupyter jupyterlab ipywidgets && \
    /opt/conda/bin/conda clean -ya
RUN export NODE_OPTIONS=--max-old-space-size=4096 \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build \
    && jupyter labextension install plotlywidget@4.11.0 --no-build \
    && jupyter labextension install jupyterlab-plotly@4.11.0 --no-build \
    && jupyter labextension install @jupyterlab/toc --no-build \
    && jupyter labextension install jupyterlab-drawio --no-build \
    && jupyter labextension install @aquirdturtle/collapsible_headings --no-build \
    && jupyter labextension install @krassowski/jupyterlab_go_to_definition --no-build \
    && jupyter labextension install @pyviz/jupyterlab_pyviz --no-build \
    && jupyter labextension install @bokeh/jupyter_bokeh --no-build \
    && jupyter lab build

RUN mkdir -p /home/me && chmod 1777 /home/me
ENV HOME /home/me

#RUN pip install shap

WORKDIR /experiments
#COPY ../steps.sh steps.sh