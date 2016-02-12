//
//  ToggleButton.m
//  ToggleView
//
//  Created by SOMTD on 12/10/15.
//  Copyright (c) 2012年 somtd.com. All rights reserved.
//

#import "ToggleButton.h"
#import "ToggleConst.h"

@implementation ToggleButton


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kButtonColor;
        self.alpha = 0.2;
        self.layer.cornerRadius = 3;
        
    }
    return self;
}

- (void)selectedLeftToggleButton
{
    
}

- (void)selectedRightToggleButton
{
    
}
@end
