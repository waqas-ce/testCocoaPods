#import "ContactSyncRequest.h"
@implementation ContactSyncRequest
@synthesize contactNumbers;
@synthesize contactNumbersUnnormalized;
- (NSDictionary*)jsonMapping {
    return @{
             @"api_key":@"apiKey",
             @"session_key":@"sessionKey",
             @"contact_numbers_unnormalized":@"contactNumbersUnnormalized",
             @"contact_numbers_normalized":@"contactNumbers"
             };
}
- (NSDictionary*)jsonClasses {
    return @{
             @"contactNumbers":[NSString class],
             @"contactNumbersUnnormalized":[NSString class]
             };
}
@end
