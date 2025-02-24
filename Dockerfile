FROM python:latest

WORKDIR /mnt

RUN pip install hy

CMD ["hy", "trigger.hy"]