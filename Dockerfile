FROM python:3.12-slim

WORKDIR /app
COPY . .
COPY ./chainforge/react-server/build/ ./chainforge/react-server/build/

RUN pip3 install -e .

ENTRYPOINT [ "chainforge", "serve", "--host", "0.0.0.0" ]
