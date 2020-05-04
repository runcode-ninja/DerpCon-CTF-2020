FROM fedora:31

WORKDIR /root/

COPY ecb_the_best.py /root/

RUN dnf install -y python3 python3-devel gcc

RUN python3 -m ensurepip

RUN pip3 install twisted pycryptodome

ENTRYPOINT ["python3", "/root/ecb_the_best.py"]
