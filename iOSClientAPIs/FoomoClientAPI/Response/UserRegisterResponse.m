#import "UserRegisterResponse.h"
@implementation UserRegisterResponse
@synthesize sessionKey;
@synthesize sharedSecret;
@synthesize userJid;
@synthesize totalContacts;
@synthesize synchronizedContacts;
- (NSDictionary*)jsonMapping {
    return @{
             @"synchronized_contacts":@"synchronizedContacts",
             @"user_jid":@"userJid",
             @"time_stamp":@"timeStamp",
             @"session_key":@"sessionKey",
             @"user_shared_secret":@"sharedSecret",
             @"total_contacts":@"totalContacts"
             };
}
@end
