#import "TimeSyncResponse.h"
@implementation TimeSyncResponse
@synthesize timeStamp;
- (NSDictionary*)jsonMapping {
    return @{
             @"time_stamp":@"timeStamp"
             };
}
@end
