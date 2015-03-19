//
//  STIHTTPNetwork.h
//  AFNetworking iOS Example
//
//  Created by QFish on 10/7/14.
//  Copyright (c) 2014 Gowalla. All rights reserved.
//

#import <Foundation/Foundation.h>

//@protocol STIHTTPApiHandler <NSObject>
//@end

typedef void (^STIHTTPApiBlock)(id data, NSError * error);

#pragma mark -

@interface STIHTTPBaseObject : NSObject
@property (nonatomic, assign, readonly) BOOL isValidated;
@end

#pragma mark -

@interface STIHTTPRequest : STIHTTPBaseObject



/**
 *  Transform properies to a dcitionary that can be parameter for a request.
 *
 *  @return a dictionary composed of properties
 */
@property (nonatomic, strong, readonly) NSDictionary * parameters;

/**
 *  Transform origin endpoint to parametered uri with known properies.
 *
 *  For example:
 *
 *  Endpoint: /users/:username/repos
 *  Result: /users/qfish/repos
 *
 *  @return the parametered uri
 */
@property (nonatomic, strong, readonly) NSString * endpoint;

- (instancetype)initWithEndpoint:(NSString *)endpoint;
+ (instancetype)requsetWithEndpoint:(NSString *)endpoint;

@end

#pragma mark -

@interface STIHTTPResponse : STIHTTPBaseObject
@property (nonatomic, assign) int error_code;
@property (nonatomic, assign) int succeed;
@property (nonatomic, copy) NSString * error_desc;
@end

#pragma mark -

@interface STIHTTPApi : STIHTTPBaseObject

@property (nonatomic, copy) STIHTTPApiBlock whenUpdate;
@property (nonatomic, strong) STIHTTPRequest *  req;
@property (nonatomic, strong) id resp;

- (void)send;

@end
