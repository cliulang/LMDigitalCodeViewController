//
//  LMinputView.h
//  DigitalCodeDemo
//
//  Created by zero on 15/7/16.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LMinputViewDelegate <NSObject>

- (void)didFireInputComplete;

@end
@interface LMinputView : UIView
@property (nonatomic,assign) NSInteger inputNum;//控制输入的数量
@property (nonatomic,assign) id<LMinputViewDelegate>delegate;
- (void)reloadMistake;
- (void)reloadNewInput;
- (void)addInput;
- (void)deleteInput;
@end
