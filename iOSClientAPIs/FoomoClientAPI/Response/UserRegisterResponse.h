////  Request.h
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 04/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
#import <Foundation/Foundation.h>
#import "TimeSyncResponse.h"



@interface UserRegisterResponse : TimeSyncResponse{
}
@property NSString* sessionKey;
@property NSString* sharedSecret;
@property NSString* userJid;
@property NSInteger totalContacts;
@property NSInteger synchronizedContacts;

@end
