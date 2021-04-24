# 关于 `tlmgr` 使用方法的简介

这个文档是对 [texdoc tlmgr](https://www.tug.org/texlive/devsrc/Master/texmf-dist/doc/latex/tlmgrbasics/tlmgr.pdf) 的翻译以及补充. 由于翻译水平与专业知识有限, 文档中有一些词汇和语句翻译的并不好, 如果您有更好的翻译或者纠正我的错误, 可以在该项目处提出 [issue](https://github.com/syvshc/tlmgr-intro-zh-cn/issues) 或者 [PR](https://github.com/syvshc/tlmgr-intro-zh-cn/pulls). 

TeX Live 使用 `tlmgr` 来管理安装方案, 集合和软件包, 如果还没有安装 TeX Live, 可以参考 [install-latex-guide-zh-cn](https://www.tug.org/texlive/devsrc/Master/texmf-dist/doc/latex/install-latex-guide-zh-cn/install-latex-guide-zh-cn.pdf) 与 [texlive-zh-cn](https://www.tug.org/texlive/doc/texlive-zh-cn/texlive-zh-cn.pdf) 进行安装. 但是 [`tlmgr` 官方文档](https://www.tug.org/texlive/doc/tlmgr.html) 过于冗长, 有很多一般用户接触不到的功能, 在这里将它简化, 拿出一些比较基础使用的命令来介绍. 

本文档推荐使用 `latexmk` 进行编译, 在命令行运行
```bash
latexmk
```
即可, 编译后的文档可在 [release](https://github.com/syvshc/tlmgr-intro-zh-cn/releases) 处获取. 

# 开源协议
本文档遵循 GNU GPL 3.0 及以后的开源协议. 