//
//  STIHTTPNetwork.m
//  AFNetworking iOS Example
//
//  Created by QFish on 10/7/14.
//  Copyright (c) 2014 Gowalla. All rights reserved.
//

#import "STIHTTPNetwork.h"
#import "AutoCoding.h"

@implementation STIHTTPBaseObject

- (BOOL)isValidated
{
    return YES;
}

@end

#pragma mark -

@implementation STIHTTPApi

- (void)send
{
    
}

@end

#pragma mark -

@interface STIHTTPRequest()
{
    NSString * _endPoint;
}
@end

#pragma mark -

@implementation STIHTTPRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSAssert(NO, @"You should use [STIHTTPRequest initWithEndpoint:] instead.");
    }
    return self;
}

- (instancetype)initWithEndpoint:(NSString *)endpoint
{
    self = [super init];
    if (self) {
        _endPoint = endpoint;
    }
    return self;
}

+ (instancetype)requsetWithEndpoint:(NSString *)endpoint
{
    return [[self alloc] initWithEndpoint:endpoint];
}

- (NSDictionary *)parameters
{
    return [self dictionaryRepresentation];
}

- (NSString *)endpoint
{
    NSAssert(_endPoint && _endPoint.length, @"Are you kiding ?! The URI endpoint for requset should not be empty");
    
    NSArray * partials = [_endPoint componentsSeparatedByString:@"/"];
    
    NSArray * targets = [partials filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF beginswith[c] ':'"]];
    
    __block NSMutableString * path = [_endPoint mutableCopy];
    
    [targets enumerateObjectsUsingBlock:^(NSString * str, __unused NSUInteger idx, __unused BOOL *stop) {
        
        NSString * param = [self valueForKeyPath:[str stringByReplacingOccurrencesOfString:@":" withString:@""]];
        
        [path replaceOccurrencesOfString:str
                              withString:[param description]
                                 options:NSCaseInsensitiveSearch
                                   range:NSMakeRange(0, path.length)];
    }];
    
    return path;
}

@end

#pragma mark -

@implementation STIHTTPResponse
@end
