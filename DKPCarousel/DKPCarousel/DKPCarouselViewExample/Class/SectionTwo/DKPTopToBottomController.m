//
//  DKPTopToBottomController.m
//  DKPCarousel
//
//  Created by DP on 16/7/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DKPTopToBottomController.h"
#import "DKPCarouselView.h"

@interface DKPTopToBottomController ()

@end

@implementation DKPTopToBottomController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    DKPCarouselView * topToBottomCarouselView = [DKPCarouselView carouselWithPersonalFrame:CGRectMake(0, 64, DKPScreenW, 150) pageControlFrame:CGRectMake(300, 130, 50, 20) PageSource:DKPPageSource];
    topToBottomCarouselView.CarouselDirection = CarouselDirectionTopToBottom;
//    topToBottomCarouselView.stopTime = 1.0;
    
    [self.view addSubview:topToBottomCarouselView];
    
}

@end
