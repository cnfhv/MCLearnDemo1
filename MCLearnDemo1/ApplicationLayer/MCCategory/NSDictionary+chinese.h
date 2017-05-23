//
//  NSDictionary+chinese.h
//  MCRunLoopDemo1
//
//  Created by MC on 2017/5/22.
//  Copyright © 2017年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (chinese)

//解决后台输出中文
- (NSString *)descriptionWithLocale:(id)locale;

@end
