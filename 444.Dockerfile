FROM node:14-alpine3.14

# CMD [ "echo", "jace", "hello" ]

# ENTRYPOINT + CMD
ENTRYPOINT [ "echo", "jace", "hello" ]
CMD [ "world" ]
