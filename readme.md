# ArchLinux 基础 Docker 镜像

[镜像地址](https://hub.docker.com/r/horkel/archlinux/)，使用 `docker pull horkel/archlinux` 获取镜像；

### 构建 `archlinux.tar` 系统镜像

在现有的 ArchLinux 系统中构建

#### 安装依赖：

* make
* devtools // 依赖 python3
* pacstrap 安装如下

```shell
pacman -S pkgfile
pkgfile --update
pacman -S extra/arch-install-scripts
```

使用 `make rootfs` 构建 archlinux.tar

### 构建 Docker Image

```
docker build -t horkel/archlinux:2018.11.16 .
docker build -t horkel/archlinux:latest .
```

### 目的

* 提供一个基础的 ArchLinux Docker 镜像，完整且简单易用；
* `pacman` 开箱即用
* 所有软件保持原汁原味
