#import "UserPinInfo.h"
@implementation UserPinInfo
@synthesize pin;
- (NSDictionary*)jsonMapping {
    return @{
             @"api_key":@"apiKey",
             @"session_key":@"sessionKey"
             };
}
@end
