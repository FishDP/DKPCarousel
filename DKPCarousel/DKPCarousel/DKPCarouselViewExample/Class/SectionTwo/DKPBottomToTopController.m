//
//  DKPBottomToTopController.m
//  DKPCarousel
//
//  Created by DP on 16/7/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DKPBottomToTopController.h"
#import "DKPCarouselView.h"
@interface DKPBottomToTopController ()

@end

@implementation DKPBottomToTopController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    DKPCarouselView * bottomToTopCarouselView = [DKPCarouselView carouselWithPersonalFrame:CGRectMake(0, 64, DKPScreenW, 150) pageControlFrame:CGRectMake(300, 130, 50, 20) PageSource:DKPPageSource];
    bottomToTopCarouselView.CarouselDirection = CarouselDirectionBottomToTop;
//    bottomToTopCarouselView.stopTime = 1.0;
    [self.view addSubview:bottomToTopCarouselView];

}



@end
