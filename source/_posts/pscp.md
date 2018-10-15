---
title: 一行命令解决Vue和React打包部署上线
date: 2018-10-14 22:12:28
tags: 
    -pscp 
    -bat 
    -vue 
    -react 
    -部署上传 
    -服务器
categories: Windows
---

## 一行命令解决Vue和React打包部署上线

### 1. 这不是标题党

回想我们之前如何吧打包好的项目部署到服务器中？有很多中方法可以实现，可以用ftp远程登录，可以是第三方，可以是后台帮我们前端程序员做好了配置；当然你也可以把打包好的项目扔给别人，然后自己去逍遥快活。<br/>
无论你之前怎么去实现打包上线，看完这篇后你也可以在自己项目下实现一键部署项目上线。本文只针对Windows哦，Mac自带scp！

### 2. 实现原理

其实就是我们通过windows下的pscp命令，在项目下写一个.bat脚本，并注册全局变量，就可以一键搞定项目部署。

### 3. 实现方式

##### 1. windows用户下载pscp[下载地址传送大门](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) 
下载后 ，建议将pscp.exe放到C:\WINDOWS\system32下面，语法与scp相同，下面是几个有用的options。<br/>

>-p 拷贝文件的时候保留源文件建立的时间。<br/>
-q 执行文件拷贝时，不显示任何提示消息。<br/>
-r 拷贝整个目录<br/>
-v 拷贝文件时，显示提示信息。

##### 2. pscp 用法
> pscp [options] [user@]host:source target <br/>
例如： pscp -r -v public root@jyjvip.cn:/data/www/

##### 3.在项目根目录下新建 .bat 脚本文件

例如，我在自己的hexo博客下新建 build.bat 文件， 并注入一下内容

```bat
@echo off
echo ====================clean=====================
call hexo clean

echo ====================hexo generate =====================
call hexo g

call pscp -r -v public root@jyjvip.cn:/data/www/
echo ====================upload successful=====================
```
想了解更多 bat 脚本语法，请看以下[传送门](https://www.jb51.net/article/97204.htm)

##### 4. 把bat脚本注入到Windows全局变量
其实这句话意思就是，把上面的build.bat写入到windows下的path中<br/>
> 例如：编辑path全局变量，把 D:\zhangchong-myself\hexo-blog 注入进去，确定保存。

退出后,在 IDE 的终端 输入 build.bat 看到编译成功，并且会让输入到远程服务器密码，而后大功告成！！！<br/>

### 4. 总结
主要就是.bat脚本这段代码， call 是bat语法，意思是按顺序执行命令，当然 bat 还有很多高级语法，有兴趣的童鞋可以进一步了解，你学会了吗？

个人博客：www.jyjvip.cn <br/>>
GitHub: https://github.com/JakeVivit/hexo-blog
