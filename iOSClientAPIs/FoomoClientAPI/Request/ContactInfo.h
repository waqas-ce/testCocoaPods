////  Request.h
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 04/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
#import <Foundation/Foundation.h>
#import "ContactName.h"
#import "ContactNumber.h"
#import "ContactEmail.h"
#import "ContactIM.h"
#import "ContactOrganization.h"
#import "ContactSocialProfile.h"



@interface ContactInfo : NSObject{
}
@property ContactName* name;
@property ContactNumber* number;
@property ContactEmail* email;
@property ContactIM* im;
@property ContactOrganization* org;
@property ContactSocialProfile* socialProfile;
@property NSInteger id;
@property NSDate* birthday;

@end
