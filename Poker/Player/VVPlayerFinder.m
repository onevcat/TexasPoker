//
//  VVPlayerFinder.m
//  Poker
//
//  Created by onevcat on 11-12-2.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import "VVPlayerFinder.h"
#import "VVNetRequestor.h"
#import "VVPlayer.h"

@implementation VVPlayerFinder

@synthesize requestorDelegate = _requestorDelegate;
@synthesize finderDelegate = _finderDelegate;

#pragma mark - Init Method
-(id) initWithDelegate:(id<VVPlayerFinderDelegate>)delegate
{
    if (self = [super init])
    {
        self.requestorDelegate = [VVNetRequestor requestor];
        self.finderDelegate = delegate;
    }
    return self;
}

#pragma mark - 通过VVPlayerFinderNetRequestorDelegate发送查找请求
-(void) requestAPlayerWithID:(NSString *)aPlayerID
{
    if (self.requestorDelegate && [self.requestorDelegate respondsToSelector:@selector(requestAPlayerWithPlayerID:delegate:)])
    {
        [self.requestorDelegate requestAPlayerWithPlayerID:aPlayerID delegate:self];
    }
}

-(void) requestAPlayerAchievWithPlayerID:(NSString *)aPlayerID
{
    if (self.requestorDelegate && [self.requestorDelegate respondsToSelector:@selector(requestAPlayerAchievWithPlayerID:delegate:)])
    {
        [self.requestorDelegate requestAPlayerAchievWithPlayerID:aPlayerID delegate:self];
    }
}

-(void) requestAPlayerStatWithPlayerID:(NSString *)aPlayerID
{
    if (self.requestorDelegate && [self.requestorDelegate respondsToSelector:@selector(requestAPlayerStatWithPlayerID:delegate:)])
    {
        [self.requestorDelegate requestAPlayerStatWithPlayerID:aPlayerID delegate:self];
    }
}

#pragma mark - VVPlayerFinderNetReceiverDelegate接收接口的实现
-(void) requestAPlayerWithPlayerIDDidFinishedWithInfo:(NSDictionary *)info
{
    VVPlayer *aPlayer = nil;
    if (info)
    {
        //通过info生成VVPlayer
        
    }
    
    //通知finderDelegate请求完成
    if (self.finderDelegate && [self.finderDelegate respondsToSelector:@selector(requestAPlayerWithIDDidFinishedWithPlayer:)])
    {
        [self.finderDelegate requestAPlayerWithIDDidFinishedWithPlayer:aPlayer];
    }
}

-(void) requestAPlayerAchievWithPlayerIDDidFinishedWithInfo:(NSDictionary *)info
{
    NSArray *achievArray = nil;
    if (info)
    {
        //通过info生成包含若干VVPlayerAchiev的NSArray
        
    }
    
    //通知finderDelegate请求完成
    if (self.finderDelegate && [self.finderDelegate respondsToSelector:@selector(requestAPlayerAchievWithPlayerIDDidFinishedWithAchievArray:)])
    {
        [self.finderDelegate requestAPlayerAchievWithPlayerIDDidFinishedWithAchievArray:achievArray];
    }
}


-(void) requestAPlayerStatWithPlayerIDDidFinishedWithInfo:(NSDictionary *)info
{
    VVPlayerStat *stat = nil;
    if (info)
    {
        
    }
    
    //通知finderDelegate请求完成
    if (self.finderDelegate && [self.finderDelegate respondsToSelector:@selector(requestAPlayerStatWithPlayerIDDidFinishedWithStat:)])
    {
        [self.finderDelegate requestAPlayerStatWithPlayerIDDidFinishedWithStat:stat];
    }
}

@end
