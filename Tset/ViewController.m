//
//  ViewController.m
//  Tset
//
//  Created by rimi on 15/7/15.
//  Copyright (c) 2015年 Martin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate> {
    UITabBarController * ta;
}

@property(nonatomic, strong)UIScrollView *scrollView;
@property(nonatomic, strong)UITabBarController *tabBar;
@property(nonatomic, strong)UIButton *oldButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UINavigationController *ANav = [[UINavigationController alloc]initWithRootViewController:[[AViewController alloc]init]];
    UINavigationController *BNav = [[UINavigationController alloc]initWithRootViewController:[[BViewController alloc]init]];
    UINavigationController *CNav = [[UINavigationController alloc]initWithRootViewController:[[CViewController alloc]init]];
    UINavigationController *DNav = [[UINavigationController alloc]initWithRootViewController:[[DViewController alloc]init]];
    UINavigationController *ENav = [[UINavigationController alloc]initWithRootViewController:[[EViewController alloc]init]];
    UINavigationController *FNav = [[UINavigationController alloc]initWithRootViewController:[[FViewController alloc]init]];
    UINavigationController *GNav = [[UINavigationController alloc]initWithRootViewController:[[GViewController alloc]init]];
    UINavigationController *HNav = [[UINavigationController alloc]initWithRootViewController:[[HViewController alloc]init]];
    
    _tabBar = [[UITabBarController alloc]init];
    _tabBar.viewControllers = @[ANav,BNav,CNav,DNav];
    _tabBar.tabBar.hidden = YES;
    [self addChildViewController:_tabBar];
    [self.view addSubview:_tabBar.view];
    
    ta = [[UITabBarController alloc]init];
    ta.viewControllers = @[ENav,FNav,GNav,HNav];
    ta.tabBar.hidden = YES;
    [self addChildViewController:ta];
    [self.view addSubview:ta.view];
    
    [self.view bringSubviewToFront:_tabBar.view];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 627, 375, 40)];
    _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds) * 2, 40);
    _scrollView.backgroundColor = [UIColor colorWithWhite:0.878 alpha:1.000];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
    
    NSArray *array = @[@"cd_icon.png", @"fav_icon.png", @"menu_icon.png", @"rank_icon.png", @"recent_icon.png", @"recipe_icon.png", @"settings_icon.png", @"user_icon.png"];
    
    NSArray *newArray = @[@"cded_icon.png", @"faved_icon.png", @"menued_icon.png", @"ranked_icon.png", @"recented_icon.png", @"reciped_icon.png", @"settingsed_icon.png", @"usered_icon.png"];
    
    for (NSInteger i = 0; i < 8; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.bounds = CGRectMake(0, 0, 30, 30);
        button.center = CGPointMake(46.875 + i * 93.75, CGRectGetHeight(_scrollView.bounds) / 2);
        [button setBackgroundImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:newArray[i]] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonTaped:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 10 + i;
        [_scrollView addSubview:button];
        if (button.tag == 10) {
            button.selected = YES;
            _oldButton = button;
        }
    }
    UIImageView *leftImage = [[UIImageView alloc]init];
    leftImage.bounds = CGRectMake(0, 0, 20, 70);
    leftImage.center = CGPointMake(370, 20);
    leftImage.image = [UIImage imageNamed:@"listbottom_rightarrow"];
    [_scrollView addSubview:leftImage];
    
    UIImageView *rightImage = [[UIImageView alloc]init];
    rightImage.bounds = CGRectMake(0, 0, 20, 70);
    rightImage.center = CGPointMake(380, 20);
    rightImage.image = [UIImage imageNamed:@"listbottom_leftarrow"];
    [_scrollView addSubview:rightImage];
}
- (void)buttonTaped:(UIButton *)sender{
    _tabBar.selectedIndex = sender.tag - 10;
    _oldButton.selected = NO;
    _oldButton = sender;
    if (sender.tag > 13) {
        [self.view bringSubviewToFront:ta.view];
        [self.view bringSubviewToFront:_scrollView];
        ta.selectedIndex = sender.tag - 14;
    }
    else {
        [self.view bringSubviewToFront:_tabBar.view];
        [self.view bringSubviewToFront:_scrollView];
    }
    sender.selected = YES;
}

@end
