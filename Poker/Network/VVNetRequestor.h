//
//  VVNetRequestor.h
//  Poker
//
//  Created by onevcat on 11-11-25.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVGameTableFinderNetRequestorDelegate.h"
#import "VVPlayerFinderNetRequestorDelegate.h"
#import "VVCardGameNetRequestorDelegate.h"

#import "VVNetReceiver.h"

@interface VVNetRequestor : NSObject<VVGameTableFinderNetRequestorDelegate,VVPlayerFinderNetRequestorDelegate,VVCardGameNetRequestorDelegate>
{
    VVNetReceiver *                         _receiver;
}

@property (nonatomic,retain) VVNetReceiver *receiver;
+(id) requestor;
-(id) init;

@end
