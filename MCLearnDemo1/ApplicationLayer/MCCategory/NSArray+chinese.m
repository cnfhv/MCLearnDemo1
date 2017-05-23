//
//  NSArray+chinese.m
//  MCRunLoopDemo1
//
//  Created by MC on 2017/5/22.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "NSArray+chinese.h"

@implementation NSArray (chinese)

- (NSString *)descriptionWithLocale:(id)locale
{
    
    NSMutableString *strM = [NSMutableString string];
    [strM appendString:@"(\n"];
    
    for (id obj in self) {
        [strM appendFormat:@"\t\t%@,\n", obj];
    }
    [strM appendString:@")"];
    
    return strM;
}


@end
