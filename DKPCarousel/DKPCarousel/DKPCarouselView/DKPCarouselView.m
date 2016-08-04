//
//  DKPCarouselView.m
//  DKPCarouselAnimation
//
//  Created by DP on 16/7/26.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DKPCarouselView.h"
#import <UIImageView+WebCache.h>
#import <SafariServices/SafariServices.h>

@interface DKPCarouselView  ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIImageView *adImageView;
/**定时器*/
@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, strong) NSArray *pictureURLs;
/**父控件frame*/
@property (nonatomic, assign) CGRect personalFrame;
/**pageControl*/
@property (nonatomic, assign) CGRect pageControlFrame;
/**自动翻页状态*/
@property (nonatomic, assign) BOOL autoPagingStatus;
/**当前的页码*/
@property (nonatomic, assign) NSInteger pageIndex;
//总时间
@property (nonatomic, assign) CGFloat totalTime;
//停顿时间
@property (nonatomic, assign) CGFloat stopTime;
@end

@implementation DKPCarouselView

#pragma mark ------------
#pragma mark 初始化

- (instancetype)initWithPersonalFrame:(CGRect)personalFrame pageControlFrame:(CGRect)pageControlFrame PageSource:(NSArray*)pages TotalTime:(NSInteger) totalTime StopTime:(NSInteger) stopTime {
    if (self = [super initWithFrame:personalFrame]) {
        self.window.rootViewController.automaticallyAdjustsScrollViewInsets = NO;
        self.pictureURLs = pages;
        self.personalFrame = personalFrame;
        self.pageControlFrame = pageControlFrame;
        self.totalTime = totalTime;
        self.stopTime = stopTime;
        //创建内部控件
        //1.scrollView
        [self setupScrollView];
        //2.pageControll
        [self setupPageControl];
        //3.添加定时器
        _timer = [self addTimer];
    }
    return self;
}
- (instancetype)initWithPersonalFrame:(CGRect)personalFrame pageControlFrame:(CGRect)pageControlFrame PageSource:(NSArray *)pages {
    return  [self initWithPersonalFrame:personalFrame pageControlFrame:pageControlFrame PageSource:pages TotalTime:3 StopTime:1];
}

+ (instancetype)carouselWithPersonalFrame:(CGRect)personalFrame pageControlFrame:(CGRect)pageControlFrame PageSource:(NSArray *)pages {
    return [[self alloc]initWithPersonalFrame:personalFrame pageControlFrame:pageControlFrame PageSource:pages];
}
+ (instancetype)carouselWithPersonalFrame:(CGRect)personalFrame pageControlFrame:(CGRect)pageControlFrame PageSource:(NSArray*)pages TotalTime:(NSInteger) totalTime StopTime:(NSInteger) stopTime {
    
    return [[self alloc]initWithPersonalFrame:personalFrame pageControlFrame:pageControlFrame PageSource:pages TotalTime:totalTime StopTime:stopTime];
}



