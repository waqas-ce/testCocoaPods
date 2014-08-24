////  Request.h
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 04/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
#import <Foundation/Foundation.h>




@interface ProfileInfo : NSObject{
}
@property NSString* firstName;
@property NSString* lastName;
@property NSDate* dateOfBirth;
@property NSString* gender;
@property NSString* userThumbImage;

@end
