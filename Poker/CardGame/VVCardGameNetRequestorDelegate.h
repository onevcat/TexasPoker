//
//  VVCardGameNetRequestor.h
//  Poker
//
//  Created by onevcat on 11-12-2.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVCardGameNetReceiverDelegate.h"

@class VVGameTable;

typedef enum 
{
    CardGameActionCheck,
    CardGameActionFold,
    CardGameActionRaise,
    CardGameActionCall,
    CardGameActionLeave,
} CardGameAction;

@protocol VVCardGameNetRequestorDelegate <NSObject>

//向服务器请求想要进入的牌桌的桌上玩家的详细信息，包括当前筹码，物品，状态，座次等
-(void) requestAllPlayersSittingInGameTable:(VVGameTable *)aGameTable delegate:(id<VVCardGameNetReceiverDelegate>)delegate;

//向服务器提交玩家的动作
-(void) submitAction:(CardGameAction)action chips:(int)chip delegate:(id<VVCardGameNetReceiverDelegate>)delegate;

@end
