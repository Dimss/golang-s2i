FROM golang:alpine
ENV GOCACHE=/tmp
ENV APP_ROOT=/go
LABEL io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"
RUN apk add --no-cache git
COPY ./s2i/bin/ /usr/libexec/s2i
ADD uid_entrypoint /usr/bin
RUN chmod -R u+x ${APP_ROOT} && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT} /etc/passwd

USER 1001
ENTRYPOINT [ "uid_entrypoint" ]
CMD ["/usr/libexec/s2i/usage"]
