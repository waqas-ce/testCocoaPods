//
//  FoomoAPIImpl.m
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 04/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
//

#import "FoomoAPIImpl.h"
//#import "AFNetworking.h"
#import "GFClient.h"
#import "DeviceRegistrationResponse.h"
#import "NSObject+GFJson.h"
#import "UserRegisterResponse.h"
#import "FoomoUtils.h"
#include "Security/SecureKeyManager.h"
#include "UserPinResponse.h"
#include "AddressBookInfoResponse.h"
#include "UserProfileResponse.h"
#include "BlockUserResponse.h"
#include "InviteResponse.h"
#include "UploadInfo.h"
#include "FileUploadResponse.h"

@implementation FoomoAPIImpl
@synthesize contextPath,host;

-(id)initWithHost:(NSString*) hst andContextPath:(NSString*) ctx{
    
    self=[super init];
    self.contextPath = ctx;
    self.host=hst;
  //  NSMutableString* url = [[NSMutableString alloc] initWithString:host];
   // [url appendString:@"/"];
   // [url appendString:contextPath];
    NSURL *baseURL = [NSURL URLWithString:host]; // the base URL of your API
    AFHTTPRequestOperationManager* client = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    // initialize GoldenFleece
    
    client.securityPolicy =[[AFSecurityPolicy alloc] init]; //[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    //[sec setAllowInvalidCertificates:YES];
    client.securityPolicy.allowInvalidCertificates = YES;

    [GFClient createWithHttpClient:client];
    return self;
}

-(void) registerUserWithRequest:(Request*)request andHandler:(id<FoomoResponseHandler>)handler{
    [self postJsonRequest:request withPath:@"register" andExpectedClass:[UserRegisterResponse class] andHandler:handler];
}


-(void) loginUserWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler{
    [self postJsonRequest:request withPath:@"login" andExpectedClass:[UserRegisterResponse class] andHandler:handler];

}

-(void) syncServerTimeWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler{
    [self postSignedJsonRequest:request withPath:@"server_time" andExpectedClass:[TimeSyncResponse class] andHandler:handler];
}
-(void)updateNumberWithRequest:(Request *)request andHandler:(id<FoomoResponseHandler>)handler{
    [self postSignedJsonRequest:request withPath:@"update_number" andExpectedClass:[BaseResponse class] andHandler:handler];

}
-(void) updateProfileWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler{
    [self postSignedJsonRequest:request withPath:@"update_profile" andExpectedClass:[BaseResponse class] andHandler:handler];
}

-(void) verifyPinWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler{
    [self postSignedJsonRequest:request withPath:@"verify_pin" andExpectedClass:[UserPinResponse class] andHandler:handler];

}

-(void) updateLocationWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler{
    [self postSignedJsonRequest:request withPath:@"update_location" andExpectedClass:[BaseResponse class] andHandler:handler];

}

-(void) requestApiKeyWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler{
    [self postJsonRequest:request withPath:@"request_api_key" andExpectedClass:[DeviceRegistrationResponse class] andHandler:handler];
}

-(void) syncAddressBookWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler{
    [self postSignedJsonRequest:request withPath:@"sync_address_book" andExpectedClass:[AddressBookInfoResponse class] andHandler:handler];
}

-(void) fileShareWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler{
    //TODO :: need to implement
    [self postMultipart:request withPath:@"upload" andExpectedClass:[FileUploadResponse class] andHandler:handler];
}

-(void) updateContactNumbersWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler{
    [self postSignedJsonRequest:request withPath:@"update_contact_numbers" andExpectedClass:[AddressBookInfoResponse class] andHandler:handler];
}

-(void) getProfileWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler{
    [self postSignedJsonRequest:request withPath:@"get_profile" andExpectedClass:[UserProfileResponse class] andHandler:handler];

}

-(void) blockUsersWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler{
    [self postSignedJsonRequest:request withPath:@"block_contact" andExpectedClass:[BlockUserResponse class] andHandler:handler];

}

-(void) inviteUsersWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler{
    [self postSignedJsonRequest:request withPath:@"invite" andExpectedClass:[InviteResponse class] andHandler:handler];
}
-(void) logEventWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler{
    [self postSignedJsonRequest:request withPath:@"post_log" andExpectedClass:[BaseResponse class] andHandler:handler];

}
-(void) postSignedJsonRequest:(Request*) request withPath:(NSString*) path andExpectedClass:(Class) clazz andHandler:(id<FoomoResponseHandler>) handler{
    id obj = [request deviceInfo]==nil?[request userInfo]:[request deviceInfo];
    NSError *error;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:[obj jsonObject] options:0 error:&error];
    NSString* prefix = [FoomoUtils hashPrefixWithPath:[NSString stringWithFormat:@"%@%@", self.contextPath,path] andMap:@{@"timestamp": [request serverTimestamp]}];
    
    NSString* key1 = [NSString stringWithFormat:@"%@::%@",[request sharedSecret],[request apiSharedSecret]];
    NSLog(@"Key 1 :: %@",key1);
    long long time =  [[request serverTimestamp] longLongValue];
    NSLog(@"Time :: %lld",time);
    NSString* hex = [NSString stringWithFormat:@"%llx",time];
    NSLog(@"HEX %@",hex);

    const char* newKey= [SecureKeyManager getEncryptionKey1:[key1 UTF8String] andKey2:[hex UTF8String]];
    NSLog(@"New Key %s",newKey);
    //[jsonData ]
    NSString* jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString* expectedSignature = [FoomoUtils md5:[NSString stringWithUTF8String:newKey] andData:[[prefix stringByAppendingString:jsonString] dataUsingEncoding:NSUTF8StringEncoding] ];
    
    [[GFClient sharedInstance] jsonRequestWithObject:obj // <-- this will be converted to JSON and sent as the request entity body
                                                path:[NSString stringWithFormat:@"%@%@%@?signature=%@&timestamp=%@",self.host, self.contextPath,path,expectedSignature,[request serverTimestamp]]
                                              method:@"POST"
                                       expectedClass:clazz
                                             success:^(NSURLRequest *request, NSHTTPURLResponse *response, id object) {
                                                 BaseResponse *result = (BaseResponse*)object;
                                                 
                                                 Response* resp = [[Response alloc] init];
                                                 [resp setBody:result];
                                                 
                                                 [handler receivedResponse:resp];
                                             } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                                 NSLog(@"Error %@",error);
                                                 // [delegate postGistCommentError:error];
                                             }
     ];
}


