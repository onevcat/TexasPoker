//
//  VVPlayer.h
//  Poker
//
//  Created by onevcat on 11-11-27.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVGameTable.h"

typedef enum
{
    NotOnTable,
    Thinking,
    SmallBlind,
    BigBlind,
    Anted,
    Call,
    Check,
    Raise,
    Fold,
    WaitingNextHand,
} PlayerOnTableState;

@interface VVPlayer : NSObject
{
    NSString*                               _uniqueID;
    NSString*                               _nickName;
    NSString*                               _email;
    
    NSString*                               _location;
    
    BOOL                                    _sitting;
    
    int                                         _chip;
    int                                         _gold;
    
    PlayerOnTableState              _state;
    NSString*                               _name;
    int                                         _level;
    
    BOOL                                    _vipPlayer;
    NSString*                               _thumbnail;
    VVGameTable*                    _playerTable;
    
    NSArray*                               _handCard;
}

@property (nonatomic, copy) NSString *uniqueID;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, assign) BOOL sitting;
@property (nonatomic, assign) int chip;
@property (nonatomic, assign) int gold;
@property (nonatomic, assign) PlayerOnTableState state;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int level;
@property (nonatomic, assign) BOOL vipPlayer;
@property (nonatomic, copy) NSString *thumbnail;
@property (nonatomic, retain) VVGameTable *playerTable;
@property (nonatomic, retain) NSArray *handCard;


-(id) initPlayerWithInfo:(NSDictionary *)info;

@end
