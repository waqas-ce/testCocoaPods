//
//  FoomoClientAPITests.m
//  FoomoClientAPITests
//
//  Created by Muhammad Ali on 04/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FoomoAPI.h"

@interface FoomoClientAPITests : XCTestCase

@end

@implementation FoomoClientAPITests

- (void)setUp
{
    [super setUp];
    FoomoAPI* api = [[FoomoAPIImpl alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
