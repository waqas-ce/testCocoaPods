////  Request.h
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 04/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
#import <Foundation/Foundation.h>
#import "UserRequest.h"



@interface UserLocationInformation : UserRequest{
}
@property NSString* location;
@property double longitude;
@property double latitude;

@end
