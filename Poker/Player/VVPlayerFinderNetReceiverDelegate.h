//
//  VVPlayerFinderNetReceiverDelegate.h
//  Poker
//
//  Created by onevcat on 11-12-2.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VVPlayerFinderNetReceiverDelegate <NSObject>

//-(void) requestAPlayerWithPlayerID:(NSString *)aPlayerID delegate:(id<VVPlayerFinderNetReceiverDelegate>)delegate;的返回
-(void) requestAPlayerWithPlayerIDDidFinishedWithInfo:(NSDictionary *)info;

//-(void) requestAPlayerAchievWithPlayerID:(NSString *)aPlayerID delegate:(id<VVPlayerFinderNetReceiverDelegate>)delegate;的返回
-(void) requestAPlayerAchievWithPlayerIDDidFinishedWithInfo:(NSDictionary *)info;

//-(void) requestAPlayerStatWithPlayerID:(NSString *)aPlayerID delegate:(id<VVPlayerFinderNetReceiverDelegate>)delegate;的返回
-(void) requestAPlayerStatWithPlayerIDDidFinishedWithInfo:(NSDictionary *)info;

@end
