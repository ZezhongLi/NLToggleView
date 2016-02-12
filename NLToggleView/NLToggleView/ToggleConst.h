//
//  GJConst.h
//  guju
//
//  Created by Neil-Lee on 15/5/12.
//  Copyright (c) 2015年 Neil-Lee. All rights reserved.
//


#import <Foundation/Foundation.h>


#ifdef DEBUG // 处于开发阶段
#define NLLog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define NLLog(...)
#endif


// RGB颜色
#define NLColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 随机色
#define NLRandomColor NLColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define KscreenW ([[UIScreen mainScreen]bounds].size.width)
#define KscreenH ([[UIScreen mainScreen]bounds].size.height)

#define kFontSize 13
#define kFontSelectedSize 15
#define kTextColor NLColor(200,200,200)
#define kTextSelectedColor NLColor(255,255,255)
#define kBgColor NLColor(181,116,62)

#define kButtonColor NLColor(255,255,255)




