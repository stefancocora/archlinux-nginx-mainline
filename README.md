# archlinux-nginx-mainline

[![Docker Repository on Quay](https://quay.io/repository/stefancocora/archlinux-nginx-mainline/status "Docker Repository on Quay")](https://quay.io/repository/stefancocora/archlinux-nginx-mainline)

A container used to test the latest nginx-mainline codebase.

## Testing
- create image
```
make build
```
- to test the container run it locally mounting the configuration file from the `test/` directory
```bash
make interactive
```

Inspired by : https://github.com/UKHomeOffice/docker-nginx
