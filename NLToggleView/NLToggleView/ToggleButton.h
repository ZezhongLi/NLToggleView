//
//  ToggleButton.h
//  ToggleView
//
//  Created by SOMTD on 12/10/15.
//  Copyright (c) 2012年 somtd.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ToggleButton : UIView

@property (strong,nonatomic) UIColor *buttonColor;

- (void)selectedLeftToggleButton;
- (void)selectedRightToggleButton;

@end
