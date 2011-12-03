//
//  VVPlayerAchiev.h
//  Poker
//
//  Created by onevcat on 11-12-2.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VVPlayerAchiev : NSObject
{
    NSString *                              _achievName;
    NSString *                              _achievDescription;
    NSString *                              _achievImageName;
}

@property (nonatomic, copy) NSString *achievName;
@property (nonatomic, copy) NSString *achievDescription;
@property (nonatomic, copy) NSString *achievImageName;

- (id)initWithAchievName:(NSString*)anAchievName achievDescription:(NSString*)anAchievDescription achievImageName:(NSString*)anAchievImageName;
+ (id)objectWithAchievName:(NSString*)anAchievName achievDescription:(NSString*)anAchievDescription achievImageName:(NSString*)anAchievImageName;

@end
