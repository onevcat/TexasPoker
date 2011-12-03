//
//  VVGameTableFinder.h
//  Poker
//
//  Created by onevcat on 11-11-25.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

//这个类用来在大厅中寻找合适一定条件的桌子，确定条件后使用NetRequestor中的发送方法向服务器进行请求
//该类需要一个网络请求代理: VVGameTableFinderNetRequestorDelegate
//该类需要实现网络返回接口：VVGameTableFinderReceiverDelegate
//该类需要一个完成代理：VVGameTableFinderDelegate

#import <Foundation/Foundation.h>
#import "VVGameTableFinderNetRequestorDelegate.h"
#import "VVGameTableFinderNetReceiverDelegate.h"

#define DEFAULT_REQUEST_NUMBER 10

@class VVGameTableFinder;
@class VVGameTable;

//调用该类中方法的实例应当遵守以下协议：
@protocol VVGameTableFinderDelegate <NSObject>

//requestPossibleTableTypesWithDelegate:请求完成
-(void) requestPossibleTableTypesDidFinishedWithFinder:(VVGameTableFinder *)finder;

//requestTablesWithBetBlinds:tableSpeed:seatsType:delegate:请求完成
-(void) requestTablesDidFinishedWithFinder:(VVGameTableFinder *)finder;

//requestATableWithID:(NSString *)aTableUniqueID;请求完成
-(void) requestATableWithIDDidFinishedWithGameTable:(VVGameTable *)aTable;

@end

@interface VVGameTableFinder : NSObject<VVGameTableFinderReceiverDelegate>
{
    id <VVGameTableFinderNetRequestorDelegate>                  _requestorDelegate;
    id <VVGameTableFinderDelegate>                  _finderDelegate;
    
    NSArray *                                                           _arrayBetBlinds;
    NSArray *                                                           _arrayTableSpeed;
    NSArray *                                                           _arraySeatsType;
    
    NSArray *                                                           _arrayRequestedTables;
   
    NSArray *                                                           _arrayConditionBetBlinds;
    NSArray *                                                           _arrayConditionTableSpeed;
    NSArray *                                                           _arrayConditionSeatsType;
}

@property (nonatomic,retain) id <VVGameTableFinderNetRequestorDelegate> requestorDelegate;
@property (nonatomic,assign) id <VVGameTableFinderDelegate> finderDelegate;


//allBetBlinds是游戏内允许的最小盲注的列表，eg. (5,10,20,100,200,10000)
@property (nonatomic, retain) NSArray *arrayBetBlinds;

//arrayTableSpeed是游戏内允许的思考时间的列表 eg. (10,20)
@property (nonatomic, retain) NSArray *arrayTableSpeed;

//arraySeatsType是游戏内允许的座位数的列表 eg.(5,9)
@property (nonatomic, retain) NSArray *arraySeatsType;

//arrayRequestedTables是服务器返回的按条件查找到的游戏桌的基本信息 eg.(VVGameTable0,VVGameTable1,...)
@property (nonatomic, retain) NSArray *arrayRequestedTables;

//allBetBlinds是上次查询所用的最小盲注的列表，eg. (5,10,20,100,200,10000)
@property (nonatomic, retain) NSArray *arrayConditionBetBlinds;

//arrayTableSpeed是上次查询所用的思考时间的列表 eg. (10,20)
@property (nonatomic, retain) NSArray *arrayConditionTableSpeed;

//arrayConditionSeatsType是上次查询所用的座位数的列表 eg.(5,9)
@property (nonatomic, retain) NSArray *arrayConditionSeatsType;

-(id) initWithDelegate:(id<VVGameTableFinderDelegate>)delegate;

//向服务器查询游戏桌所有可能的类型
-(void) requestPossibleTableTypes;

//通过一定条件向服务器进行查询，服务器需要返回牌桌的某些基本信息
//查询条件包括小盲注，速度，座位数和返回条数，若为nil则不受限制(需要在VVNetRequestor实现)
-(void) requestTablesWithBetBlinds:(NSArray *)betBlinds tableSpeed:(NSArray *)tableSpeed seatsType:(NSArray *)seatsType tableNumber:(int)number;

//通过桌子的ID查找唯一的桌子
-(void) requestATableWithID:(NSString *)aTableUniqueID;

@end
