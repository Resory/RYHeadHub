# RYHeadHub
类似QQ音乐头部提示View<br>
![RYHeadHub](https://github.com/Resory/Images/blob/master/RYHeadHub.gif)

# 如何使用

1.引用文件<br>
``` objc
#import "RYHeadhub.h"
```
  
2.调用方法<br>
``` objc
[[RYHeadHub shareInstance] showHeadHubWithStatus:RYHeadHubShowSuccess andNoteText:@"数据刷新成功!"]
```
``` objc
[[RYHeadHub shareInstance] showHeadHubWithStatus:RYHeadHubShowFail andNoteText:@"数据下载失败!"]
```

# 小贴士
提示页面的图标是[iconfont](http://ued.taobao.org/blog/2013/09/icon-font-in-ios/ "关于iconfont") . Demo带了一套iconfont.如需修改,需自己准备iconfont.<br>
