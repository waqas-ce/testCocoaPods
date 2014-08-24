#import "InviteUser.h"
@implementation InviteUser
@synthesize numbers;
@synthesize usernames;
- (NSDictionary*)jsonMapping {
    return @{
             @"api_key":@"apiKey",
             @"session_key":@"sessionKey"
             };
}
- (NSDictionary*)jsonClasses {
    return @{
             @"numbers":[NSString class],
             @"usernames":[NSString class]
             };
}
@end
