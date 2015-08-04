//
//  LMDigitalButton.h
//  DigitalCodeDemo
//
//  Created by zero on 15/7/15.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMDigitalButton : UIButton


@property (nonatomic,strong) UIColor *selectColor;

- (id)initWithFrame:(CGRect)frame Number:(NSString*)num;
@end
