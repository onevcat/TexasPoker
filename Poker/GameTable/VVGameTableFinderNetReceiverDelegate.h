//
//  VVGameTableFinderDataSource.h
//  Poker
//
//  Created by onevcat on 11-11-27.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KEY_GAME_TABLE_FINDER_RECEIVER_BETBLINDS @"betBlinds"
#define KEY_GAME_TABLE_FINDER_RECEIVER_TABLESPEED @"tableSpeed"
#define KEY_GAME_TABLE_FINDER_RECEIVER_SEATSTYPE @"seatsType"

@protocol VVGameTableFinderReceiverDelegate <NSObject>

//服务器对-(void) requestPossibleTableTypes;的返回
-(void) requestPossibleTableTypesDidFinishedWithInfo:(NSDictionary *)info;

//服务器对-(void) requestTablesWithBetBlinds:(NSArray *)betBlinds tableSpeed:(NSArray *)tableSpeed seatsType:(NSArray *)seatsType tableNumber:(int)number;的返回
-(void) requestTablesWithConditionsDidFinishedWithInfo:(NSDictionary *)info;

//服务器对-(void) requestATableWithID:(NSString *)aTableUniqueID delegate:(id<VVGameTableFinderReceiverDelegate>)delegate;的返回
-(void) requestATableWithIDDidFinishedWithInfo:(NSDictionary *)info;

@end
