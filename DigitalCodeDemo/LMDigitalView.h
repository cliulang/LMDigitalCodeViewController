//
//  LMDigitalView.h
//  DigitalCodeDemo
//
//  Created by zero on 15/7/16.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMDigitalButton.h"

@protocol LMDigitalViewDelegate <NSObject>

- (void)didSelectDigitalButtonOn:(NSInteger)num;
- (void)didDeleteDigitalButton;
- (void)didCancelDigitalButton;

@end

@interface LMDigitalView : UIView
@property (nonatomic,assign) id<LMDigitalViewDelegate>delegate;
@property (nonatomic,assign) CGFloat digitalButtonWidth;
@property (nonatomic,assign) CGFloat digitalButtonHorizontalDistance;
@property (nonatomic,assign) CGFloat digitalButtonVerticalDistance;
@property (nonatomic,strong) UIButton* deleteButton;
@property (nonatomic,strong) UIButton* cancelButton;
@end

