//
//  VVCardGame.m
//  Poker
//
//  Created by onevcat on 11-12-2.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import "VVCardGame.h"

@implementation VVCardGame

@synthesize requestorDelegate = _requestorDelegate;
@synthesize cardGameDelegate = _cardGameDelegate;
@synthesize table = _table;
@synthesize onTablePlayers = _onTablePlayers;
@synthesize cardOnTable = _cardOnTable;

#pragma mark - VVCardGameNetReceiverDelegate接收接口的实现
-(void) requestAllPlayersSittingInGameTableDidFinished:(NSDictionary *)info
{
    
}

-(void) receivedHandCards:(NSDictionary *)info
{
    NSArray *cardsArr = nil;
    if (info)
    {
            
    }
    
    if (self.cardGameDelegate && [self.cardGameDelegate respondsToSelector:@selector(receivedHandCards:)])
    {
        [self.cardGameDelegate receivedHandCards:cardsArr];
    }
    
}

@end
