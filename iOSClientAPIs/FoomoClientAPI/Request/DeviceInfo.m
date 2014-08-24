#import "DeviceInfo.h"
@implementation DeviceInfo
@synthesize deviceId;
@synthesize appAdId;
@synthesize deviceMake;
@synthesize deviceModel;
@synthesize osVersion;
@synthesize appVersion;
@synthesize operator;
@synthesize countryCode;
@synthesize deviceHardwareId;
@synthesize deviceMacAddress;
@synthesize phoneType;
- (NSDictionary*)jsonMapping {
    return @{
             @"device_make":@"deviceMake",
             @"country_code":@"countryCode",
             @"device_hardware_id":@"deviceHardwareId",
             @"phone_type":@"phoneType",
             @"device_id":@"deviceId",
             @"app_ad_id":@"appAdId",
             @"device_model":@"deviceModel",
             @"app_version":@"appVersion",
             @"os_version":@"osVersion",
             @"device_mac_address":@"deviceMacAddress"
             };
}
@end