-(void) postMultipart:(Request*) request withPath:(NSString*) path andExpectedClass:(Class) clazz andHandler:(id<FoomoResponseHandler>) handler{
    UploadInfo* obj = (UploadInfo*)[request userInfo];
    
    NSMutableDictionary* dict= [[NSMutableDictionary alloc] initWithDictionary:@{@"timestamp": [request serverTimestamp], @"session_key":[obj sessionKey], @"api_key":[obj apiKey]}];
    
    NSString* prefix = [FoomoUtils hashPrefixWithPath:[NSString stringWithFormat:@"%@%@", self.contextPath,path] andMap:dict];
    NSString* key1 = [NSString stringWithFormat:@"%@::%@",[request sharedSecret],[request apiSharedSecret]];
    NSLog(@"Key 1 :: %@",key1);
    long long time =  [[request serverTimestamp] longLongValue];
    NSLog(@"Time :: %lld",time);
    NSString* hex = [NSString stringWithFormat:@"%llx",time];
    NSLog(@"HEX %@",hex);
    
    const char* newKey= [SecureKeyManager getEncryptionKey1:[key1 UTF8String] andKey2:[hex UTF8String]];
  
    NSString* expectedSignature = [FoomoUtils md5:[NSString stringWithUTF8String:newKey] andData:[prefix dataUsingEncoding:NSUTF8StringEncoding]];
    [dict setValue:expectedSignature forKey:@"signature"];
    
    NSString* qs= [FoomoUtils toQueryString:dict];
    
    NSMutableURLRequest* multipartReq = [[[[GFClient sharedInstance] httpClient] requestSerializer] multipartFormRequestWithMethod:@"POST" URLString:[NSString stringWithFormat:@"%@%@%@", self.contextPath,path,qs]  parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFormData:[[obj to] dataUsingEncoding:NSUTF8StringEncoding] name:@"to"];
        [formData appendPartWithFormData:[[obj sessionKey] dataUsingEncoding:NSUTF8StringEncoding] name:@"session_key"];
        [formData appendPartWithFormData:[[obj apiKey] dataUsingEncoding:NSUTF8StringEncoding] name:@"api_key"];
        //  [formData appendPartWithFormData:[NSData dataWithContentsOfURL:[obj file]] name:@"file"];
        [formData appendPartWithFileData:[NSData dataWithContentsOfURL:[obj fileUrl]] name:@"file" fileName:[obj filename] mimeType:[obj mimeType]];
        
    } error:nil];
    
    //[[[GFClient sharedInstance] httpClient] multipartFormRequestWithMethod:@"POST" path:[NSString stringWithFormat:@"%@%@%@", self.contextPath,path,qs] parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//    }];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:multipartReq];
   
    [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
        NSLog(@"Bytes Written %lu Total Bytes Written %lld Total Bytes Expected To Write %lld ",(unsigned long)bytesWritten,totalBytesWritten,totalBytesExpectedToWrite);
    }];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString* jsonString= [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"Response %@",jsonString );
        id responseJSON = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        id object = [[clazz alloc] initWithJsonObject:responseJSON];
        Response* resp = [[Response alloc] init];
        [resp setBody:object];
        [handler receivedResponse:resp];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure :: %@",error);
    }];
    
    [operation start];
  }

-(void) postJsonRequest:(Request*) request withPath:(NSString*) path andExpectedClass:(Class) clazz andHandler:(id<FoomoResponseHandler>) handler{
    id obj = [request deviceInfo]==nil?[request userInfo]:[request deviceInfo];
    [[GFClient sharedInstance] jsonRequestWithObject:obj // <-- this will be converted to JSON and sent as the request entity body
                                                path:[NSString stringWithFormat:@"%@%@%@",self.host, self.contextPath,path]
                                              method:@"POST"
                                       expectedClass:clazz
                                             success:^(NSURLRequest *request, NSHTTPURLResponse *response, id object) {
                                                 BaseResponse *result = (BaseResponse*)object;
                                                 
                                                 Response* resp = [[Response alloc] init];
                                                 [resp setBody:result];
                                                 
                                                 [handler receivedResponse:resp];
                                             } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                                 NSLog(@"Error %@",error);
                                                 // [delegate postGistCommentError:error];
                                             }
     ];
}


@end
