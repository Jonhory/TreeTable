//
//  NSString+Random.m
//  NewTreeTable
//
//  Created by rhcf_wujh on 16/9/27.
//  Copyright © 2016年 wjh. All rights reserved.
//

#import "NSString+Random.h"

@implementation NSString (Random)

static NSString * const lowercaseChars = @"abcdefghijklmnopqrstuvwxyz";
static NSString * const uppercaseChars = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
static NSString * const numberChars    = @"0123456789";

+ (NSString *)randomStr{
    NSString * str = [NSString stringWithFormat:@"%@%@%@",lowercaseChars,uppercaseChars,numberChars];
    int length = 6;
    NSString * newStr = @"";
    for (int i = 0; i<length; i++){
        int index = arc4random()%str.length;
        NSRange range = NSMakeRange(index, 1);
        NSString * random = [str substringWithRange:range];
        newStr = [newStr stringByAppendingString:random];
    }
    return newStr;
}

@end
