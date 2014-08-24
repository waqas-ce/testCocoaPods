////  Request.h
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 04/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
#import <Foundation/Foundation.h>
#import "BaseResponse.h"



@interface FileUploadResponse : BaseResponse{
}
@property NSString* url;
@property NSString* expiryTime;
@property NSString* thumb;

@end
