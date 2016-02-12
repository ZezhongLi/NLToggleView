//
//  ToggleView.m
//  ToggleView
//
//  Created by SOMTD on 12/10/14.
//  Copyright (c) 2012年 somtd.com. All rights reserved.
//

#import "ToggleView.h"
#import "ToggleButton.h"
#import "ToggleBase.h"

#define TOGGLE_SLIDE_DURATION 0.1f

@interface ToggleView ()

@property (assign,nonatomic) float leftEdge;
@property (assign,nonatomic) float rightEdge;

@end


@implementation ToggleView 


- (id)initWithFrame:(CGRect)frame textArray:(NSArray *)textArray
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        
        
        self.backgroundColor = [UIColor clearColor];
        
        //base setting
        _toggleBase = [[ToggleBase alloc]initWithFrame:self.bounds];
        
        [_toggleBase setTextArray:textArray];
        
        [self addSubview:_toggleBase];
        
        //button setting
        _toggleButton = [[ToggleButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width*0.5, self.frame.size.height)];
        [self addSubview:_toggleButton];
        
        _leftEdge = _toggleBase.frame.origin.x + _toggleButton.frame.size.width/2;
        _rightEdge = _toggleBase.frame.origin.x + _toggleBase.frame.size.width - _toggleButton.frame.size.width/2;
        
        UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        
        UITapGestureRecognizer* baseTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleBaseTapGesture:)];
        
        [_toggleButton addGestureRecognizer:panGesture];
        [_toggleBase addGestureRecognizer:baseTapGesture];
    }
    return self;
}


- (void)setTogglePosition:(float)positonValue ended:(BOOL)isEnded
{
    if (!isEnded)
    {
        if (positonValue == 0.f)
        {
            _toggleButton.center = CGPointMake(_leftEdge, _toggleButton.center.y);
        }
        else if (positonValue == 1.f)
        {
            _toggleButton.center = CGPointMake(_rightEdge, _toggleButton.center.y);
        }
        else
        {
            _toggleButton.center = CGPointMake(_toggleBase.frame.origin.x + (positonValue * _toggleBase.frame.size.width), _toggleButton.center.y);
        }
        
    }
    else //isEnded == YES;
    {
        if (positonValue == 0.f)
        {
            _toggleButton.center = CGPointMake(_leftEdge, _toggleButton.center.y);
            [_toggleBase selectedLeftToggleBase];
            [_toggleButton selectedLeftToggleButton];
            [self.delegate selectLeftButton];
            
        }
        else if (positonValue == 1.f)
        {
            _toggleButton.center = CGPointMake(_rightEdge, _toggleButton.center.y);
            [_toggleBase selectedRightToggleBase];
            [_toggleButton selectedRightToggleButton];
            [self.delegate selectRightButton];
        }
        else if (positonValue > 0.f && positonValue < 0.5f)
        {
            [UIView animateWithDuration:TOGGLE_SLIDE_DURATION animations:^{
                _toggleButton.center = CGPointMake(_leftEdge, _toggleButton.center.y);
            } completion:^(BOOL finished) {
                [_toggleBase selectedLeftToggleBase];
                [_toggleButton selectedLeftToggleButton];
                [self.delegate selectLeftButton];
            }];
        }
        else if (positonValue >= 0.5f && positonValue < 1.f)
        {
            [UIView animateWithDuration:TOGGLE_SLIDE_DURATION animations:^{
                _toggleButton.center = CGPointMake(_rightEdge, _toggleButton.center.y);
            } completion:^(BOOL finished) {
                [_toggleBase selectedRightToggleBase];
                [_toggleButton selectedRightToggleButton];
                [self.delegate selectRightButton];
            }];
        }
    }
}


- (void)handleBaseTapGesture:(UITapGestureRecognizer*) sender {
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        if (_toggleButton.center.x == _rightEdge)
        {
            [UIView animateWithDuration:TOGGLE_SLIDE_DURATION animations:^{
                _toggleButton.center = CGPointMake(_leftEdge, _toggleButton.center.y);
            }completion:^(BOOL finished) {
                [_toggleBase selectedLeftToggleBase];
                [_toggleButton selectedLeftToggleButton];
                [self.delegate selectLeftButton];
            }];
        }
        else if (_toggleButton.center.x == _leftEdge)
        {
            [UIView animateWithDuration:TOGGLE_SLIDE_DURATION animations:^{
                _toggleButton.center = CGPointMake(_rightEdge, _toggleButton.center.y);
            }completion:^(BOOL finished) {
                [_toggleBase selectedRightToggleBase];
                [_toggleButton selectedRightToggleButton];
                [self.delegate selectRightButton];
            }];
        }
    }
}


- (void)handlePanGesture:(UIPanGestureRecognizer*) sender {

    if (sender.state == UIGestureRecognizerStateBegan)
    {
        CGPoint currentPoint = [sender locationInView:_toggleBase];
        float position = currentPoint.x;
        float positionValue = position / _toggleBase.frame.size.width;
        
        if (positionValue < 1.f && positionValue > 0.f)
        {
            [self setTogglePosition:positionValue ended:NO];
        }
    }
    
    if (sender.state == UIGestureRecognizerStateChanged)
    {
        CGPoint currentPoint = [sender locationInView:_toggleBase];
        float position = currentPoint.x;
        float positionValue = position / _toggleBase.frame.size.width;
        
        if (positionValue < 1.f && positionValue > 0.f)
        {
            [self setTogglePosition:positionValue ended:NO];
        }else if (positionValue >= 1.f)
        {
            [self setTogglePosition:1.f ended:NO];
        }
        else if (positionValue <= 0.f)
        {
            [self setTogglePosition:0.f ended:NO];
        }
    }
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        
        CGPoint currentPoint = [sender locationInView:_toggleBase];
        float position = currentPoint.x;
        float positionValue = position / _toggleBase.frame.size.width;
        
        if (positionValue < 1.f && positionValue > 0.f)
        {
            [self setTogglePosition:positionValue ended:YES];
        }
        else if (positionValue >= 1.f)
        {
            [self setTogglePosition:1.f ended:YES];
        }
        else if (positionValue <= 0.f)
        {
            [self setTogglePosition:0.f ended:YES];
        }
    }
}



@end
