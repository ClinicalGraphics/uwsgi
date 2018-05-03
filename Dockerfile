FROM python:3.6-slim-stretch
WORKDIR /tmp
RUN pip install setuptools wheel==0.30.0 auditwheel twine anaconda-client --upgrade
RUN apt-get update && apt-get install -y build-essential libssl-dev patchelf unzip
COPY . .
RUN python setup.py bdist_wheel
RUN cd dist && auditwheel repair -w repaired uWSGI-2.0.17-cp36-cp36m-linux_x86_64.whl
