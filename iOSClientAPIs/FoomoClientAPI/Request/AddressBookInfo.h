////  Request.h
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 04/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
#import <Foundation/Foundation.h>
#import "UserRequest.h"
#import "ContactInfo.h"



@interface AddressBookInfo : UserRequest{
}
@property NSArray* contacts;
@property NSInteger start;
@property NSInteger count;
@property NSInteger total;

@end
