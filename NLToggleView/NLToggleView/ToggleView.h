//
//  ToggleView.h
//  ToggleView
//
//  Created by SOMTD on 12/10/14.
//  Copyright (c) 2012年 somtd.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ToggleButton.h"
#import "ToggleBase.h"

@protocol ToggleViewDelegate;

typedef enum{
    ToggleButtonSelectedLeft,
    ToggleButtonSelectedRight,
}ToggleButtonSelected;

@interface ToggleView : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, assign) id<ToggleViewDelegate> delegate;
@property (nonatomic, strong) ToggleBase *toggleBase;
@property (nonatomic, strong) ToggleButton *toggleButton;

- (id)initWithFrame:(CGRect)frame textArray:(NSArray *)textArray;
@end

@protocol ToggleViewDelegate <NSObject>
@required
- (void)selectLeftButton;
- (void)selectRightButton;
@end
