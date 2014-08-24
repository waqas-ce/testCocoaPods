//
//  FoomoAPIImpl.h
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 04/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FoomoAPI.h"

@interface FoomoAPIImpl : NSObject<FoomoAPI>{

}
-(id)initWithHost:(NSString*) host andContextPath:(NSString*) contextPath;

@property NSString* contextPath;
@property NSString* host;
@end
