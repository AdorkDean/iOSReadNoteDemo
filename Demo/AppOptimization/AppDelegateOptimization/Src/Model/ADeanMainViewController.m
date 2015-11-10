//
//  TFMainViewController.m
//  AppDelegateOptimization
//
//  Created by adorkable dean on 15/11/10.
//  Copyright © 2015年 ADean. All rights reserved.
//

#import "ADeanMainViewController.h"

@interface ADeanMainViewController ()

@property (nonatomic, strong) UIViewController *tfHomeViewController;
@property (nonatomic, strong) UIViewController *tfMoreViewController;
@property (nonatomic, strong) UIViewController *tfAssortViewController;

@end

@implementation ADeanMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"TabsInfo" ofType:@"plist"];
    NSArray *tabsInfo = [NSArray arrayWithContentsOfFile:plistPath];
    for (NSDictionary *dict in tabsInfo)
    {
        NSString *imageName = [dict objectForKey:@"defaultImageName"];
        NSString *selectedImageName =[dict objectForKey:@"selectedImageName"];
        NSString *tabName = [dict objectForKey:@"tabtitle"];
        if ([tabName isEqualToString:@"首页"])
        {
            //页面1 首页
            [[self.tfHomeViewController tabBarItem] setTitle:tabName];
            self.tfHomeViewController.navigationItem.title = @"首页";
            [self.tfHomeViewController tabBarItem].tag = 1;
            [[self.tfHomeViewController tabBarItem] setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            [[self.tfHomeViewController tabBarItem] setSelectedImage:[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        }
        else if ([tabName isEqualToString:@"分类"])
        {
            //页面2 分类
            [[self.tfAssortViewController tabBarItem] setTitle:tabName];
            self.tfAssortViewController.title = tabName;
            [self.tfAssortViewController tabBarItem].tag = 2;
            [[self.tfAssortViewController tabBarItem] setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            [[self.tfAssortViewController tabBarItem] setSelectedImage:[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        }
        else if ([tabName isEqualToString:@"账户"])
        {
            //页面3 账户页
            [[self.tfMoreViewController tabBarItem] setTitle:tabName];
            self.tfMoreViewController.title = tabName;
            [self.tfMoreViewController tabBarItem].tag = 3;
            [[self.tfMoreViewController tabBarItem] setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            [[self.tfMoreViewController tabBarItem] setSelectedImage:[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        }
    }
    UINavigationController *nhomeNavVC = [[UINavigationController alloc] initWithRootViewController:self.tfHomeViewController];
    UINavigationController *exploreNavVC = [[UINavigationController alloc] initWithRootViewController:self.tfAssortViewController];
    UINavigationController *moreNavVC = [[UINavigationController alloc] initWithRootViewController:self.tfMoreViewController];
    self.viewControllers = [NSArray arrayWithObjects:nhomeNavVC, exploreNavVC, moreNavVC,nil];
    self.selectedIndex = 0;
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    
    [self.tabBar setBarTintColor:[UIColor whiteColor]];
}

- (UIViewController *)tfHomeViewController {
    if(!_tfHomeViewController) {
        _tfHomeViewController = [[UIViewController alloc] init];
        _tfHomeViewController.view.backgroundColor = [UIColor redColor];
    }
    return _tfHomeViewController;
}


- (UIViewController *)tfAssortViewController {
    if(!_tfAssortViewController) {
        _tfAssortViewController = [[UIViewController alloc] init];
        _tfAssortViewController.view.backgroundColor = [UIColor greenColor];
    }
    return _tfAssortViewController;
}

- (UIViewController *)tfMoreViewController {
    if(!_tfMoreViewController) {
        _tfMoreViewController = [[UIViewController alloc] init];
        _tfMoreViewController.view.backgroundColor = [UIColor yellowColor];
    }
    return _tfMoreViewController;
}
@end
