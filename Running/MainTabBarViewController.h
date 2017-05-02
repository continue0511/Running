//
//  MainTabBarViewController.h
//  Running
//
//  Created by 贾玉斌 on 2017/5/2.
//  Copyright © 2017年 running. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTabBarViewController : UITabBarController

@end

@protocol CommonDelegate <NSObject>
- (void)changeBROptionsButtonLocaitonTo:(NSInteger)location animated:(BOOL)animated;
@end
