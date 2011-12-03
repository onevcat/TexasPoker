//
//  VVNetRequestor.m
//  Poker
//
//  Created by onevcat on 11-11-25.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import "VVNetRequestor.h"

@implementation VVNetRequestor

@synthesize receiver = _receiver;

+(id) requestor
{
    VVNetRequestor *instance = [[VVNetRequestor alloc] init];
    return [instance autorelease];
}

-(id) init;
{
    if ( self = [super init] )
    {
        self.receiver = [VVNetReceiver receiver];
    }
    return self;
}


#pragma mark - VVGameTableFinderNetRequestorDelegate的实现
//由以下方法完成的请求需要提供VVGameTableFinderReceiverDelegate的delegate对象
//要求服务器返回所有游戏桌信息
-(void) requestPossibleTableTypesWithDelegate:(id<VVGameTableFinderReceiverDelegate>)delegate
{
    //设置receiver的gameTableFinderReceiverDelegate
    self.receiver.gameTableFinderReceiverDelegate = delegate;
    
    //向服务器发送请求，要求返回所有游戏桌类型信息
    
}

//通过赌注，游戏速度和座位信息查找游戏桌类型
-(void) requestTablesWithBetBlinds:(NSArray *)betBlinds tableSpeed:(NSArray *)tableSpeed seatsType:(NSArray *)seatsType tableNumber:(int)number delegate:(id<VVGameTableFinderReceiverDelegate>)delegate
{
    //设置receiver的gameTableFinderReceiverDelegate
    self.receiver.gameTableFinderReceiverDelegate = delegate;
    
    //向服务器发送按照一定条件查找符合条件的牌桌的请求
    

}


-(void) requestATableWithID:(NSString *)aTableUniqueID delegate:(id)delegate
{
    //设置receiver的gameTableFinderReceiverDelegate
    self.receiver.gameTableFinderReceiverDelegate = delegate;
    
    //向服务器请求以ID为aTableUniqueID的信息
}

#pragma mark - VVPlayerFinderNetRequestorDelegate的实现
-(void) requestAPlayerWithPlayerID:(NSString *)aPlayerID delegate:(id<VVPlayerFinderNetReceiverDelegate>)delegate
{
    //设置receiver的playerFinderReceriverDelegate
    self.receiver.playerFinderReceriverDelegate = delegate;
    
    //向服务器请求ID为aPlayerID的玩家详细信息
    
}

-(void) requestAPlayerAchievWithPlayerID:(NSString *)aPlayerID delegate:(id<VVPlayerFinderNetReceiverDelegate>)delegate
{
    //设置receiver的playerFinderReceriverDelegate
    self.receiver.playerFinderReceriverDelegate = delegate;
    
    //向服务器请求ID为aPlayer的玩家的成就信息
    
}

-(void) requestAPlayerStatWithPlayerID:(NSString *)aPlayerID delegate:(id<VVPlayerFinderNetReceiverDelegate>)delegate
{
    //设置receiver的playerFinderReceiverDelegate
    self.receiver.playerFinderReceriverDelegate = delegate;
    
    //向服务器请求ID为aPlayer的玩家的成就信息
    
}

#pragma mark - VVCardGameNetRequestorDelegate的实现
-(void) requestAllPlayersSittingInGameTable:(VVGameTable *)aGameTable delegate:(id<VVCardGameNetReceiverDelegate>)delegate
{
    //设置receiver的cardGameReceiverDelegate
    self.receiver.cardGameReceiverDelegate = delegate;
    
    //向服务器请求牌桌上的所有玩家的详细信息
    
}

-(void) submitAction:(CardGameAction)action chips:(int)chip delegate:(id<VVCardGameNetReceiverDelegate>)delegate
{
    //设置receiver的cardGameReceiverDelegate
    self.receiver.cardGameReceiverDelegate = delegate;
    
    //向服务器报告玩家动作
    
}

#pragma mark - dealloc
-(void) dealloc
{
    self.receiver = nil;
    [super dealloc];
}

@end
