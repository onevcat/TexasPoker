//
//  VVPlayerFinder.h
//  Poker
//
//  Created by onevcat on 11-12-2.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

//这个类用来完成玩家信息寻找的所有工作
//包括使用玩家ID向服务器查询玩家信息等

#import <Foundation/Foundation.h>
#import "VVPlayerFinderNetReceiverDelegate.h"
#import "VVPlayerFinderNetRequestorDelegate.h"

@class VVPlayer;
@class VVPlayerStat;

//调用该类中方法的实例应当遵守以下协议：
@protocol VVPlayerFinderDelegate <NSObject>

//-(void) requestAPlayerWithID:(NSString *)aPlayerID;返回
-(void) requestAPlayerWithIDDidFinishedWithPlayer:(VVPlayer *)aPlayer;


-(void) requestAPlayerAchievWithPlayerIDDidFinishedWithAchievArray:(NSArray *)achievArray;

-(void) requestAPlayerStatWithPlayerIDDidFinishedWithStat:(VVPlayerStat *)playerStat;

@end

@interface VVPlayerFinder : NSObject <VVPlayerFinderNetReceiverDelegate>
{
    id<VVPlayerFinderNetRequestorDelegate>           _requestorDelegate;
    id<VVPlayerFinderDelegate>                                _finderDelegate;
}

@property (nonatomic, retain) id<VVPlayerFinderNetRequestorDelegate> requestorDelegate;
@property (nonatomic, assign) id<VVPlayerFinderDelegate> finderDelegate;

-(id) initWithDelegate:(id<VVPlayerFinderDelegate>)delegate;

-(void) requestAPlayerWithID:(NSString *)aPlayerID;



@end
