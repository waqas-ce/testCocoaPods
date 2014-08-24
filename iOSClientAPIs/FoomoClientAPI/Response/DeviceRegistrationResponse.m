#import "DeviceRegistrationResponse.h"
@implementation DeviceRegistrationResponse
@synthesize apiKey;
@synthesize encryption;
@synthesize encryptionKey;
@synthesize sharedSecret;
@synthesize requestTimeout;
@synthesize syncFullAddressbook;
@synthesize tosUrl;
@synthesize domain;
@synthesize maxFileSize;
@synthesize logMask;
- (NSDictionary*)jsonMapping {
    return @{
             @"max_file_size":@"maxFileSize",
             @"sqlite_encryption":@"encryption",
             @"request_timeout":@"requestTimeout",
             @"log_mask":@"logMask",
             @"api_key":@"apiKey",
             @"sync_full_addressbook":@"syncFullAddressbook",
             @"tos_url":@"tosUrl",
             @"shared_secret":@"sharedSecret",
             @"sqlite_encryption_key":@"encryptionKey"
             };
}
@end
