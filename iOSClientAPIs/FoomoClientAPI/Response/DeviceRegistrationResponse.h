////  Request.h
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 04/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
#import <Foundation/Foundation.h>
#import "BaseResponse.h"



@interface DeviceRegistrationResponse : BaseResponse{
}
@property NSString* apiKey;
@property BOOL encryption;
@property NSString* encryptionKey;
@property NSString* sharedSecret;
@property NSInteger requestTimeout;
@property BOOL syncFullAddressbook;
@property NSString* tosUrl;
@property NSString* domain;
@property NSInteger maxFileSize;
@property NSInteger logMask;

@end
