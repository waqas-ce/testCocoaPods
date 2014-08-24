#import "UserRequest.h"
@implementation UserRequest
@synthesize sessionKey;
@synthesize apiKey;
- (NSDictionary*)jsonMapping {
    return @{
             @"api_key":@"apiKey",
             @"session_key":@"sessionKey"
             };
}
@end
