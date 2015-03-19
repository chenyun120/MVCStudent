//
//  NSDictionary+transform.m
//  mplus
//
//  Created by Chenyun on 14-10-13.
//  Copyright (c) 2014年 geek-zoo. All rights reserved.
//

#import "NSDictionary+transform.h"

@implementation NSDictionary (transform)
- (NSString *)stringWithDictionary
{
	NSData * jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];

	NSString * str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
	
	return str;
}
@end
