iOSClientAPIs
=============

REST APIs for iOS Client


Setup
-----

execute following on terminal

pod install

All the API's are implemented, Following is a simple code example

static id<FoomoAPI> foomoAPI = nil;


- (IBAction)updateNumber:(id)sender {
    
    
    UpdateNumberRequest* uInfo =  [[UpdateNumberRequest alloc] init];
    [uInfo setApiKey:apiKey];
    [uInfo setSessionKey:sessionKey];
    [uInfo setNumber:@"+932223345652"];
    Request* req = [[Request alloc] init];//(uInfo);
    [req setApiKey:apiKey];
    [req setApiSharedSecret:apiSharedSecret];
    [req setSharedSecret:userSharedSecret];
    long long interval= 1000L*[[NSDate date] timeIntervalSince1970];
    [req setServerTimestamp:[NSString stringWithFormat:@"%lld", interval+diff]];
    if (nil==foomoAPI) {
        foomoAPI = [[FoomoAPIImpl alloc] initWithHost:HOST andContextPath:CTX_PATH];
    }
    [req setUserInfo:uInfo];
    [foomoAPI updateNumberWithRequest:req andHandler:self];
        
}