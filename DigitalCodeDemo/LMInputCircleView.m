//
//  LMInputCircleView.m
//  DigitalCodeDemo
//
//  Created by zero on 15/7/16.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import "LMInputCircleView.h"

@implementation LMInputCircleView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.layer.cornerRadius = CGRectGetHeight(frame)/2.0;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 0.6;
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)setIsFill:(BOOL)isFill{
    if(_isFill != isFill){
        _isFill = isFill;
        if(_isFill){
            [self setBackgroundColor:[UIColor whiteColor]];
        }else{
            [self setBackgroundColor:[UIColor clearColor]];
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
