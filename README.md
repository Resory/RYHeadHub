# RYHeadHub
类似QQ音乐头部提示View

# 效果
![RYHeadHub](https://github.com/Resory/Images/blob/master/RYHeadHub.gif)

# 如何使用

1.import "RYHeadhub.h" <br>

2.注意提示页面的图标是[iconfont](http://ued.taobao.org/blog/2013/09/icon-font-in-ios/ "关于iconfont") . Demo带了一套iconfont.如需修改,需自己准备iconfont.<br>
  
3.调用方法<br>
  ```[[RYHeadHub shareInstance] showHeadHubWithStatus:RYHeadHubShowSuccess andNoteText:@"数据刷新成功!"];<br>
  ```[[RYHeadHub shareInstance] showHeadHubWithStatus:RYHeadHubShowSuccess andNoteText:@"数据下载失败!"];
