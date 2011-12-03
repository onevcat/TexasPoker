//
//  VVCardCombinationDecider.h
//  Poker
//
//  Created by onevcat on 11-12-1.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    HighCard,
    Pair,
    TwoPairs,
    ThreeOfKind,
    Straight,
    Flush,
    FullHouse,
    FourOfKind,
    StraightFlush,
    
} CardCombinationType;

@interface VVCardCombination : NSObject
{
    CardCombinationType                 _cardCombination;
    NSArray *                                       _highLightCards;
}

@property (nonatomic, assign) CardCombinationType cardCombination;
@property (nonatomic, retain) NSArray *highLightCards;

+(id) combinationOfCards:(NSArray *)cards;
@end
