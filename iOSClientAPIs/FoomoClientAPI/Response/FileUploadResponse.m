#import "FileUploadResponse.h"
@implementation FileUploadResponse
@synthesize url;
@synthesize expiryTime;
@synthesize thumb;
- (NSDictionary*)jsonMapping {
    return @{
             @"expiry_time":@"expiryTime"
             };
}
@end
