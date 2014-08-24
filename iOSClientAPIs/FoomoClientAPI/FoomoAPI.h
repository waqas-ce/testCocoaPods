//
//  FoomoAPI.h
//  FoomoClientAPI
//
//  Created by Muhammad Ali on 04/08/2014.
//  Copyright (c) 2014 Wiva Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Request.h"
#import "Handler/FoomoResponseHandler.h"

@protocol FoomoAPI <NSObject>

@required
-(void) registerUserWithRequest:(Request*)request andHandler:(id<FoomoResponseHandler>)handler;

-(void) loginUserWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler;

-(void) syncServerTimeWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler;

-(void) updateNumberWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler;


-(void) updateProfileWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler;

-(void) verifyPinWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler;

-(void) updateLocationWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler;

-(void) requestApiKeyWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler;

-(void) syncAddressBookWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler;

-(void) fileShareWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler;

-(void) updateContactNumbersWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler;

-(void) getProfileWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler;

-(void) blockUsersWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler;

-(void) inviteUsersWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler;

-(void) logEventWithRequest:(Request*) request andHandler:(id<FoomoResponseHandler>) handler;
@end
