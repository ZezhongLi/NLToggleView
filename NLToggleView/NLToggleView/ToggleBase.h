//
//  ToggleBase.h
//  ToggleView
//
//  Created by SOMTD on 12/10/15.
//  Copyright (c) 2012年 somtd.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ToggleBase : UIView

@property (strong,nonatomic) NSArray *textArray;
@property (assign,nonatomic) int fontSize;
@property (assign,nonatomic) int fontSelectedSize;
@property (strong,nonatomic) UIColor * bgColor;
@property (strong,nonatomic) UIColor * textColor;
@property (strong,nonatomic) UIColor * textSelectedColor;


- (void)selectedLeftToggleBase;
- (void)selectedRightToggleBase;

@end
