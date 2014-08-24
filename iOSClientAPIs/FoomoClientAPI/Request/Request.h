//
//  Request.h
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 04/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserRequest.h"
#import "DeviceInfo.h"
@interface Request : NSObject
{
    
}
@property NSString* apiKey;
@property NSString* deviceId;
@property NSString* serverTimestamp;
@property NSString* apiSharedSecret;
@property NSString* sharedSecret;
@property UserRequest* userInfo;
@property DeviceInfo* deviceInfo;

@end
