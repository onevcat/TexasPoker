//
//  GameTable.h
//  Poker
//
//  Created by onevcat on 11-11-25.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>

//VVGameTable类表述游戏牌桌的基本信息和规则，包括桌号，座位个数，最小盲注，牌桌速度等不随游戏进程改变的信息
//该类主要用于大厅中查找牌桌时的界面呈现
//playerList虽然会随时间改变而改变，但是对于每一次查询的结果playerList将保持不变
@interface VVGameTable : NSObject
{
    NSString*                                           _uniqueID;
    int                                                     _seatsType;
    int                                                     _betBlinds;
    int                                                     _tableSpeed;
    NSArray*                                           _playerList;
    
    int                                                     _minChip;
    int                                                     _maxChip;
}




@end
