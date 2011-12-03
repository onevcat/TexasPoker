//
//  VVPlayerFinderNetRequestDelegate.h
//  Poker
//
//  Created by onevcat on 11-12-2.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVPlayerFinderNetReceiverDelegate.h"

@protocol VVPlayerFinderNetRequestorDelegate <NSObject>
//向服务器请求玩家的基本信息
-(void) requestAPlayerWithPlayerID:(NSString *)aPlayerID delegate:(id<VVPlayerFinderNetReceiverDelegate>)delegate;

//向服务器请求玩家的成就列表
-(void) requestAPlayerAchievWithPlayerID:(NSString *)aPlayerID delegate:(id<VVPlayerFinderNetReceiverDelegate>)delegate;

//向服务器请求玩家的状态列表（已玩场次，净胜负等）
-(void) requestAPlayerStatWithPlayerID:(NSString *)aPlayerID delegate:(id<VVPlayerFinderNetReceiverDelegate>)delegate;


@end
