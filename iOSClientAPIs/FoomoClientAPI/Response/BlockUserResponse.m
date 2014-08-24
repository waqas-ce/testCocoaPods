#import "BlockUserResponse.h"
@implementation BlockUserResponse
@synthesize blockedJidList;
- (NSDictionary*)jsonMapping {
    return @{
             @"blocked_jid_list":@"blockedJidList"
             };
}
- (NSDictionary*)jsonClasses {
    return @{
             @"blockedJidList":[NSString class]
             };
}
@end
