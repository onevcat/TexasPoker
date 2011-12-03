//
//  VVPlayerList.h
//  Poker
//
//  Created by onevcat on 11-12-2.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVPlayer.h"

@interface VVOnTablePlayer : NSObject
{
    VVPlayer*                                   _player;
    VVOnTablePlayer*                      _next;
    int                                               _distance;
}

@property (nonatomic, retain) VVPlayer *player;
@property (nonatomic, retain) VVOnTablePlayer *next;


-(id) initWithPlayer:(VVPlayer *)aPlayer seatsNum:(int)seatsNum;



@end
