//
//  VVNetReceiver.h
//  Poker
//
//  Created by onevcat on 11-11-25.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVGameTableFinderNetReceiverDelegate.h"
#import "VVPlayerFinderNetReceiverDelegate.h"
#import "VVCardGameNetReceiverDelegate.h"

@interface VVNetReceiver : NSObject
{
    id <VVGameTableFinderReceiverDelegate>            _gameTableFinderReceiverDelegate;
    id <VVPlayerFinderNetReceiverDelegate>                _playerFinderReceiverDelegate;
    id <VVCardGameNetReceiverDelegate>                 _cardGameReceiverDelegate;
}

@property (nonatomic,assign) id <VVGameTableFinderReceiverDelegate> gameTableFinderReceiverDelegate;
@property (nonatomic,assign) id<VVPlayerFinderNetReceiverDelegate> playerFinderReceriverDelegate;
@property (nonatomic,assign) id<VVCardGameNetReceiverDelegate> cardGameReceiverDelegate;
+(id) receiver;

@end
