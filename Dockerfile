FROM nginx:alpine
LABEL name="capstone_udacity"
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80
