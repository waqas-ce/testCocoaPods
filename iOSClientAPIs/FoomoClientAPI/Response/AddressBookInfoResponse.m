#import "AddressBookInfoResponse.h"
@implementation AddressBookInfoResponse
@synthesize foomo_users;
- (NSDictionary*)jsonClasses {
    return @{
             @"foomo_users":[FoomoContact class]
             };
}
@end
