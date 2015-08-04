//
//  ViewController.m
//  DigitalCodeDemo
//
//  Created by zero on 15/7/15.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import "ViewController.h"
#import "LMDigitalButton.h"
#import "LMDigitalCodeViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView* imv = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imv.contentMode = UIViewContentModeScaleAspectFill;
    imv.image = [UIImage imageNamed:@"IMG_0365.JPG"];
    [self.view addSubview:imv];
    UIView *hideView = [[UIView alloc]initWithFrame:self.view.bounds];
    hideView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.5];
    [self.view addSubview:hideView];
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
     UIVisualEffectView* blurView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
    blurView.alpha = 1;
    blurView.frame = imv.frame;
    [self.view addSubview:blurView];
    LMDigitalButton* btn = [[LMDigitalButton alloc]initWithFrame:CGRectMake(10, 480, 80, 80) Number:@"1"];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
//    [blurView.contentView addSubview:btn];
    [self becomeFirstResponder];
    
}

- (void)tap{
    NSLog(@"tap");
    LMDigitalCodeViewController* vc = [[LMDigitalCodeViewController alloc]init];
    vc.type = LMverifyPassword;
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
