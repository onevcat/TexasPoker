//
//  VVPlayer.m
//  Poker
//
//  Created by onevcat on 11-11-27.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import "VVPlayer.h"

@implementation VVPlayer

@synthesize uniqueID = _uniqueID;
@synthesize nickName = _nickName;
@synthesize email = _email;
@synthesize location = _location;
@synthesize sitting = _sitting;
@synthesize chip = _chip;
@synthesize gold = _gold;
@synthesize state = _state;
@synthesize name = _name;
@synthesize level = _level;
@synthesize vipPlayer = _vipPlayer;
@synthesize thumbnail = _thumbnail;
@synthesize playerTable = _playerTable;
@synthesize handCard = _handCard;

-(id) initPlayerWithInfo:(NSDictionary *)info
{
    if ( self = [super init] )
    {
        
    }
    return self;
}


#pragma mark - overload
-(BOOL) isEqual:(id)object
{
    VVPlayer *player = nil;
    if ([object isKindOfClass:[VVPlayer class]])
    {
        player = (VVPlayer *)object;
    }
    return ( [player.uniqueID isEqual:self.uniqueID] );
}

//=========================================================== 
// dealloc
//=========================================================== 
- (void)dealloc
{
    self.uniqueID = nil;
    self.name = nil;
    
    [super dealloc];
}

@end
