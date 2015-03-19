//
//  mplus.h
//  mplus
//
//  Created by Chenyun on 14-10-13.
//  Copyright (c) 2014年 geek-zoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STIHTTPNetwork.h"
#import "AFHTTPRequestOperationManager.h"
#import "AutoCoding.h"
#import "mplus_old.h"


@interface USER : NSObject

@end

@interface PAGING : NSObject

@end

#pragma mark - API

@interface STClient : AFHTTPRequestOperationManager
+ (instancetype)sharedClient;
@end

#pragma mark - /user/signin

@interface USER_SIGNIN_REQUEST : STIHTTPRequest
@property (nonatomic, assign)  int ver;
@property (nonatomic, copy)	  NSString * UUID;
@property (nonatomic, copy)   NSString * platform;
@property (nonatomic, copy)	  NSString * mobile_phone;
@property (nonatomic, copy)   NSString * password;
@end

@interface USER_SIGNIN_RESPONSE : STIHTTPResponse
@property (nonatomic, copy)   NSString * sid;
@property (nonatomic, strong) USER * user;
@end

@interface USER_SIGNIN_API : STIHTTPApi
@property (nonatomic, strong) USER_SIGNIN_REQUEST * req;
@property (nonatomic, strong) USER_SIGNIN_RESPONSE * resp;
@end

#pragma mark - /user/signup

@interface USER_SIGNUP_REQUEST : STIHTTPRequest
@property (nonatomic, copy) NSString * ver;
@property (nonatomic, copy) NSString * mobile_phone;
@property (nonatomic, copy) NSString * UUID;
@property (nonatomic, copy) NSString * password;
@property (nonatomic, copy) NSString * nickname;
@property (nonatomic, copy) NSString * platform;
@property (nonatomic, strong) NSNumber * gender;
@property (nonatomic, copy) NSString * body_height;
@property (nonatomic, copy) NSString * birthday;
@end

@interface USER_SIGNUP_RESPONSE : STIHTTPResponse
@property (nonatomic, copy)   NSString * uid;
@property (nonatomic, copy)   NSString * sid;
@property (nonatomic, strong)   USER * user;
@end

@interface USER_SIGNUP_API : STIHTTPApi
@property (nonatomic, strong) USER_SIGNUP_REQUEST * req;
@property (nonatomic, strong) USER_SIGNUP_RESPONSE * resp;
@end

#pragma mark - /user/verifycode

@interface USER_VERIFYCODE_REQUEST : STIHTTPRequest
@property (nonatomic, assign) int  ver;
@property (nonatomic, copy) NSString * mobile_phone;
@end

@interface USER_VERIFYCODE_RESPONSE : STIHTTPResponse
@end

@interface USER_VERIFYCODE_API : STIHTTPApi
@property (nonatomic, strong) USER_VERIFYCODE_REQUEST * req;
@property (nonatomic, strong) USER_VERIFYCODE_RESPONSE * resp;
@end

#pragma mark - /user/validphone

@interface USER_VALIDPHONE_REQUEST : STIHTTPRequest
@property (nonatomic, copy) NSString * ver;
@property (nonatomic, copy) NSString * mobile_phone;
@end

@interface USER_VALIDPHONE_RESPONSE : STIHTTPResponse
@end

@interface USER_VALIDPHONE_API : STIHTTPApi
@property (nonatomic, strong) USER_VALIDPHONE_REQUEST * req;
@property (nonatomic, strong) USER_VALIDPHONE_RESPONSE * resp;
@end

#pragma mark - /user/signout

@interface USER_SIGNOUT_REQUEST : STIHTTPRequest
@property (nonatomic, copy) NSString * uid;
@property (nonatomic, copy) NSString * sid;
@property (nonatomic, copy) NSString * ver;
@end

@interface USER_SIGNOUT_RESPONSE : STIHTTPResponse
@end

@interface USER_SIGNOUT_API : STIHTTPApi
@property (nonatomic, strong) USER_SIGNOUT_REQUEST * req;
@property (nonatomic, strong) USER_SIGNOUT_RESPONSE * resp;
@end

#pragma mark - /order/list

@interface ORDER_LIST_REQUEST : STIHTTPRequest
@property (nonatomic, copy) NSString * uid;
@property (nonatomic, copy) NSString * sid;
@property (nonatomic, assign) int ver;
@property (nonatomic, strong) PAGING * paging;
@end

@interface ORDER_LIST_RESPONSE : STIHTTPResponse
@end

@interface ORDER_LIST_API : STIHTTPApi
@property (nonatomic, strong) ORDER_LIST_REQUEST * req;
@property (nonatomic, strong) ORDER_LIST_RESPONSE * resp;
@end


#pragma mark -  /user/resetpassword

@interface USER_RESETPASSWORD_REQUEST : STIHTTPRequest
@property (nonatomic, copy) NSString * mobile_phone;
@property (nonatomic, copy) NSString * verify_code;
@property (nonatomic, assign) int ver;
@end

@interface USER_RESETPASSWORD_RESPONSE : STIHTTPResponse
@end

@interface USER_RESETPASSWORD_API : STIHTTPApi
@property (nonatomic, strong) USER_RESETPASSWORD_REQUEST * req;
@property (nonatomic, strong) USER_RESETPASSWORD_RESPONSE * resp;
@end

#pragma mark -  /user/changepassword

@interface USER_CHANGEPASSWORD_REQUEST : STIHTTPRequest
@property (nonatomic, copy) NSString * uid;
@property (nonatomic, copy) NSString * sid;
@property (nonatomic, assign) int ver;
@property (nonatomic, copy) NSString * old_password;
@end

@interface USER_CHANGEPASSWORD_RESPONSE : STIHTTPResponse
@end

@interface USER_CHANGEPASSWORD_API : STIHTTPApi
@property (nonatomic, strong) USER_CHANGEPASSWORD_REQUEST * req;
@property (nonatomic, strong) USER_CHANGEPASSWORD_RESPONSE * resp;
@end
