//
//  VVCardGame.h
//  Poker
//
//  Created by onevcat on 11-12-2.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVGameTable.h"
#import "VVCardGameNetRequestorDelegate.h"
#import "VVCardGameNetReceiverDelegate.h"
#import "VVPlayer.h"
#import "VVOnTablePlayer.h"

@protocol VVCardGameDelegate <NSObject>
-(void) receivedHandCards:(NSArray *)cards;
@end

@interface VVCardGame : NSObject<VVCardGameNetReceiverDelegate>
{
    id<VVCardGameNetRequestorDelegate>      _requestorDelegate;
    id<VVCardGameDelegate>                           _cardGameDelegate;
    
    VVGameTable*                                              _table;
    VVOnTablePlayer*                                          _onTablePlayers;
    
    NSArray*                                                         _cardOnTable;
}

@property (nonatomic, retain) id<VVCardGameNetRequestorDelegate> requestorDelegate;
@property (nonatomic, assign) id<VVCardGameDelegate> cardGameDelegate;
@property (nonatomic, retain) VVGameTable *table;
@property (nonatomic, retain) VVOnTablePlayer *onTablePlayers;
@property (nonatomic, retain) NSArray *cardOnTable;


@end
