# build with:
# docker build -t <name> . --progress=plain
# incase something is wrong --no-cache flag can help
FROM debian

RUN apt-get update && apt-get install -y firefox-esr git -qqy x11-apps \
		libpci3 libegl1 alsa-utils apulse libasound2 ffmpeg

RUN groupadd -r firefox 
RUN useradd -r -m -g firefox -G audio,video firefox

RUN chown firefox:firefox /home/firefox 
RUN chmod 755 /home/firefox

USER firefox

RUN git clone https://github.com/arkenfox/user.js.git /home/firefox/user.js/
RUN firefox --headless -CreateProfile "user /home/firefox/user"

USER root

RUN cp -r /home/firefox/user.js/* /home/firefox/user/

USER firefox

CMD ["apulse", "firefox", "-P", "user"]
