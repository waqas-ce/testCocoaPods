#import "AddressBookInfo.h"
@implementation AddressBookInfo
@synthesize contacts;
@synthesize start;
@synthesize count;
@synthesize total;
- (NSDictionary*)jsonMapping {
    return @{
             @"api_key":@"apiKey",
             @"session_key":@"sessionKey"
             };
}
- (NSDictionary*)jsonClasses {
    return @{
             @"contacts":[ContactInfo class]
             };
}
@end
