//
//  DKPCarouselView.h
//  DKPCarouselAnimation
//
//  Created by DP on 16/7/26.
//  Copyright © 2016年 DP. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, CarouselDirection) {
    /**从右向左*/
    CarouselDirectionRightToLeft,//default is RightToLeft
    /**从左边向右*/
    CarouselDirectionLeftToRight,
    /**从下往上*/
    CarouselDirectionBottomToTop,
    /**从上往下*/
    CarouselDirectionTopToBottom
};


@interface DKPCarouselView : UIView

//滚动方向
@property (nonatomic, assign) CarouselDirection CarouselDirection;
//UIScrollView
@property (nonatomic, strong) UIScrollView *scrollView;
//UIPageControl
@property (nonatomic, strong) UIPageControl *pageControl;
//是否允许立即翻页
@property (nonatomic, assign) BOOL immediatePagingEnabled;
//pageControl当前显示图片
@property (nonatomic, strong)  UIImage *pageControlCurrentIamge;
//pageControl其他图片
@property (nonatomic, strong)  UIImage *pageControlOtherIamge;
//广告ulr
@property (nonatomic, copy) NSString *advertisementUrlString;

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
- (instancetype)initWithPersonalFrame:(CGRect)personalFrame pageControlFrame:(CGRect)pageControlFrame PageSource:(NSArray*)pages TotalTime:(NSInteger) totalTime StopTime:(NSInteger) stopTime;

- (instancetype)initWithPersonalFrame:(CGRect)personalFrame pageControlFrame:(CGRect)pageControlFrame PageSource:(NSArray*)pages;

+ (instancetype)carouselWithPersonalFrame:(CGRect)personalFrame pageControlFrame:(CGRect)pageControlFrame PageSource:(NSArray*)pages TotalTime:(NSInteger) totalTime StopTime:(NSInteger) stopTime;

+ (instancetype)carouselWithPersonalFrame:(CGRect)personalFrame pageControlFrame:(CGRect)pageControlFrame PageSource:(NSArray*)pages;



- (void)loadPicturesWithFrame:(CGRect)pictureFrame;
@end
