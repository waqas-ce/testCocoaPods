#import "UserProfileRequest.h"
@implementation UserProfileRequest
@synthesize firstName;
@synthesize lastName;
@synthesize dateOfBirth;
@synthesize email;
@synthesize gender;
@synthesize userThumbImage;
- (NSDictionary*)jsonMapping {
    return @{
             @"api_key":@"apiKey",
             @"date_of_birth":@"dateOfBirth",
             @"user_thumb_image":@"userThumbImage",
             @"session_key":@"sessionKey",
             @"last_name":@"lastName",
             @"first_name":@"firstName"
             };
}
@end
