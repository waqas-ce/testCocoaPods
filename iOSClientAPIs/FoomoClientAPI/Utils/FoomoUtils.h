//
//  FoomoUtils.h
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 05/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoomoUtils : NSObject

+(NSString*) base64Decode:(NSString*) encodedString;
+(NSString*) toQueryString:(NSDictionary*) dict;
+(NSString*) hashPrefixWithPath:(NSString*) requestUri andMap:(NSDictionary*) request;
+(NSString*) md5:(NSString*) key andData:(NSData*) data;
+(NSString*) md5:(const char*) key;
@end
