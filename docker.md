## Docker 入门

`Docker` 是一个开源的应用容器引擎, 让开发者可以打包应用及依赖包到一个可移植的容器中, 然后发布到任何流行的 `Linux` 机器上, 也可实现虚拟化. 容器间使用的是沙箱机制, 相互之间不会有任何接口.

三大概念: **镜像Image**/**容器Container**/**仓库Repository**

### 编译镜像

```sh
docker build -t [image-name]:[tag] [目录]

# 指定 Dockerfile
docker build -t dockerfile-test:first -f aaa.Dockerfile .
```

`-t` 指定名称和tag [name]:[tag]

`-f` 指定 Dockerfile

### 启动镜像容器

```sh
docker run -d -p [访问 port]:[实际 port] --name [容器名称] [镜像名称]:[镜像 tag]
```

`-d` 后台运行

`-p` 指定端口映射. `2333:3000` 表示映射宿主机的 `2333` 端口到容器的 `3000` 端口

`--name` 指定容器名

### 优化技巧

- 使用 `alpine` 镜像

  `docker` 容器内跑的是 `Linux` 系统, 各种镜像的 `dockerfile` 都会继承 `Linux` 作为基础镜像. 而 `alpine` 是 `Linux` 镜像更小的版本. 它裁剪了很多不必要的 `Linux` 功能, 使得体积大幅减少.

  示例:

  ```dockerfile
  FROM node:18-alpine3.14

  ...
  ```

- 使用多阶段构建

- 使用 `ARG` 增加构建灵活性

  ARG 可在构建时传入参数, 使用 `${xxx}` 来获取.

  示例:

  ```js
  // test.js
  console.log(process.env.aaa)
  console.log(process.env.bbb)
  ```

  ```dockerfile
  FROM node:18-alpine3.14

  ARG aaa
  ARG bbb

  WORKDIR /app

  COPY ./test.js .

  ENV aaa=${aaa} \
      bbb=${bbb}

  CMD ["node", "/app/test.js"]

  # sh
  # docker build --build-arg aaa=3 --build-arg bbb=4 test .
  # output:
  # 3
  # 4
  ```


- `CMD` 结合 `ENTRYPOINT`

  CMD 可以灵活修改启动命令, 而 ENTRYPOINT 传入的参则被认为是额外参数.

  一般 CMD用的多.

  示例

  ```dockerfile
  FROM node:18-alpine3.14

  # docker run test echo "world"
  # output: world
  CMD ["echo", "hello"]

  # output: hello echo world
  ENTRYPOINT ["echo", "hello"]
  ```

  结合使用示例:
  ```dockerfile
  FROM node:18-alpine3.14

  ENTRYPOINT ["echo", "hello"]

  CMD ["world"]

  # sh
  # docker run test
  # output: hello world
  # docker run test ace
  # output: hello ace
  ```

- `COPY` VS `ADD`

  一般情况下, 使用 COPY 居多, `ADD` 可以解压 tar.gz 文件

### 参考资料

- [写给前端的 Docker 入门终极指南，别再说不会用 Docker 了！](https://mp.weixin.qq.com/s/oEygasL-5owZ5b8mV6uMTw)

- [掌握这 5 个技巧，让你的 Dockerfile 像个大师！](https://mp.weixin.qq.com/s/v9kznJ1OezUxA49-nd_r_Q)

