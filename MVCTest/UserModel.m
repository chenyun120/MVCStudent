//
//  UserModel.m
//  MVCTest
//
//  Created by Chenyun on 14-11-2.
//  Copyright (c) 2014年 geek-zoo. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (void)userLogin
{
	// 初始化
	USER_SIGNIN_API * api = [USER_SIGNIN_API new];

	// 传参数
	api.req.mobile_phone = @"1231222111111";
	
	api.whenUpdate = ^(id data, NSError * error) {
		
	};
	
	// 发送
	[api send];
}

@end
