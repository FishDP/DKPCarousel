//
//  DKPRightToLeftController.m
//  DKPCarousel
//
//  Created by DP on 16/7/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DKPRightToLeftController.h"
#import "DKPCarouselView.h"

@interface DKPRightToLeftController ()

@end

@implementation DKPRightToLeftController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    DKPCarouselView * rightToLeftCarouselView = [DKPCarouselView carouselWithPersonalFrame:CGRectMake(0, 64, DKPScreenW, 150) pageControlFrame:CGRectMake(300, 130, 50, 20) PageSource:DKPPageSource];
//    rightToLeftCarouselView.stopTime = 1.0;
    [self.view addSubview:rightToLeftCarouselView];
    
}

@end
