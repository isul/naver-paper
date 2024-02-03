FROM python:3.9.18-alpine

COPY src /

WORKDIR /usr/local/app

ENV PYTHONIOENCODING=utf-8
ENV LC_ALL=ko_KR.UTF-8
ENV LANG=ko_KR.UTF-8
ENV LANGUAGE=ko_KR.UTF-8
ENV TZ=Asia/Seoul

RUN chmod 755 /usr/local/app/*.sh \
	&& ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
	&& apk update \
	&& apk upgrade \
	&& apk add --no-cache tzdata chromium chromium-chromedriver \
	&& rm -rf /var/cache/apk/* \
	&& pip3 install --upgrade pip \
	&& pip3 install --root-user-action=ignore -r /usr/local/app/requirements.txt \
	&& ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
	&& echo Asia/Seoul > /etc/timezone

CMD /usr/local/app/run.sh $NAVER_ID $NAVER_PASSWORD $DEBUG
