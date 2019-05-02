FROM golang:alpine
LABEL io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"
RUN apk add --no-cache git
COPY ./s2i/bin/ /usr/libexec/s2i
CMD ["/usr/libexec/s2i/usage"]