#pragma mark ------------
#pragma mark set方法
//设置广告
-(void)setAdvertisementUrlString:(NSString *)advertisementUrlString {
    _advertisementUrlString = advertisementUrlString;
}
//设置滚动方向
- (void)setCarouselDirection:(CarouselDirection)CarouselDirection {
    _CarouselDirection = CarouselDirection;
}
//设置是否立即翻页
- (void)setImmediatePagingEnabled:(BOOL)immediatePagingEnabled {
    _autoPagingStatus = immediatePagingEnabled;
}
//设置PageControl显示的图片
- (void)setPageControlOtherIamge:(UIImage *)pageControlOtherIamge {
    _pageControlOtherIamge = pageControlOtherIamge;
    [_pageControl setValue:pageControlOtherIamge forKey:@"_pageImage"];
}
- (void)setPageControlCurrentIamge:(UIImage *)pageControlCurrentIamge {
    _pageControlCurrentIamge = pageControlCurrentIamge;
    [_pageControl setValue:pageControlCurrentIamge forKey:@"_currentPageImage"];
}
#pragma mark ------------
#pragma mark 添加子控件
//scrollView
- (void)setupScrollView {
    _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    [self addSubview:_scrollView];
    _scrollView.pagingEnabled = YES;
    _scrollView .delegate = self;
    
}
//PageControl
- (void)setupPageControl {
    _pageControl = [[UIPageControl alloc]initWithFrame:self.pageControlFrame];
    _pageControl.numberOfPages = self.pictureURLs.count;
    _pageControl.hidesForSinglePage = YES;
    [self addSubview:_pageControl];
    
}
//添加图片
- (void)loadPicturesWithFrame:(CGRect)pictureFrame {
    //移除原先图片
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (int i = 0; i < self.pictureURLs.count; i++) {
        UIImageView *adImageView = [[UIImageView alloc]init];
        _adImageView = adImageView;
        [_adImageView sd_setImageWithURL:self.pictureURLs[i] placeholderImage:nil options: SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        }];
        //设置图片
        switch (self.CarouselDirection) {
            case CarouselDirectionRightToLeft://从右向左
                _adImageView.frame = CGRectMake(i * pictureFrame.size.width, 0, pictureFrame.size.width, pictureFrame.size.height);
                _scrollView.contentSize = CGSizeMake(self.pictureURLs.count * pictureFrame.size.width, pictureFrame.size.height);
                break;
            case CarouselDirectionLeftToRight://从左向右
                _adImageView.frame = CGRectMake(-i * pictureFrame.size.width, 0, pictureFrame.size.width, pictureFrame.size.height);
                _scrollView.contentSize = CGSizeMake(self.pictureURLs.count * pictureFrame.size.width, pictureFrame.size.height);
                break;
            case CarouselDirectionBottomToTop://从下向上
                _adImageView.frame = CGRectMake(0, i * pictureFrame.size.height, pictureFrame.size.width, pictureFrame.size.height);
                _scrollView.contentSize = CGSizeMake(pictureFrame.size.width, self.pictureURLs.count *pictureFrame.size.height);
                break;
            case CarouselDirectionTopToBottom://从上向下
                _adImageView.frame = CGRectMake(0, -i * pictureFrame.size.height, pictureFrame.size.width, pictureFrame.size.height);
                _scrollView.contentSize = CGSizeMake(pictureFrame.size.width, self.pictureURLs.count * pictureFrame.size.height);
                break;
            default:
                break;
        }
        
        //添加手势
        _adImageView.userInteractionEnabled = YES;
        [_adImageView addGestureRecognizer: [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pictureClick)]];
        [_scrollView addSubview:_adImageView];
    }
}

