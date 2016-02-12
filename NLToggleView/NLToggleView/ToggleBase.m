//
//  ToggleBase.m
//  ToggleView
//
//  Created by SOMTD on 12/10/15.
//  Copyright (c) 2012年 somtd.com. All rights reserved.
//

#import "ToggleBase.h"
#import "ToggleConst.h"

@interface ToggleBase ()
@property (strong,nonatomic) NSMutableArray *labelArray;
@end

@implementation ToggleBase


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.labelArray = [NSMutableArray new];
        
        self.fontSize = kFontSize;
        self.fontSelectedSize = kFontSelectedSize;
        self.bgColor = kBgColor;
        self.textColor = kTextColor;
        self.textSelectedColor = kTextSelectedColor;
        self.backgroundColor = kBgColor;
        
        self.layer.borderColor = [[UIColor blackColor]CGColor];
        self.layer.borderWidth = 0.4;
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)setTextArray:(NSArray *)textArray{
    if (textArray.count == 0) {
        NSAssert(1==0, @"文字数组不应该为空");
        return;
    }
    _textArray = textArray;
    for (int i = 0;i<textArray.count;i++) {
        NSString *title = textArray[i];
        CGFloat labelW = self.frame.size.width/textArray.count;
        CGFloat labelH = self.frame.size.height;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i * labelW, 0, labelW, labelH)];
        label.textColor = self.textColor;
        label.font = [UIFont systemFontOfSize:self.fontSize];
        label.text = title;
        label.textAlignment = NSTextAlignmentCenter;
        [self.labelArray addObject:label];
        [self addSubview:label];
    }


}


- (void)selectedLeftToggleBase
{
    UILabel *labelLeft = self.labelArray[0];
    labelLeft.textColor = kTextSelectedColor;
    labelLeft.font = [UIFont systemFontOfSize:kFontSelectedSize];
    
    UILabel *labelRight = self.labelArray[1];
    labelRight.textColor = kTextColor;
    labelRight.font = [UIFont systemFontOfSize:kFontSize];
}

- (void)selectedRightToggleBase
{
    UILabel *labelLeft = self.labelArray[0];
    labelLeft.textColor = kTextColor;
    labelLeft.font = [UIFont systemFontOfSize:kFontSize];
    
    UILabel *labelRight = self.labelArray[1];
    labelRight.textColor = kTextSelectedColor;
    labelRight.font = [UIFont systemFontOfSize:kFontSelectedSize];
}



@end
