FROM python:3.10-slim-bullseye
WORKDIR /app
COPY . .
COPY ./chainforge/react-server/build/ ./chainforge/react-server/build/
RUN pip3 install -e .
ENTRYPOINT [ "chainforge", "serve", "--host", "0.0.0.0" ]
