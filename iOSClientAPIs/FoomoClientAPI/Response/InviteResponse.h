////  Request.h
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 04/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
#import <Foundation/Foundation.h>
#import "BaseResponse.h"



@interface InviteResponse : BaseResponse{
}
@property NSSet* nonFoomoUsers;
@property NSSet* nonFoomoNumbers;

@end
