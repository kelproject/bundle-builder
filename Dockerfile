FROM quay.io/kelproject/bundle-base:git-8407e330

RUN mkdir /app
RUN addgroup --quiet --gid 2000 app && \
    useradd app --uid=2000 --gid=2000 --home-dir /app --no-create-home
RUN chown -R app:app /app

RUN mkdir -p /opt/buildpacks && mkdir -p /opt/scripts

ADD ./buildpacks /opt/buildpacks
RUN chown -R app:app /opt/buildpacks
ADD ./container-scripts/ /opt/scripts

USER app
ENV HOME /app

ENTRYPOINT ["/opt/scripts/build"]
