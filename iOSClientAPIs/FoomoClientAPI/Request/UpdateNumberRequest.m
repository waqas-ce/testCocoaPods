#import "UpdateNumberRequest.h"
@implementation UpdateNumberRequest
@synthesize number;
- (NSDictionary*)jsonMapping {
    return @{
             @"api_key":@"apiKey",
             @"session_key":@"sessionKey"
             };
}
@end
