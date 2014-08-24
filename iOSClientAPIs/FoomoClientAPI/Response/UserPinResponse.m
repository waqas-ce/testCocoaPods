#import "UserPinResponse.h"
@implementation UserPinResponse
@synthesize userJid;
- (NSDictionary*)jsonMapping {
    return @{
             @"user_jid":@"userJid"
             };
}
@end
