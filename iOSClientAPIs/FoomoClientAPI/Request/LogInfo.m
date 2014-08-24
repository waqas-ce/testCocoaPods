#import "LogInfo.h"
@implementation LogInfo
@synthesize level;
@synthesize mesasge;
- (NSDictionary*)jsonMapping {
    return @{
             @"api_key":@"apiKey",
             @"session_key":@"sessionKey"
             };
}
@end
