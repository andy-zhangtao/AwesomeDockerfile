FROM python:3.9-alpine
RUN  apk update && \
    apk add git libc-dev build-base
WORKDIR /
RUN git clone https://github.com/openai/gpt-discord-bot.git 
WORKDIR /gpt-discord-bot
RUN pip install -r requirements.txt