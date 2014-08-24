#import "ProfileInfo.h"
@implementation ProfileInfo
@synthesize firstName;
@synthesize lastName;
@synthesize dateOfBirth;
@synthesize gender;
@synthesize userThumbImage;
- (NSDictionary*)jsonMapping {
    return @{
             @"gender":@"gender",
             @"date_of_birth":@"dateOfBirth",
             @"user_thumb_image":@"userThumbImage",
             @"last_name":@"lastName",
             @"first_name":@"firstName"
             };
}
@end
