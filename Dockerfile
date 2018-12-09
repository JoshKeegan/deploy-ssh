FROM alpine:3.8

# Install software
RUN apk add --no-cache openssh-client bash curl

# Set up SSH to not prompt to check keys when a new host is encountered
RUN mkdir -p ~/.ssh && \
	chmod 700 ~/.ssh && \
	echo -e "Host *\n\tStrictHostKeyChecking accept-new\n" > ~/.ssh/config && \
	touch ~/.ssh/id_rsa && \
	chmod 600 ~/.ssh/id_rsa


ENTRYPOINT ["/bin/bash"]