//
//  mplus.m
//  mplus
//
//  Created by Chenyun on 14-10-13.
//  Copyright (c) 2014年 geek-zoo. All rights reserved.
//

#import "mplus_old.h"
#import "NSDictionary+transform.h"


static NSString * const STAPIBaseURLString = @"http://api.stos.co:8080/api";

#pragma mark - Entity

#pragma mark - API

@implementation STClient

+ (instancetype)sharedClient
{
	static STClient * _sharedClient = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedClient = [[STClient alloc] initWithBaseURL:[NSURL URLWithString:STAPIBaseURLString]];
		_sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
	});
	
	return _sharedClient;
}

@end

#pragma mark - /user/signin

@implementation USER_SIGNIN_REQUEST

@end

@implementation USER_SIGNIN_RESPONSE
@end

@implementation USER_SIGNIN_API

- (instancetype)init
{
	self = [super init];
	
	if ( self )
	{
		self.req = [USER_SIGNIN_REQUEST requsetWithEndpoint:@"user/signin"];
	}

	return self;
}

- (void)send
{
	[[STClient sharedClient].requestSerializer setValue:@"sign" forHTTPHeaderField:[self.req.parameters stringWithDictionary]];

	[[STClient sharedClient] POST:self.req.endpoint
                       parameters:@{@"json":[self.req.parameters stringWithDictionary]}
						 success:^(AFHTTPRequestOperation *operation, id responseObject) {
							 self.resp = [USER_SIGNIN_RESPONSE objectWithDictionary:responseObject];
							 NSError * error = [[NSError alloc] initWithDomain:self.resp.error_desc code:self.resp.error_code userInfo:nil];
							 self.whenUpdate(self.resp, error);
						 }
						 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//							 NSLog(@"%@",error);
							 self.whenUpdate(self.resp, error);
						 }
	 ];
}

@end

#pragma mark - /user/signup

@implementation USER_SIGNUP_REQUEST

@end

@implementation USER_SIGNUP_RESPONSE
@end

@implementation USER_SIGNUP_API

- (instancetype)init
{
	self = [super init];
	
	if ( self )
	{
		self.req = [USER_SIGNUP_REQUEST requsetWithEndpoint:@"user/signup"];
	}

	return self;
}

- (void)send
{
	[[STClient sharedClient].requestSerializer setValue:@"signup" forHTTPHeaderField:[self.req.parameters stringWithDictionary]];

	[[STClient sharedClient] POST:self.req.endpoint
					   parameters:@{@"json":[self.req.parameters stringWithDictionary]}
						  success:^(AFHTTPRequestOperation *operation, id responseObject) {
							  self.resp = [USER_SIGNUP_RESPONSE objectWithDictionary:responseObject];
							  NSError * error = [[NSError alloc] initWithDomain:self.resp.error_desc code:self.resp.error_code userInfo:nil];
							  self.whenUpdate(self.resp, error);
						  }
						  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
							  self.whenUpdate(self.resp, error);
						  }
	 ];
}

@end

#pragma mark - /user/verifycode

@implementation USER_VERIFYCODE_REQUEST

@end

@implementation USER_VERIFYCODE_RESPONSE
@end

@implementation USER_VERIFYCODE_API

- (instancetype)init
{
	self = [super init];
	
	if ( self )
	{
		self.req = [USER_VERIFYCODE_REQUEST requsetWithEndpoint:@"user/verifycode"];
	}

	return self;
}

- (void)send
{
	[[STClient sharedClient].requestSerializer setValue:@"verifycode" forHTTPHeaderField:[self.req.parameters stringWithDictionary]];

	[[STClient sharedClient] POST:self.req.endpoint
					   parameters:@{@"json":[self.req.parameters stringWithDictionary]}
						  success:^(AFHTTPRequestOperation *operation, id responseObject) {
							  self.resp = [USER_VERIFYCODE_RESPONSE objectWithDictionary:responseObject];
							  NSError * error = [[NSError alloc] initWithDomain:self.resp.error_desc code:self.resp.error_code userInfo:nil];
							  self.whenUpdate(self.resp,error);
						  }
						  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
							  self.whenUpdate(self.resp,error);
						  }
	 ];
}

@end

#pragma mark - /user/validphone

@implementation USER_VALIDPHONE_REQUEST

@end

@implementation USER_VALIDPHONE_RESPONSE
//CONVERT_PROPERTY_CLASS( , <#__class#>)
@end

@implementation USER_VALIDPHONE_API

- (instancetype)init
{
	self = [super init];

	if ( self )
	{
		self.req = [USER_VALIDPHONE_REQUEST requsetWithEndpoint:@"user/validphone"];
	}

	return self;
}

