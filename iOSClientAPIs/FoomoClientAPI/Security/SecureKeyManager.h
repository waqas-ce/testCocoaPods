//
//  SecureKeyManager.h
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 05/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
//

#ifndef __FoomoClientAPI__SecureKeyManager__
#define __FoomoClientAPI__SecureKeyManager__
#import <Foundation/Foundation.h>

@interface SecureKeyManager : NSObject

//+ (SecureKeyManager*) getInstance;
+(const char*) getEncryptionKey1:(const char*) str1 andKey2:(const char*) str2;

@end

#endif /* defined(__FoomoClientAPI__SecureKeyManager__) */
