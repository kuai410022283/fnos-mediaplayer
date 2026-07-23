# MediaPlayer fnOS (飞牛应用) 自动打包套件

本仓库用于自动监控 [kuai410022283/mediaplayer](https://github.com/kuai410022283/mediaplayer) 的发布更新，并定时自动编译打包为飞牛 fnOS 原生应用安装包 (`.fpk`)。

---

## 🌟 特性

- 🤖 **全自动构建与发布**：每 6 小时自动检测上游 Releases 更新，自动打包并发布到本仓库的 [Releases 页面](../../releases)。
- 💻 **多架构支持**：集成 `x86_64` (amd64) 与 `aarch64` (arm64) 架构，支持各大 Intel/AMD/ARM 飞牛 NAS 设备。
- ⚙️ **图形化安装与配置**：内置 fnOS 安装及配置向导，可在安装时灵活设置端口、管理员密码及持久化数据保存目录。

---

## 🚀 安装方法

1. 从本仓库 [Releases 页面](../../releases) 下载最新版本的 `mediaplayer_all_v*.fpk` 安装包。
2. 打开飞牛 NAS 管理界面 -> **应用中心**。
3. 选择 **手动安装 / 开发导入**，选中下载的 `.fpk` 文件。
4. 按照安装向导提示设置服务端口及存储路径完成安装。

---

## 🛠️ 本地测试打包

若需要在本地打包或构建，请确保安装有 `fnpack` 工具（或在根目录准备 `fnpack` / `fnpack.exe`），然后运行：

```bash
chmod +x build.sh
./build.sh
```

生成的 `.fpk` 安装包将位于项目根目录下。

---

## 📄 开源协议

遵循 [MIT License](LICENSE)。
