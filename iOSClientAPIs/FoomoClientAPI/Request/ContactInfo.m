#import "ContactInfo.h"
@implementation ContactInfo
@synthesize name;
@synthesize number;
@synthesize email;
@synthesize im;
@synthesize org;
@synthesize socialProfile;
@synthesize id;
@synthesize birthday;
- (NSDictionary*)jsonMapping {
    return @{
             @"socialprofile":@"socialProfile"
             };
}
@end
