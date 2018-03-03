# TTPlaceholderView

一个给UIView设置占位图的类别

对于ScrollView这种可滚动的控件，一般使用DZNEmptyDataSet设置占位图，但是对于UIView，我找了好久都没找到合适的轮子，
所以自己造了一个。给UIView添加了一个类别，可以很方便的给UIView设置占位图。

#### 默认样式占位图:

![](https://github.com/Chouee/TTPlaceholderView/blob/master/screenshot1.png)

#### 自定义占位图:

![](https://github.com/Chouee/TTPlaceholderView/blob/master/screenshot2.png)

## How to use

//默认样式占位图
```
[self.view tt_showPlaceholderViewWithImageName:@"无网络.png" title:@"点我重新加载~" attributes:nil reloadBlock:^{
        
        //处理点击事件
        
 }];
```

Custom:
```
//添加富文本属性
NSDictionary *attributes = @{
                             NSFontAttributeName:[UIFont systemFontOfSize:20.0f],
                             NSForegroundColorAttributeName:[UIColor orangeColor]
                             };
    
[self.view tt_showPlaceholderViewWithImageName:@"无网络.png" title:@"点我重新加载~" attributes:attributes reloadBlock:^{
        
        //处理点击事件
        
 }];
```
