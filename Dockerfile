FROM python:3-buster

RUN pip3 install gunicorn

COPY ./rome /rome
COPY ./rome-studio/dist /rome/static
WORKDIR /rome

RUN pip3 install --no-cache-dir -r requirements.txt
    
ENV PYTHONPATH=/

CMD ["gunicorn", "--bind", "0.0.0.0:80", "rome:app"]
    
EXPOSE 80 443