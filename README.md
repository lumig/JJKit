# JJKit

是一个组件化路由工具，基于原理是openURL的方式解决
具体原理可以看我的这边文章
[iOS组件化不只是架构师的事](https://www.jianshu.com/p/c6e5505e86b6)

核心方法如下：
```
[JJRouter openURL:@"router://JJActionService/showWebVC" arg: parms error:nil completion:parms[Jump_Key_Callback]];
```

我再次上做了个配置表，方便以后的管理，调用方式有所改变

```
Action *action = [Action new];
action.type = JJ_WebView;
Params *params = [[Params alloc] init];
//            params.pageID = JJ_LOGIN;
action.params = params;
NSDictionary *parms = @{Jump_Key_Action:action, Jump_Key_Param : @{WebUrlString:@"http://www.baidu.com",Name:@"小二"}, Jump_Key_Callback:[JJFunc callback:^(id  _Nullable object) {
NSLog(@"%@",object);
}]};
ActionJump(parms);
```

具体可以看项目

