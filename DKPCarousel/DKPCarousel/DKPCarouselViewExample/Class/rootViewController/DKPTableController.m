//
//  DKPTableController.m
//  DKPCarousel
//
//  Created by DP on 16/7/29.
//  Copyright © 2016年 DP. All rights reserved.
//

#import "DKPTableController.h"
#import "DKPDefautController.h"
#import "DKPLeftToRightController.h"
#import "DKPBottomToTopController.h"
#import "DKPTopToBottomController.h"
#import "DKPRightToLeftController.h"
#import "DKPPageControlController.h"


@interface DKPTableController ()
@property (nonatomic, strong) NSMutableArray *titleArrM;
@property (nonatomic, strong) NSMutableArray *contentOne;
@property (nonatomic, strong) NSMutableArray *contentTwo;
@property (nonatomic, strong) NSMutableArray *contentThree;



@end

static NSString *const ID = @"cell";
@implementation DKPTableController
- (NSMutableArray *)titleArrM {
    if (!_titleArrM) {
        _titleArrM = [NSMutableArray array];
    }
    return _titleArrM;
}
- (NSMutableArray *)contentOne {
    if (!_contentOne) {
        _contentOne = [NSMutableArray array];
    }
    return _contentOne;
}
- (NSMutableArray *)contentTwo {
    if (!_contentTwo) {
        _contentTwo = [NSMutableArray array];
    }
    return _contentTwo;
}
- (NSMutableArray *)contentThree {
    if (!_contentThree) {
        _contentThree = [NSMutableArray array];
    }
    return _contentThree;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    
    NSArray *title = @[@"基础设置",@"改变方向",@"自定义设置"];
    [self.titleArrM addObjectsFromArray:title];
    NSArray *contentOne = @[@"默认设置"];
    [self.contentOne addObjectsFromArray:contentOne];
    NSArray *contentTwo = @[@"RightToLeft",@"LeftToRight",@"BottomToTop",@"TopToBottom"];
     [self.contentTwo addObjectsFromArray:contentTwo];
    NSArray *contentThree = @[@"自定义pageControl显示图片"];
     [self.contentThree addObjectsFromArray:contentThree];

    
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.titleArrM.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        
        return self.contentOne.count;
    }else if (section == 1) {
       return self.contentTwo.count;
    }else {
      return self.contentThree.count;
    }
    
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    
    if (indexPath.section == 0) {
        
        cell.textLabel.text = self.contentOne[indexPath.row];
    }else if (indexPath.section == 1) {
          cell.textLabel.text = self.contentTwo[indexPath.row];
    }else {
         cell.textLabel.text = self.contentThree[indexPath.row];
    }
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  
    return self.titleArrM[section];
}
#pragma mark ------------
#pragma mark UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        DKPDefautController *defaultVc = [[DKPDefautController alloc]init];
        [self.navigationController pushViewController:defaultVc animated:YES];        
    }else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            DKPRightToLeftController *RightToLeftVc = [[DKPRightToLeftController alloc]init];
            [self.navigationController pushViewController:RightToLeftVc animated:YES];
        
        }else if (indexPath.row == 1) {
            DKPLeftToRightController *LeftToRightVc = [[DKPLeftToRightController alloc]init];
            [self.navigationController pushViewController:LeftToRightVc animated:YES];

        }else if (indexPath.row == 2) {
            DKPBottomToTopController *BottomToTopVc = [[DKPBottomToTopController alloc]init];
            [self.navigationController pushViewController:BottomToTopVc animated:YES];
        }else if (indexPath.row == 3) {
            DKPTopToBottomController *TopToBottomVc = [[DKPTopToBottomController alloc]init];
            [self.navigationController pushViewController:TopToBottomVc animated:YES];
        }
    }else if (indexPath.section == 2) {
        DKPPageControlController *PageControlVc = [[DKPPageControlController alloc]init];
        [self.navigationController pushViewController:PageControlVc animated:YES];
    }
}

@end
