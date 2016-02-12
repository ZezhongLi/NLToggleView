//
//  ViewController.m
//  NLToggleView
//
//  Created by Neil-Lee on 15/5/19.
//  Copyright (c) 2015年 Neil-Lee. All rights reserved.
//

#import "ViewController.h"
#import "ToggleView.h"

@interface ViewController ()<ToggleViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    ToggleView *toggle = [[ToggleView alloc]initWithFrame:CGRectMake(50, 100, 120, 20) textArray:@[@"搭配",@"单品"]];
    
    toggle.delegate = self;
    
    [self.view addSubview:toggle];
    
}

- (void)selectLeftButton{
    NSLog(@"selectLeftButton");
    
}
- (void)selectRightButton{
    NSLog(@"selectRightButton");
}

@end
