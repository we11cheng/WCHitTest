### iOS事件处理，首先应该是找到能处理点击事件的视图，然后在找到的这个视图里处理这个点击事件。
#### 处理原理如下：
* 当用户点击屏幕时，会产生一个触摸事件，系统会将该事件加入到一个由UIApplication管理的事件队列中。                                    

* UIApplication会从事件队列中取出最前面的事件进行分发以便处理，通常，先发送事件给应用程序的主窗口(UIWindow)。

* 主窗口会调用hitTest:withEvent:方法在视图(UIView)层次结构中找到一个最合适的UIView来处理触摸事件。(hitTest:withEvent:其实是UIView的一个方法，UIWindow继承自UIView，因此主窗口UIWindow也是属于视图的一种)。

#### hitTest:withEvent:方法大致处理流程是这样的：

* 若pointInside:withEvent:方法返回NO，说明触摸点不在当前视图内，则当前视图的hitTest:withEvent:返回nil。

* 若pointInside:withEvent:方法返回YES，说明触摸点在当前视图内，则遍历当前视图的所有子视图(subviews)，调用子视图的hitTest:withEvent:方法重复前面的步骤，子视图的遍历顺序是从top到bottom，即从subviews数组的末尾向前遍历，直到有子视图的hitTest:withEvent:方法返回非空对象或者全部子视图遍历完毕。

* 若第一次有子视图的hitTest:withEvent:方法返回非空对象,则当前视图的hitTest:withEvent:方法就返回此对象，处理结束。

* 最终，这个触摸事件交给主窗口的hitTest:withEvent:方法返回的视图对象去处理。

#### 详见demo中第二个自定义View注释。
运行效果图  
![](http://p2bzzkn05.bkt.clouddn.com/18-1-14/13239576.jpg)
