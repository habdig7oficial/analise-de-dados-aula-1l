FROM python:latest

WORKDIR /mnt

RUN pip install hy
RUN pip install matplotlib

CMD ["hy", "trigger.hy"]