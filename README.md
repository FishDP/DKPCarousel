# DKPCarousel
+ 1.使用方便，简洁高效，功能强大，一行代码即可实现图片无限轮播； 
+ 2.提供多个属性，可以设置图片滚动方向、是否带动画翻页、动画时间和停顿时间； 
+ 3.拖动图片过程中图片不再滚动，停止拖动后继续滚动； 
+ 4.自定义设置PageViewController显示的图标，根据个人喜好，设置不同的图片； 
+ 5.点击可以打开网页，方便设置广告；

###示例代码
+ 一行代码实现基本图片轮播
```objc
DKPCarouselView * pageControlCarouselView1 = [DKPCarouselView carouselWithPersonalFrame:CGRectMake(0, 64, DKPScreenW, 150) pageControlFrame:CGRectMake(270, 130, 50, 20) PageSource:DKPPageSource];
```
+ 设置动画和停顿时间

```objc
/**
 * 初始化方法
 *
 * @param personalFrame    轮播器frame
 * @param pageControlFrame pageControlFrame
 * @param pages            待展示图片地址（字符串）数组
 * @param TotalTime        图片切换总时间间隔
 * @param stopTime         图片停顿时间
 *
 * @return  轮播器对象
 *
*/
     DKPCarouselView * pageControlCarouselView3 = [DKPCarouselView carouselWithPersonalFrame:CGRectMake(0, 64 + 300, DKPScreenW, 150) pageControlFrame:CGRectMake(270, 130, 50, 20)  PageSource:DKPPageSource TotalTime:4 StopTime:2];
```
+ 用在导航控制器中，如果该轮播器离导航条最近，需要设置
```objc
self.automaticallyAdjustsScrollViewInsets = NO;
```
+ 可选属性
```objc
//滚动方向
@property (nonatomic, assign) CarouselDirection CarouselDirection;
//是否允许立即翻页
@property (nonatomic, assign) BOOL immediatePagingEnabled;
//pageControl当前显示图片
@property (nonatomic, strong)  UIImage *pageControlCurrentIamge;
//pageControl其他图片
@property (nonatomic, strong)  UIImage *pageControlOtherIamge;
//广告ulr
@property (nonatomic, copy) NSString *advertisementUrlString;
```
### 部分效果图
![image](https://github.com/FishDP/resource/blob/master/custom.gif)
