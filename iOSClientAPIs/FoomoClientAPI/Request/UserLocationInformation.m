#import "UserLocationInformation.h"
@implementation UserLocationInformation
@synthesize location;
@synthesize longitude;
@synthesize latitude;
- (NSDictionary*)jsonMapping {
    return @{
             @"api_key":@"apiKey",
             @"session_key":@"sessionKey"
             };
}
@end
