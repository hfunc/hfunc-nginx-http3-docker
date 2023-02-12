# 介绍

本镜像Nginx的代码来源于测试分支：https://quic.nginx.org ,非quiche模块构建

|依赖|版本|
|:---:|:---:|
|nginx|[0d35b1ff6af5](https://hg.nginx.org/nginx-quic/rev/0d35b1ff6af5)|
|boringssl|[2e68a05](https://github.com/google/boringssl/commit/2e68a05c9943a8dec1758d4a393b2ae906fd3295)|
|pcre|8.45|

# 运行镜像的使用

`docker pull hikit/nginx-http3:latest`

官方编译版 `docker pull hikit/nginx-http3:off`

容器内Nginx路径为:`/home/nginx`，根据需要进行存储映射

结构：

    ├── conf
    │   ├── fastcgi.conf
    │   ├── fastcgi.conf.default
    │   ├── fastcgi_params
    │   ├── fastcgi_params.default
    │   ├── koi-utf
    │   ├── koi-win
    │   ├── mime.types
    │   ├── mime.types.default
    │   ├── nginx.conf
    │   ├── nginx.conf.default
    │   ├── scgi_params
    │   ├── scgi_params.default
    │   ├── uwsgi_params
    │   ├── uwsgi_params.default
    │   └── win-utf
    ├── html
    │   ├── 50x.html
    │   └── index.html
    ├── logs
    └── sbin
    └── └── nginx

# 构建镜像的使用

`docker pull hikit/nginx-http3-build`

构建的组件有：`boringssl` 和 `pcre`

构建产生文件在`/home/build`


# Reference

[Experimental QUIC support for nginx](https://quic.nginx.org/readme.html)
