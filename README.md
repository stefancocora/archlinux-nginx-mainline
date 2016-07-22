# archlinux-nginx-mainline

[![Docker Repository on Quay](https://quay.io/repository/stefancocora/archlinux-nginx-mainline/status "Docker Repository on Quay")](https://quay.io/repository/stefancocora/archlinux-nginx-mainline)

A container used to test the latest nginx-mainline codebase.

## Testing
To test the container run it locally mounting the configuration file from the `test/` directory
```bash
docker run --rm -v $PWD/test/nginx.conf:/etc/nginx/conf/simplenginx.conf -e NGINX_CONFIG_FILE=/etc/nginx/conf/simplenginx.conf --rm stefancocora/archlinux-nginx-mainline:v1.11.1.4
```

Inspired by : https://github.com/UKHomeOffice/docker-nginx
