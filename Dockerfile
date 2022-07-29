FROM jupyterhub/jupyterhub:latest

LABEL maintainer="Mattholy <smile.used@hotmail.com>"

VOLUME ["/etc/jupyterhub"]

ENV LC_ALL=zh_CN.UTF-8 LANG=zh_CN.UTF-8 LANGUAGE=zh_CN.UTF-8

RUN /bin/sh -c locale-gen $LC_ALL \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install jupyterlab \
    && pip install jupyterlab-language-pack-zh-CN \
    && mkdir /etc/jupyterhub \
    && touch /etc/jupyterhub/jupyterhub_config.py
    # && jupyterhub --generate-config -f /etc/jupyterhub/jupyterhub_config.py

CMD ["jupyterhub","-f","/etc/jupyterhub/jupyterhub_config.py"]