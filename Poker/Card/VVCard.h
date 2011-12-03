//
//  VVCard.h
//  Poker
//
//  Created by onevcat on 11-12-1.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    CardTypeSpade,
    CardTypeHeart,
    CardTypeClub,
    CardTypeDiamond,
} CardType;

typedef enum {
    Card2 = 0,
    Card3 = 1,
    Card4 = 2,
    Card5 = 3,
    Card6 = 4,
    Card7 = 5,
    Card8 = 6,
    Card9 = 7,
    Card10 = 8,
    CardJ = 9,
    CardQ = 10,
    CardK = 11,
    CardA = 12,
} CardNumber;

typedef enum {
    CardStyleDefault,
} CardStyle;

@interface VVCard : NSObject
{
    CardType                    _cardType;
    CardNumber               _cardNumber;
    CardStyle                    _cardStyle;
}

//牌的类型：CardTypeSpade黑桃，CardTypeHeart红桃，CardTypeClub草花，CardTypeDiamond方块
@property (nonatomic, assign) CardType cardType;

//牌的号码：2~A
@property (nonatomic, assign) CardNumber cardNumber;

//牌的样式，默认为CardStyleDefault
@property (nonatomic, assign) CardStyle cardStyle;

//init方法，若无法初始化则返回nil
- (id)initWithCardType:(CardType)aCardType cardNumber:(CardNumber)aCardNumber cardStyle:(CardStyle)aCardStyle;
+ (id)objectWithCardType:(CardType)aCardType cardNumber:(CardNumber)aCardNumber cardStyle:(CardStyle)aCardStyle;

@end