- (void)send
{
	[[STClient sharedClient].requestSerializer setValue:@"validphone" forHTTPHeaderField:[self.req.parameters stringWithDictionary]];

	[[STClient sharedClient] POST:self.req.endpoint
					   parameters:@{@"json":[self.req.parameters stringWithDictionary]}
						  success:^(AFHTTPRequestOperation *operation, id responseObject) {
							  self.resp = [USER_VALIDPHONE_RESPONSE objectWithDictionary:responseObject];
							 
						  }
						  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
							  NSLog(@"%@",error);
						  }
	 ];
}

@end
/////////////////////////
// 订单相关
/////////////////////////

#pragma mark - /order/list"
@implementation ORDER_LIST_REQUEST

@end

@implementation ORDER_LIST_RESPONSE
//CONVERT_PROPERTY_CLASS( , <#__class#>)
@end

@implementation ORDER_LIST_API

- (instancetype)init
{
	self = [super init];
	
	if ( self )
	{
		self.req = [ORDER_LIST_REQUEST requsetWithEndpoint:@"order/list"];
	}
	
	return self;
}

- (void)send
{
	[[STClient sharedClient].requestSerializer setValue:@"orderlist" forHTTPHeaderField:[self.req.parameters stringWithDictionary]];

	[[STClient sharedClient] POST:self.req.endpoint
					   parameters:@{@"json":[self.req.parameters stringWithDictionary]}
						  success:^(AFHTTPRequestOperation *operation, id responseObject) {
							  self.resp = [ORDER_LIST_RESPONSE objectWithDictionary:responseObject];
							  NSLog(@"%@",responseObject);
						  }
						  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
							  NSLog(@"%@",error);
						  }
	 ];
}

@end

#pragma mark - /user/resetpassword

@implementation USER_RESETPASSWORD_REQUEST

@end

@implementation USER_RESETPASSWORD_RESPONSE
//CONVERT_PROPERTY_CLASS( , <#__class#>)
@end

@implementation USER_RESETPASSWORD_API

- (instancetype)init
{
	self = [super init];
	
	if ( self )
	{
		self.req = [USER_RESETPASSWORD_REQUEST requsetWithEndpoint:@"user/resetpassword"];
	}
	
	return self;
}

- (void)send
{
	[[STClient sharedClient].requestSerializer setValue:@"resetpassword" forHTTPHeaderField:[self.req.parameters stringWithDictionary]];
	
	[[STClient sharedClient] POST:self.req.endpoint
					   parameters:@{@"json":[self.req.parameters stringWithDictionary]}
						  success:^(AFHTTPRequestOperation *operation, id responseObject) {
							  self.resp = [USER_RESETPASSWORD_RESPONSE objectWithDictionary:responseObject];
							  NSLog(@"%@",responseObject);
						  }
						  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
							  NSLog(@"%@",error);
						  }
	 ];
}
@end

#pragma mark - /user/changepassword

@implementation USER_CHANGEPASSWORD_REQUEST

@end

@implementation USER_CHANGEPASSWORD_RESPONSE
//CONVERT_PROPERTY_CLASS( , <#__class#>)
@end

@implementation USER_CHANGEPASSWORD_API

- (instancetype)init
{
	self = [super init];
	
	if ( self )
	{
		self.req = [USER_CHANGEPASSWORD_REQUEST requsetWithEndpoint:@"user/changepassword"];
	}
	
	return self;
}

- (void)send
{
	[[STClient sharedClient].requestSerializer setValue:@"changepassword" forHTTPHeaderField:[self.req.parameters stringWithDictionary]];

	[[STClient sharedClient] POST:self.req.endpoint
					   parameters:@{@"json":[self.req.parameters stringWithDictionary]}
						  success:^(AFHTTPRequestOperation *operation, id responseObject) {
							  self.resp = [USER_CHANGEPASSWORD_RESPONSE objectWithDictionary:responseObject];
							  NSLog(@"%@",responseObject);
						  }
						  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
							  NSLog(@"%@",error);
						  }
	 ];
}
@end

#pragma mark - /user/signout

@implementation USER_SIGNOUT_REQUEST

@end

@implementation USER_SIGNOUT_RESPONSE
//CONVERT_PROPERTY_CLASS( , <#__class#>)
@end

@implementation USER_SIGNOUT_API

- (instancetype)init
{
	self = [super init];
	
	if ( self )
	{
		self.req = [USER_SIGNOUT_REQUEST requsetWithEndpoint:@"user/signout"];
	}
	
	return self;
}

- (void)send
{
	[[STClient sharedClient].requestSerializer setValue:@"signout" forHTTPHeaderField:[self.req.parameters stringWithDictionary]];
	
	[[STClient sharedClient] POST:self.req.endpoint
					   parameters:@{@"json":[self.req.parameters stringWithDictionary]}
						  success:^(AFHTTPRequestOperation *operation, id responseObject) {
							  self.resp = [USER_SIGNOUT_RESPONSE objectWithDictionary:responseObject];
						  }
						  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
						  }
	 ];
}


@end
