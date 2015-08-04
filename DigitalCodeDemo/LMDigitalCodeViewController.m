//
//  LMDigitalCodeViewController.m
//  DigitalCodeDemo
//
//  Created by zero on 15/7/16.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import "LMDigitalCodeViewController.h"
#import "LMDigitalView.h"
#import "LMinputView.h"


@interface LMDigitalCodeViewController ()<LMDigitalViewDelegate,LMinputViewDelegate>
@property (nonatomic,strong) LMDigitalView* digitalView;
@property (nonatomic,strong) LMinputView* showView;
@property (nonatomic,strong) NSString* input;
@property (nonatomic,strong) NSString* oldInput;
@property (nonatomic,strong) UILabel* stateLabel;
@property (nonatomic,assign) BOOL isFirstInput;
@property (nonatomic,assign) BOOL verifyOldPassword;
@end

@implementation LMDigitalCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _input = @"";
    _isFirstInput = YES;
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
    [self digitalView];
    [self showView];
    self.stateLabel.text = @"输入密码";
    if(_type == LMaddPassword){
        
    }else if(_type == LMchangePassword){
        self.stateLabel.text = @"输入原始密码";
    }else if(_type == LMverifyPassword){
    }
}

- (LMinputView*)showView{
    if(!_showView){
        _showView = [[LMinputView alloc]initWithFrame:CGRectMake((CGRectGetWidth(self.view.bounds)-150)/2.0, CGRectGetHeight(self.view.bounds)/2.0-self.digitalView.digitalButtonWidth*2.5, 150, 16)];
        _showView.delegate = self;
        [self.view addSubview:_showView];
    }
    return _showView;
}

- (UILabel*)stateLabel{
    if(!_stateLabel){
        _stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMidY(_showView.frame)-40, CGRectGetWidth(self.view.bounds), 20)];
        _stateLabel.font = [UIFont systemFontOfSize:15];
        _stateLabel.textAlignment = NSTextAlignmentCenter;
        _stateLabel.backgroundColor = [UIColor clearColor];
        _stateLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:_stateLabel];
    }
    return _stateLabel;
}

- (LMDigitalView*)digitalView{
    if(_digitalView == nil){
        _digitalView = [[LMDigitalView alloc]initWithFrame:self.view.bounds];
        _digitalView.delegate = self;
        [self.view addSubview:_digitalView];
    }
    return _digitalView;
}

- (void)didCancelDigitalButton{
    if(self.navigationController != nil){
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didSelectDigitalButtonOn:(NSInteger)num{
    self.digitalView.deleteButton.hidden = NO;
    _input = [NSString stringWithFormat:@"%@%li",_input,num];
    [self.showView addInput];
}

- (void)didDeleteDigitalButton{
    _input = [_input substringWithRange:NSMakeRange(0, _input.length-1)];
    NSLog(@"%@",_input);
    [self.showView deleteInput];
    if(_input.length == 0){
        self.digitalView.deleteButton.hidden = YES;
    }
}

- (void)didFireInputComplete{
    if(_type == LMaddPassword){
        [self AddNewPassword];
    }else if(_type == LMchangePassword){
        NSString* originPassword = [[NSUserDefaults standardUserDefaults] objectForKey:LMINPUTPASSWORD];
        if(_verifyOldPassword){
            [self AddNewPassword];
        }else{
            if([_input isEqualToString:originPassword]){
                _verifyOldPassword= YES;
                _stateLabel.text = @"请输入新密码";
                _input = @"";
                [self.showView reloadNewInput];
            }else{
                _stateLabel.text = @"俩次密码输入不一致，请重新输入";
                _input = @"";
                [self.showView reloadNewInput];
            }
        }
    }else{
        NSString* originPassword = [[NSUserDefaults standardUserDefaults] objectForKey:LMINPUTPASSWORD];
        if([_input isEqualToString:originPassword]){
            if(self.navigationController != nil){
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }else{
            _stateLabel.text = @"密码错误，请重新输入";
            _input = @"";
            [self.showView reloadMistake];
        }
    }
}

- (void)AddNewPassword{
    if(_isFirstInput){
        _oldInput = _input;
        _isFirstInput = NO;
        _stateLabel.text = @"请再次输入";
        _input = @"";
        [self.showView reloadNewInput];
    }else{
        if([_oldInput isEqualToString:_input]){
            [[NSUserDefaults standardUserDefaults]setObject:_input forKey:LMINPUTPASSWORD];
            [UIView animateWithDuration:1 animations:^{
                _stateLabel.text = @"添加成功";
            } completion:^(BOOL finished) {
                if(self.navigationController != nil){
                    [self.navigationController popViewControllerAnimated:YES];
                }else{
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
            }];
        }else{
            _isFirstInput = YES;
            _stateLabel.text = @"俩次密码输入不一致，请重新输入";
            _input = @"";
            [self.showView reloadNewInput];
        }
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
