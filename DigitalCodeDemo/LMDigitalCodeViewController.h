//
//  LMDigitalCodeViewController.h
//  DigitalCodeDemo
//
//  Created by zero on 15/7/16.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LMINPUTPASSWORD @"LMInputPassword"

typedef enum {
    LMaddPassword = 0,
    LMverifyPassword = 1,
    LMchangePassword = 2
}DigitalCodeType;

@interface LMDigitalCodeViewController : UIViewController
@property (nonatomic,assign) DigitalCodeType type;
@end
