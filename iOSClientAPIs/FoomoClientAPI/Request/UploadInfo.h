//
//  UploadInfo.h
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 06/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
//

#import "UserRequest.h"

@interface UploadInfo : UserRequest{
    
}
@property NSString* to;
@property NSURL* fileUrl;
@property NSString* filename;
@property NSString* mimeType;
//@property NSData* file;
//@property NSString* name;
@end
