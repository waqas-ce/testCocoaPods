//
//  SecureKeyManager.cpp
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 05/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
//

#include "SecureKeyManager.h"
#include <CommonCrypto/CommonDigest.h>
#import "FoomoUtils.h"

/*
 +----------------------------------------------------------------------------------------------------+
 | UPPER(sha1(UPPER(md5("This is key for Foomo REST Services Encryption and Device Communication")))) |
 +----------------------------------------------------------------------------------------------------+
 | 8CB7093B1D71AF498137D1E6C131982BD1534963                                                           |
 +----------------------------------------------------------------------------------------------------+
 
 */

static const char* K_KEY = "8CB7093B1D71AF498137D1E6C131982BD1534963";
//NSString* MD5(const char* cStr);
NSString* SHA(const char* x);
const char* getEncryptionKeyInternal(const char *str1, const char *str2);

//static SecureKeyManager* instance = nullptr;
@implementation SecureKeyManager



//
//+(SecureKeyManager*) SecureKeyManager::getInstance(){
//    if (nullptr==instance) {
//        instance = new SecureKeyManager();
//    }
//    return instance;
//}


+(const char*) getEncryptionKey1:(const char*) str1 andKey2:(const char*) str2{
    //str2 =
    NSString* key1=[FoomoUtils md5:str1];
    NSString* key2 =[FoomoUtils md5:str2];
    NSLog(@"Key 1 %@ Key 2 %@",key1,key2);
    return getEncryptionKeyInternal([key1 UTF8String], [key2 UTF8String]);
}

@end

const char* getEncryptionKeyInternal(const char *str1, const char *str2){
    
    NSLog(@"%@",
          SHA(
              "This is key for Foomo REST Services Encryption and Device Communication"));
    //<< endl;
    
	const char *nKeyStr1 = str1;
	const char* nKeyStr2 = str2;
	NSString* key1 = SHA(nKeyStr1);
	NSString* key2 = SHA(nKeyStr2);
    NSLog(@"SHA1 of Key 1 %@ SHA1 of Key 2 %@",key1,key2);
	NSUInteger s1 = [key1 length] ;
	NSMutableString* outStr = [[NSMutableString alloc] init];
    const char* newKey1 = [key1 UTF8String];
    const char* newKey2 = [key2 UTF8String];
	for (int idx = 0; idx < s1; idx++) {
        [outStr appendFormat:@"%c",newKey1[idx]];
        [outStr appendFormat:@"%c",newKey2[idx]];
        [outStr appendFormat:@"%c",K_KEY[idx]];
	}
    NSLog(@"Out String %@ ",outStr);
	return [SHA([outStr UTF8String]) UTF8String];
    
    //return NULL;
}



NSString* SHA(const char* x) {
//	NSMutableString* hex = [[NSMutableString alloc] initWithCapacity:CC_SHA1_DIGEST_LENGTH*2];//[CC_SHA1_DIGEST_LENGTH*2];
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    for (int idx=0; idx<CC_SHA1_DIGEST_LENGTH; idx++) {
        result[idx]=0;
    }
    
    CC_SHA1(x,  strlen(x), result);
    return [[NSString stringWithFormat:
             @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15],
             result[16], result[17], result[18], result[19]
             ] uppercaseString];
}
