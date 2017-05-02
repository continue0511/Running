//
//  MainTabBarViewController.m
//  Running
//
//  Created by 贾玉斌 on 2017/5/2.
//  Copyright © 2017年 running. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "BROptionsButton.h"
#import "TerritoryViewController.h"
#import "MoreViewController.h"
#import "GoViewController.h"
#import "UIColor+color.h"
#import "UIImage+image.h"

@interface MainTabBarViewController ()<BROptionButtonDelegate, CommonDelegate>
@property (nonatomic, strong) BROptionsButton *brOptionsButton;
@property (nonatomic, strong) GoViewController *goViewController;
@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //我的领地
    TerritoryViewController *territoryController = [[TerritoryViewController alloc] init];
    UINavigationController *territoryNavController = [[UINavigationController alloc]initWithRootViewController:territoryController];
    [self setTabBarWithViewController:territoryNavController title:@"领地" imageName:@"icon_find_normal" selectedImageName:@"icon_find_selected"];
    
    //Go
    self.goViewController = [[GoViewController alloc]init];
    UINavigationController *goNavController = [[UINavigationController alloc]initWithRootViewController:self.goViewController];
    
    //更多
    MoreViewController *moreController = [[MoreViewController alloc] init];
    UINavigationController *moreNavController = [[UINavigationController alloc]initWithRootViewController:moreController];
    [self setTabBarWithViewController:moreNavController title:@"更多" imageName:@"icon_helpergroup_normal" selectedImageName:@"icon_helpergroup_selected"];
    
    self.viewControllers = @[territoryController,goNavController,moreController];
    
    //设置第二个界面
    self.goViewController.commonDelegate = self;
    self.goViewController.hidesBottomBarWhenPushed = YES;
    // Do any additional setup after loading the view.
    BROptionsButton *brOption = [[BROptionsButton alloc] initWithTabBar:self.tabBar forItemIndex:1 delegate:self];
    
    self.brOptionsButton = brOption;
    //    brOption.backgroundColor = [UIColor clearColor];
    [brOption setImage:[UIImage imageNamed:@"btn_add"] forBROptionsButtonState:BROptionsButtonStateNormal];
    [brOption setImage:[UIImage imageNamed:@"btn_cancel_tab"] forBROptionsButtonState:BROptionsButtonStateOpened];
    
    self.tabBar.opaque = YES;
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    bgView.backgroundColor = [UIColor initWithLightGray];
    [self.tabBar insertSubview:bgView atIndex:0];

}

#pragma mark - 设置tabbaritem
-(void)setTabBarWithViewController:(UIViewController *)viewController title:(NSString *)title imageName:(NSString *)image selectedImageName:(NSString *)selectedImage{
    viewController.title = title;
    viewController.tabBarItem.image = [UIImage imageWithOriginal:image];
    viewController.tabBarItem.selectedImage = [UIImage imageWithOriginal:selectedImage];
    NSMutableDictionary *textAttr = [[NSMutableDictionary alloc] init];
    textAttr[NSForegroundColorAttributeName] = [UIColor initWithNormalGray];
    [viewController.tabBarItem setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    NSMutableDictionary *textSeceledAttr = [[NSMutableDictionary alloc] init];
    textSeceledAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [viewController.tabBarItem setTitleTextAttributes:textSeceledAttr forState:UIControlStateSelected];
}


#pragma mark - BROptionsButtonState

- (NSInteger)brOptionsButtonNumberOfItems:(BROptionsButton *)brOptionsButton {
    return 6;
}

- (UIImage*)brOptionsButton:(BROptionsButton *)brOptionsButton imageForItemAtIndex:(NSInteger)index {
    UIImage *image = [UIImage imageNamed:@"Apple"];
    return image;
}


- (void)brOptionsButton:(BROptionsButton *)brOptionsButton didSelectItem:(BROptionItem *)item {
    [self setSelectedIndex:brOptionsButton.locationIndexInTabBar];
}

#pragma mark - CommonDelegate

- (void)changeBROptionsButtonLocaitonTo:(NSInteger)location animated:(BOOL)animated {
    if(location < self.tabBar.items.count) {
        [self.brOptionsButton setLocationIndexInTabBar:location animated:YES];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"wrong index" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:cancel];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
