# tlmgr-intro-zh-cn

This document is a Chinese translation to [texdoc tlmgr](https://mirrors.ctan.org/info/tlmgrbasics/doc/tlmgr.pdf). If there exist wrong translations or some practical functions that I haven't write, welcome to raise an [issue](https://github.com/syvshc/tlmgr-intro-zh-cn/issues) or [PR](https://github.com/syvshc/tlmgr-intro-zh-cn/pulls). 

TeX Live uses `tlmgr` to manage schemes, collections and packages. If you still don't install TeX Live, please install one with the help of [install-latex-guide-zh-cn](https://mirrors.ctan.org/info/install-latex-guide-zh-cn/install-latex-guide-zh-cn.pdf) and [texlive-zh-cn](https://www.tug.org/texlive/doc/texlive-zh-cn/texlive-zh-cn.pdf). 

However the [`tlmgr`'s official document](https://www.tug.org/texlive/doc/tlmgr.html) is too long for common users, so I select some practical funcitons and usage to introduce. 

To compile this project, I recommend to run 
```bash
latexmk
```
under the `\tlmgr-intro-zh-cn` folder. The compiled document could be found at the [release](https://github.com/syvshc/tlmgr-intro-zh-cn/releases) page.

# License

This work is released under the GNU GPL, v3.0 or later.

# 关于 `tlmgr` 使用方法的简介

这个文档是对 [texdoc tlmgr](https://mirrors.ctan.org/info/tlmgrbasics/doc/tlmgr.pdf) 的翻译以及补充. 由于翻译水平与专业知识有限, 文档中有一些词汇和语句翻译的并不好, 如果您有更好的翻译或者纠正我的错误, 可以在该项目处提出 [issue](https://github.com/syvshc/tlmgr-intro-zh-cn/issues) 或者 [PR](https://github.com/syvshc/tlmgr-intro-zh-cn/pulls). 

TeX Live 使用 `tlmgr` 来管理安装方案, 集合和软件包, 如果还没有安装 TeX Live, 可以参考 [install-latex-guide-zh-cn](https://mirrors.ctan.org/info/install-latex-guide-zh-cn/install-latex-guide-zh-cn.pdf) 与 [texlive-zh-cn](https://www.tug.org/texlive/doc/texlive-zh-cn/texlive-zh-cn.pdf) 进行安装. 

但是 [`tlmgr` 官方文档](https://www.tug.org/texlive/doc/tlmgr.html) 过于冗长, 有很多一般用户接触不到的功能, 在这里将它简化, 拿出一些比较基础使用的命令来介绍. 

本文档推荐使用 `latexmk` 进行编译, 在文件夹 `\tlmgr-intro-zh-cn` 下, 用命令行运行
```bash
latexmk
```
即可, 编译后的文档可在 [release](https://github.com/syvshc/tlmgr-intro-zh-cn/releases) 处获取. 

# 开源协议
本文档遵循 GNU GPL 3.0 及以后的开源协议. 