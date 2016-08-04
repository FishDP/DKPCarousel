//
//  DKPDefautController.m
//  DKPCarousel
//
//  Created by DP on 16/7/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DKPDefautController.h"
#import "DKPCarouselView.h"

@interface DKPDefautController ()

@end

@implementation DKPDefautController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    DKPCarouselView * defaultCarouselView = [DKPCarouselView carouselWithPersonalFrame:CGRectMake(0, 64, DKPScreenW, 150) pageControlFrame:CGRectMake(300, 130, 50, 20) PageSource:DKPPageSource];
    [self.view addSubview:defaultCarouselView];
    
    
    
}



@end
