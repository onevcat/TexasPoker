//
//  VVCardGameNetReceiverDelegate.h
//  Poker
//
//  Created by onevcat on 11-12-2.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VVCardGameNetReceiverDelegate <NSObject>

//-(void) requestAllPlayersSittingInGameTable:(VVGameTable *)aGameTable delegate:(id<VVCardGameNetReceiverDelegate>)delegate;的返回
-(void) requestAllPlayersSittingInGameTableDidFinished:(NSDictionary *)info;

//从服务器收到手牌，cards应为包含两个VVCard的对象
-(void) receivedHandCards:(NSDictionary *)info;


@end
