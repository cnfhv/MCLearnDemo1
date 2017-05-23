//
//  NSDictionary+chinese.m
//  MCRunLoopDemo1
//
//  Created by MC on 2017/5/22.
//  Copyright © 2017年 MC. All rights reserved.
//

#import "NSDictionary+chinese.h"

@implementation NSDictionary (chinese)

- (NSString *)descriptionWithLocale:(id)locale
{
    
    NSMutableString *strM = [NSMutableString string];
    [strM appendString:@"{\n"];
    
    for (id obj in [self allKeys]) {
        [strM appendFormat:@"\t\t%@,", obj];
        
        [strM appendFormat:@"%@\n", self[obj]];
    }
    
    [strM appendString:@"}"];
    
    return strM;
}

@end
