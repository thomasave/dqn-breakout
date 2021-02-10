FROM pytorch/pytorch

RUN apt update
RUN ln -fs /usr/share/zoneinfo/Europe/Brussels /etc/localtime
RUN apt install -y build-essential python3-dev cython3 python3-setuptools python3-pip python3-wheel python3-numpy python3-pytest python3-blosc python3-brotli python3-snappy python3-lz4 libz-dev libblosc-dev liblzma-dev liblz4-dev libzstd-dev libpng-dev libwebp-dev libbz2-dev libopenjp2-7-dev libjpeg-turbo8-dev libjxr-dev liblcms2-dev libcharls-dev libaec-dev libbrotli-dev libsnappy-dev libzopfli-dev libgif-dev libtiff-dev python3-pip libjpeg-dev libpng-dev git python3-scipy python3-sklearn libgl1-mesa-glx
RUN apt remove -y cython3

RUN pip3 install --upgrade cython Cython
RUN pip3 install --upgrade cython Cython scikit-learn
ADD ./requirements.txt /tmp
RUN pip3 install --upgrade -r /tmp/requirements.txt

Add ./ /code
WORKDIR /code

ENV PYTHONUNBUFFERED "1"
ENTRYPOINT ["python", "main.py"]
