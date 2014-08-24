#import "RequestWithJidList.h"
@implementation RequestWithJidList
@synthesize jids;
- (NSDictionary*)jsonMapping {
    return @{
             @"jid_list":@"jids",
             @"api_key":@"apiKey",
             @"session_key":@"sessionKey"
             };
}
- (NSDictionary*)jsonClasses {
    return @{
             @"jids":[NSString class]
             };
}
@end
