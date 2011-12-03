//
//  VVNetReceiver.m
//  Poker
//
//  Created by onevcat on 11-11-25.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import "VVNetReceiver.h"

@implementation VVNetReceiver

@synthesize gameTableFinderReceiverDelegate = _gameTableFinderReceiverDelegate;
@synthesize playerFinderReceriverDelegate = _playerFinderReceiverDelegate;
@synthesize cardGameReceiverDelegate = _cardGameReceiverDelegate;
+(id) receiver
{
    VVNetReceiver *instance =  [[VVNetReceiver alloc] init];
    return [instance autorelease];
}


-(id) init
{
    if ( self = [super init] )
    {
        
    }
    return self;
}


@end
