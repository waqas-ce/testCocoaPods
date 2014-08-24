#import "InviteResponse.h"
@implementation InviteResponse
@synthesize nonFoomoUsers;
@synthesize nonFoomoNumbers;
- (NSDictionary*)jsonMapping {
    return @{
             @"non_foomo_usernames":@"nonFoomoUsers",
             @"non_foomo_numbers":@"nonFoomoNumbers"
             };
}
- (NSDictionary*)jsonClasses {
    return @{
             @"nonFoomoNumbers":[NSString class],
             @"nonFoomoUsers":[NSString class]
             };
}
@end
