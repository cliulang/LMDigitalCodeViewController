

//
//  LMinputView.m
//  DigitalCodeDemo
//
//  Created by zero on 15/7/16.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import "LMinputView.h"
#import "LMInputCircleView.h"
@interface LMinputView ()
@property (nonatomic,strong) NSMutableArray* circleArray;
@property (nonatomic,strong) NSTimer* timer;
@end

@implementation LMinputView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        _inputNum = 0;
        CGFloat circleHeight = CGRectGetHeight(frame);
        CGFloat distance = (CGRectGetWidth(frame)-circleHeight*4)/3;
        _circleArray = [NSMutableArray array];
        for(int i = 0; i < 4; i++){
            LMInputCircleView* circle = [[LMInputCircleView alloc]initWithFrame:CGRectMake(i*(circleHeight+distance), 0, circleHeight, circleHeight)];
            [self addSubview:circle];
            [_circleArray addObject:circle];
        }
    }
    return self;
}

- (void)addInput{
    self.inputNum++;
    if(self.inputNum == 4){
        if([_delegate respondsToSelector:@selector(didFireInputComplete)]){
            [_delegate didFireInputComplete];
        }
    }
}

- (void)deleteInput{
    LMInputCircleView* circle = [_circleArray objectAtIndex:self.inputNum-1];
    circle.isFill = NO;
    _inputNum--;
    if(_inputNum < 0){
        _inputNum = 0;
    }
}


- (void)setInputNum:(NSInteger)inputNum{
    _inputNum = inputNum;
    if(inputNum== 0){
        for(LMInputCircleView* circle in _circleArray){
            circle.isFill = NO;
        }
    }else{
        LMInputCircleView* circle = [_circleArray objectAtIndex:inputNum-1];
        circle.isFill = YES;
    }
}

- (void)reloadMistake{
    [self moveSelf];
    [UIView animateWithDuration:1 animations:^{
        self.inputNum = 0;
    }];
}

- (void)reloadNewInput{
    CGFloat  origin = CGRectGetMinX(self.frame);
    CGFloat time = 0.2;
    [UIView animateWithDuration:time animations:^{
        CGRect rect = self.frame;
        rect.origin.x = 0-CGRectGetWidth(self.frame);
        self.frame = rect;
    } completion:^(BOOL finished) {
        self.inputNum = 0;
        CGRect rect = self.frame;
        rect.origin.x = CGRectGetWidth(self.superview.frame);
        self.frame = rect;
        
        [UIView animateWithDuration:time animations:^{
            CGRect rect = self.frame;
            rect.origin.x = origin;
            self.frame = rect;
        } completion:^(BOOL finished) {
            
        }];
    }];
}

- (void)moveSelf{
    static NSInteger num = 0;
    CGFloat  origin = CGRectGetMinX(self.frame);
    BOOL left = num%2;
    CGFloat time = 0.04;
    [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveEaseInOut  animations:^{
        CGRect rect = self.frame;
        if(left){
            rect.origin.x -= 30;
        }else{
            rect.origin.x += 30;
        }
        self.frame = rect;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:time animations:^{
            CGRect rect = self.frame;
            rect.origin.x = origin;
            self.frame = rect;
        }];
        num ++;
        if(num == 6){
            num = 0;
        }else{
            [self moveSelf];
        }
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