//添加定时器
- (NSTimer *)addTimer {
    return  [NSTimer scheduledTimerWithTimeInterval:self.totalTime target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
}
#pragma mark ------------
#pragma mark other
//重新布局
- (void)layoutSubviews {
    [super layoutSubviews];
    //加载图片
    [self loadPicturesWithFrame:self.personalFrame];
}
//换页
- (void)nextPage {
    _pageIndex = self.pageControl.currentPage + 1;
    if (_pageIndex == self.pictureURLs.count) {
        _pageIndex = 0;
    }
    if (_autoPagingStatus) {//立即翻页
        [self autoChangeToNextPage];
    }else {//动画翻页
        static dispatch_once_t onceToken;
        //第一次等待时间为停顿时间+定时器时间，所以第一次不要停顿
        dispatch_once(&onceToken, ^{
            [self autoChangeToNextPageWithAnimation];
            return ;
        });
        [self performSelector:@selector(autoChangeToNextPageWithAnimation) withObject:nil afterDelay:self.stopTime];
    }
}
//自动翻页
- (void)autoChangeToNextPage {
    switch (self.CarouselDirection) {
        case CarouselDirectionRightToLeft:{//从右向左
            self.scrollView.contentOffset = CGPointMake(_pageIndex *self.adImageView.frame.size.width, 0);
        }
            break;
        case CarouselDirectionLeftToRight:{//从左向右
            self.scrollView.contentOffset = CGPointMake(-_pageIndex *self.adImageView.frame.size.width, 0);
        }
            break;
        case CarouselDirectionBottomToTop:{//从下向上
            self.scrollView.contentOffset = CGPointMake(0, _pageIndex *self.adImageView.frame.size.height);
        }
            break;
        case CarouselDirectionTopToBottom:{//从上向下
            self.scrollView.contentOffset = CGPointMake(0, -_pageIndex *self.adImageView.frame.size.height);
        }
            break;
        default:
            break;
    }
    
}

//动画翻页
- (void)autoChangeToNextPageWithAnimation {
    //最后一页瞬间翻页
    if (fabs(self.scrollView.contentOffset.x) == (self.pictureURLs.count -1)*self.adImageView.frame.size.width ||fabs(self.scrollView.contentOffset.y) == (self.pictureURLs.count -1)*self.adImageView.frame.size.height ) {
        //瞬间回到起始页
        self.scrollView.contentOffset = CGPointMake(0, 0);
        return;
    }
    
    
    switch (self.CarouselDirection) {
        case CarouselDirectionRightToLeft:{//从右向左
            [UIView animateWithDuration:self.totalTime-self.stopTime animations:^{
                self.scrollView.contentOffset = CGPointMake(_pageIndex *self.adImageView.frame.size.width, 0);
            }];
        }
            break;
        case CarouselDirectionLeftToRight:{//从左向右
            [UIView animateWithDuration:self.totalTime-self.stopTime animations:^{
                self.scrollView.contentOffset = CGPointMake(-_pageIndex *self.adImageView.frame.size.width, 0);
            }];
        }
            break;
        case CarouselDirectionBottomToTop:{//从下向上
            [UIView animateWithDuration:self.totalTime-self.stopTime animations:^{
                self.scrollView.contentOffset = CGPointMake(0, _pageIndex *self.adImageView.frame.size.height);
            }];
        }
            break;
        case CarouselDirectionTopToBottom:{//从上向下
            [UIView animateWithDuration:self.totalTime-self.stopTime animations:^{
                self.scrollView.contentOffset = CGPointMake(0, -_pageIndex *self.adImageView.frame.size.height);
            }];
        }
            break;
            
        default:
            break;
    }
}

//点击图片
- (void)pictureClick {
    //打开网页
    if (self.advertisementUrlString == nil) {
        return;
    }
    SFSafariViewController *sarfari = [[SFSafariViewController alloc]initWithURL:[NSURL URLWithString:self.advertisementUrlString]];
    [self.window.rootViewController presentViewController:sarfari animated:YES completion:nil];
    
}
#pragma mark ------------
#pragma mark UIScrollViewDelegate
//开始滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //更改pageControl的页码
    NSInteger page = 0;
    switch (self.CarouselDirection) {
        case CarouselDirectionRightToLeft://从右向左
            page =(NSInteger)(scrollView.contentOffset.x / self.adImageView.frame.size.width + 0.5);
            break;
        case CarouselDirectionLeftToRight://从左向右
            page =(NSInteger)(-scrollView.contentOffset.x / self.adImageView.frame.size.width + 0.5);
            break;
        case CarouselDirectionBottomToTop://从下向上
            page =(NSInteger)(scrollView.contentOffset.y / self.adImageView.frame.size.height + 0.5);
            break;
        case CarouselDirectionTopToBottom://从上向下
            page =(NSInteger)(-scrollView.contentOffset.y / self.adImageView.frame.size.height + 0.5);
        default:
            break;
    }
    self.pageControl.currentPage = page;
}
//开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.timer invalidate];
}
//停止拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    _timer =[self addTimer];
}

@end
