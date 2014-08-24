#import "UserInfoRequest.h"
@implementation UserInfoRequest
@synthesize userName;
@synthesize password;
@synthesize location;
@synthesize longitude;
@synthesize latitude;
@synthesize email;
- (NSDictionary*)jsonMapping {
    return @{
             @"api_key":@"apiKey",
             @"user_name":@"userName",
             @"session_key":@"sessionKey"
             };
}
@end
