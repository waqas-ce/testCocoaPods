//
//  FoomoUtils.m
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 05/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
//

#import "FoomoUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation FoomoUtils

+(NSString*) toQueryString:(NSDictionary*) dict{
    NSMutableString* output = [[NSMutableString alloc] init];
    for (NSString* key in dict) {
        if ([output length]>0) {
            [output appendString:@"&"];
        }else{
            [output appendString:@"?"];
        }
        [output appendFormat:@"%@=%@",key,[dict valueForKey:key]];
    }
    return output;
}

+(NSString*) base64Decode:(NSString*) encodedString{
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:[encodedString stringByAppendingString:@"=="] options:0];
    NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    NSLog(@"decodedString %@", decodedString); // foo
    return decodedString;
}
+(NSString*) md5:(NSString*) key andData:(NSData*) data{
    NSString* outp =  [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]; //new String(data);
    NSString* raw = [[key stringByAppendingString:outp] stringByAppendingString:key];// + out + key;
    NSLog(@"RAW :: %@ ", raw);
    return [[self md5:[raw UTF8String]] uppercaseString];
   // return [self md5:[raw UTF8String]];
}

+(NSString*) md5:(const char*)cStr{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), result ); // This is the md5 call
    //     char hex[33];
    return [[NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ] uppercaseString];
    
}




+(NSString*) hashPrefixWithPath:(NSString*) requestUri andMap:(NSDictionary*) request{
    NSMutableString* string = [[NSMutableString alloc] init];
    NSMutableArray* array = [[NSMutableArray alloc] init];
    for (NSString* key in request ) {
        NSString* val = [request valueForKey:key];
        if([key caseInsensitiveCompare:@"signature"] != NSOrderedSame){
            [array addObject:[NSString stringWithFormat:@"%@:%@",key,val]];
        }
    }
    NSArray* resArray = [array sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    [string appendString:requestUri];
    for (NSString* elem in resArray) {
        [string appendString:elem];
    }
    
    return string;
}



@end
