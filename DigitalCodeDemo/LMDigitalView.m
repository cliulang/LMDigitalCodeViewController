//
//  LMDigitalView.m
//  DigitalCodeDemo
//
//  Created by zero on 15/7/16.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import "LMDigitalView.h"


@interface LMDigitalView ()

@end

@implementation LMDigitalView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        _digitalButtonWidth = 80;
        _digitalButtonHorizontalDistance = 15/320.0*CGRectGetWidth([UIScreen mainScreen].bounds);
        _digitalButtonVerticalDistance = 10/568.0*CGRectGetHeight([UIScreen mainScreen].bounds);
        CGFloat originX = 0;
        CGFloat originY = CGRectGetHeight(frame)/2.0-_digitalButtonVerticalDistance - _digitalButtonWidth*1.5 +20; //20为偏移量，中心往下偏移20像素
        for(int i = 1; i <= 10; i++){
            if(i == 1 || i == 4 || i ==7){
                if(i != 1){
                    originY += _digitalButtonWidth + _digitalButtonVerticalDistance;
                }
                originX = CGRectGetWidth(frame)/2.0-_digitalButtonHorizontalDistance - _digitalButtonWidth*1.5;
            }else if( i == 10){
                originY += _digitalButtonWidth + _digitalButtonVerticalDistance;;
                originX = CGRectGetWidth(frame)/2.0 - _digitalButtonWidth*0.5;
            }
            
            NSString* num = nil;
            if(i == 10){
                num = @"0";
            }else{
                num = [NSString stringWithFormat:@"%i",i];
            }
            LMDigitalButton* btn = [[LMDigitalButton alloc]initWithFrame:CGRectMake(originX, originY, _digitalButtonWidth, _digitalButtonWidth) Number:num];
            [btn addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            if(i == 10){
                if(_cancelButton == nil){
                    _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
                    _cancelButton.frame = CGRectMake(originX-_digitalButtonHorizontalDistance-_digitalButtonWidth, originY, _digitalButtonWidth, _digitalButtonWidth);
                    [_cancelButton setBackgroundColor:[UIColor clearColor]];
                    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
                    [_cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    [_cancelButton addTarget:self action:@selector(didCancelAction) forControlEvents:UIControlEventTouchUpInside];
                    [self addSubview:_cancelButton];
                }
            }
            originX += _digitalButtonWidth+_digitalButtonHorizontalDistance;
            if(i == 10){
                if(_deleteButton == nil){
                    _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
                    _deleteButton.frame = CGRectMake(originX, originY, _digitalButtonWidth, _digitalButtonWidth);
                    [_deleteButton setBackgroundColor:[UIColor clearColor]];
                    [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];
                    [_deleteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    [_deleteButton addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
                    _deleteButton.hidden = YES;
                }
                [self addSubview:_deleteButton];
            }
            
        }
    }
    return self;
}

- (void)didCancelAction{
    if([_delegate respondsToSelector:@selector(didCancelDigitalButton)]){
        [_delegate didCancelDigitalButton];
    }
}

- (void)deleteAction{
    if([_delegate respondsToSelector:@selector(didDeleteDigitalButton)]){
        [_delegate didDeleteDigitalButton];
    }
}

- (void)tap:(LMDigitalButton*)sender{
    NSLog(@"%li",sender.tag);
    if([_delegate respondsToSelector:@selector(didSelectDigitalButtonOn:)]){
        [_delegate didSelectDigitalButtonOn:sender.tag];
    }
}

@end
