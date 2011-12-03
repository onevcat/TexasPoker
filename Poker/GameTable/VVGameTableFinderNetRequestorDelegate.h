//
//  VVGameTableFinderDelegate.h
//  Poker
//
//  Created by onevcat on 11-11-25.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVGameTableFinderNetReceiverDelegate.h"

@protocol VVGameTableFinderNetRequestorDelegate <NSObject>

//向服务器请求所有游戏桌的类型，包括最小盲注，决定速度，座位数等
-(void) requestPossibleTableTypesWithDelegate:(id<VVGameTableFinderReceiverDelegate>)delegate;

//通过赌注，游戏速度和座位信息查找游戏桌类型，nil为无限制
-(void) requestTablesWithBetBlinds:(NSArray *)betBlinds tableSpeed:(NSArray *)tableSpeed seatsType:(NSArray *)seatsType tableNumber:(int)number delegate:(id<VVGameTableFinderReceiverDelegate>)delegate;

//通过桌子的ID请求桌子的详细信息
-(void) requestATableWithID:(NSString *)aTableUniqueID delegate:(id<VVGameTableFinderReceiverDelegate>)delegate;

@end
