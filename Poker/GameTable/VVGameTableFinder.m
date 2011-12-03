//
//  VVGameTableFinder.m
//  Poker
//
//  Created by onevcat on 11-11-25.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import "VVGameTableFinder.h"
#import "VVNetRequestor.h"
#import "VVGameTable.h"

@implementation VVGameTableFinder

@synthesize requestorDelegate                 =                _requestorDelegate;
@synthesize finderDelegate                       =                _finderDelegate;
@synthesize arrayBetBlinds                         =                _arrayBetBlinds;
@synthesize arrayTableSpeed                    =                _arrayTableSpeed;
@synthesize arraySeatsType                       =                _arraySeatsType;
@synthesize arrayRequestedTables           =                 _arrayRequestedTables;
@synthesize arrayConditionBetBlinds         =               _arrayConditionBetBlinds;
@synthesize arrayConditionTableSpeed    =               _arrayConditionTableSpeed;
@synthesize arrayConditionSeatsType       =               _arrayConditionSeatsType;


#pragma init
-(id) initWithDelegate:(id<VVGameTableFinderDelegate>)delegate
{
    if ( self = [super init] )
    {
        self.requestorDelegate = [VVNetRequestor requestor];
        self.finderDelegate = delegate;
    }
    return self;
}



#pragma mark - 通过VVGameTableFinderNetRequestorDelegate发送查找请求
-(void) requestPossibleTableTypes
{
    if (self.requestorDelegate && [self.requestorDelegate respondsToSelector:@selector(requestPossibleTableTypesWithDelegate:)])
    {
        [self.requestorDelegate requestPossibleTableTypesWithDelegate:self];
    }
}

-(void) requestTablesWithBetBlinds:(NSArray *)betBlinds tableSpeed:(NSArray *)tableSpeed seatsType:(NSArray *)seatsType tableNumber:(int)number
{
    if (self.requestorDelegate && [self.requestorDelegate respondsToSelector:@selector(requestTablesWithBetBlinds:tableSpeed:seatsType:tableNumber:delegate:)])
    {
        self.arrayConditionBetBlinds = betBlinds;
        self.arrayConditionTableSpeed = tableSpeed;
        self.arrayConditionSeatsType = seatsType;
        
        if (number == 0) {
            [self.requestorDelegate requestTablesWithBetBlinds:betBlinds tableSpeed:tableSpeed seatsType:seatsType tableNumber:DEFAULT_REQUEST_NUMBER delegate:self];
        } else {
            [self.requestorDelegate requestTablesWithBetBlinds:betBlinds tableSpeed:tableSpeed seatsType:seatsType tableNumber:number delegate:self];
        }
    }
}

-(void) requestATableWithID:(NSString *)aTableUniqueID
{
    if (self.requestorDelegate && [self.requestorDelegate respondsToSelector:@selector(requestATableWithID:delegate:)])
    {
        [self.requestorDelegate requestATableWithID:aTableUniqueID delegate:self];
    }
}


#pragma mark - VVGameTableFinderNetReceiverDelegate接收接口的实现
-(void) requestPossibleTableTypesDidFinishedWithInfo:(NSDictionary *)info
{
    if (info) 
    {
        //设置arrayBetBlinds,arrayTableSpeed和arraySeatsType
        self.arrayBetBlinds = [info objectForKey:KEY_GAME_TABLE_FINDER_RECEIVER_BETBLINDS];
        self.arrayConditionTableSpeed = [info objectForKey:KEY_GAME_TABLE_FINDER_RECEIVER_TABLESPEED];
        self.arrayConditionSeatsType = [info objectForKey:KEY_GAME_TABLE_FINDER_RECEIVER_SEATSTYPE];
    }
    
    //通知finderDelegate请求完成
    if (self.finderDelegate && [self.finderDelegate respondsToSelector:@selector(requestPossibleTableTypesDidFinishedWithFinder:)]) 
    {
        [self.finderDelegate requestPossibleTableTypesDidFinishedWithFinder:self];
    }
    
}


-(void) requestTablesWithConditionsDidFinishedWithInfo:(NSDictionary *)info
{
    if (info) {
        //在这里设置arrayRequestedTables
        //初始化简单的GameTable实例(用于在大厅中显示，需要牌桌ID，人数等基本信息)，并将其放入arrayRequestedTables中
        
        
    }
    
    //通知finderDelegate请求完成
    if (self.finderDelegate && [self.finderDelegate respondsToSelector:@selector(requestTablesDidFinishedWithFinder:)]) {
        [self.finderDelegate requestTablesDidFinishedWithFinder:self];
    }
    
}

-(void) requestATableWithIDDidFinishedWithInfo:(NSDictionary *)info
{   
    VVGameTable *gameTable = nil;
    if (info)
    {
        //在这里完成一个较详细的GameTable，用于在大厅中被选中时现实，需要玩家座位号，名字，筹码数等
        
    }
    
    //通知finderDelegate请求完成
    if (self.finderDelegate && [self.finderDelegate respondsToSelector:@selector(requestATableWithIDDidFinishedWithGameTable:)])
    {
        [self.finderDelegate requestATableWithIDDidFinishedWithGameTable:gameTable];
    }
    
}


#pragma dealloc
-(void)dealloc
{
    NSLog(@"dealloc of %@ is called!",self);
    
    self.requestorDelegate = nil;
    self.finderDelegate = nil;
    
    self.arrayBetBlinds = nil;
    self.arrayTableSpeed = nil;
    self.arraySeatsType = nil;
    
    self.arrayRequestedTables = nil;
    self.arrayConditionBetBlinds = nil;
    self.arrayConditionTableSpeed = nil;
    self.arrayConditionSeatsType = nil;
    
    [super dealloc];
}

@end
