////  Request.h
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 04/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
#import <Foundation/Foundation.h>



@interface DeviceInfo : NSObject{
}
@property NSString* deviceId;
@property NSString* appAdId;
@property NSString* deviceMake;
@property NSString* deviceModel;
@property NSString* osVersion;
@property NSString* appVersion;
@property NSString* operator;
@property NSString* countryCode;
@property NSString* deviceHardwareId;
@property NSString* deviceMacAddress;
@property NSString* phoneType;

@end
