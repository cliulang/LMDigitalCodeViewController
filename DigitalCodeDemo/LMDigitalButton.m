//
//  LMDigitalButton.m
//  DigitalCodeDemo
//
//  Created by zero on 15/7/15.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import "LMDigitalButton.h"

@implementation LMDigitalButton

- (id)initWithFrame:(CGRect)frame Number:(NSString*)num{
    self = [super init];
    if(self){
        self.frame = frame;
        _selectColor = [UIColor colorWithWhite:1 alpha:0.5];
        self.layer.cornerRadius = CGRectGetHeight(self.frame)/2.0;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = _selectColor.CGColor;
        self.layer.borderWidth = 1;
        self.titleLabel.font = [UIFont systemFontOfSize:38];
        [self setTitle:num forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.tag = [num integerValue];
    }
    return self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    self.backgroundColor = _selectColor;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesCancelled:touches withEvent:event];
     [self resetBackgroundColor];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
     [super touchesEnded:touches withEvent:event];
    [self resetBackgroundColor];
}



- (void)resetBackgroundColor{
    [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         [self setBackgroundColor:[UIColor clearColor]];
                     } completion:^(BOOL finished) {
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
