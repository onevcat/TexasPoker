//
//  VVPlayerAchiev.m
//  Poker
//
//  Created by onevcat on 11-12-2.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import "VVPlayerAchiev.h"

@implementation VVPlayerAchiev
@synthesize achievName = _achievName;
@synthesize achievDescription = _achievDescription;
@synthesize achievImageName = _achievImageName;


//=========================================================== 
// - (id)initWith:
//
//=========================================================== 
- (id)initWithAchievName:(NSString*)anAchievName achievDescription:(NSString*)anAchievDescription achievImageName:(NSString*)anAchievImageName 
{
    if ((self = [super init]))
    {
        self.achievName = anAchievName;
        self.achievDescription = anAchievDescription;
        self.achievImageName = anAchievImageName;
    }
    return self;
}


//=========================================================== 
// + (id)objectWith:
//
//=========================================================== 
+ (id)objectWithAchievName:(NSString*)anAchievName achievDescription:(NSString*)anAchievDescription achievImageName:(NSString*)anAchievImageName  
{
    id result = [[[self class] alloc] initWithAchievName:anAchievName achievDescription:anAchievDescription achievImageName:anAchievImageName];
    
    return [result autorelease];
}


//=========================================================== 
// dealloc
//=========================================================== 
- (void)dealloc
{
    self.achievName = nil;
    self.achievDescription = nil;
    self.achievImageName = nil;
    
    [super dealloc];
}


@end
