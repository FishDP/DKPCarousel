//
//  DKPPageControlController.m
//  DKPCarousel
//
//  Created by DP on 16/7/30.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DKPPageControlController.h"
#import "DKPCarouselView.h"

@interface DKPPageControlController ()

@end

@implementation DKPPageControlController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;

    DKPCarouselView * pageControlCarouselView1 = [DKPCarouselView carouselWithPersonalFrame:CGRectMake(0, 64, DKPScreenW, 150) pageControlFrame:CGRectMake(270, 130, 50, 20) PageSource:DKPPageSource];
        //立即翻页
    pageControlCarouselView1.immediatePagingEnabled = YES;
    pageControlCarouselView1.pageControlCurrentIamge = [UIImage imageNamed:@"common_icon_membership"];
    pageControlCarouselView1.pageControlOtherIamge = [UIImage imageNamed:@"common_icon_membership_expired"];
    [self.view addSubview:pageControlCarouselView1];
    
    DKPCarouselView * pageControlCarouselView2 = [DKPCarouselView carouselWithPersonalFrame:CGRectMake(0, 64+150, DKPScreenW, 150) pageControlFrame:CGRectMake(270, 130, 50, 20) PageSource:DKPPageSource];
    pageControlCarouselView2.pageControlCurrentIamge = [UIImage imageNamed:@"common_icon_membership"];
    pageControlCarouselView2.pageControlOtherIamge = [UIImage imageNamed:@"common_icon_membership_expired"];
    [self.view addSubview:pageControlCarouselView2];

    
     DKPCarouselView * pageControlCarouselView3 = [DKPCarouselView carouselWithPersonalFrame:CGRectMake(0, 64 + 300, DKPScreenW, 150) pageControlFrame:CGRectMake(270, 130, 50, 20)  PageSource:DKPPageSource TotalTime:4 StopTime:2];
    pageControlCarouselView3.pageControlCurrentIamge = [UIImage imageNamed:@"common_icon_membership"];
    pageControlCarouselView3.pageControlOtherIamge = [UIImage imageNamed:@"common_icon_membership_expired"];
    [self.view addSubview:pageControlCarouselView3];
    
    DKPCarouselView * pageControlCarouselView4 = [DKPCarouselView carouselWithPersonalFrame:CGRectMake(0, 64+450, DKPScreenW, 150) pageControlFrame:CGRectMake(270, 130, 50, 20) PageSource:DKPPageSource];
    pageControlCarouselView4.CarouselDirection = CarouselDirectionTopToBottom;
    pageControlCarouselView4.advertisementUrlString = @"http://d06.res.meilishuo.net/pic/m/a1/14/7719001c496eca995d1f20dfebff_640_832.c5.jpg";
    pageControlCarouselView4.pageControlCurrentIamge = [UIImage imageNamed:@"common_icon_membership"];
    pageControlCarouselView4.pageControlOtherIamge = [UIImage imageNamed:@"common_icon_membership_expired"];
    [self.view addSubview:pageControlCarouselView4];
    
}
@end
