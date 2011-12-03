//
//  VVCard.m
//  Poker
//
//  Created by onevcat on 11-12-1.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import "VVCard.h"

@implementation VVCard
#pragma mark - properties
@synthesize cardType = _cardType;
@synthesize cardNumber = _cardNumber;
@synthesize cardStyle = _cardStyle;


#pragma mark - init method
//=========================================================== 
// - (id)initWith:
//
//=========================================================== 
- (id)initWithCardType:(CardType)aCardType cardNumber:(CardNumber)aCardNumber cardStyle:(CardStyle)aCardStyle 
{
    if ((self = [super init]))
    {
        //如果没有输入正确花色，返回nil
        if (aCardType == CardTypeSpade || 
            aCardType == CardTypeHeart || 
            aCardType == CardTypeClub || 
            aCardType == CardTypeDiamond) 
            self.cardType = aCardType;
        else 
            return nil;
        
        //如果没有输入正确牌面大小，返回nil
        if (aCardNumber < 13)
            self.cardNumber = aCardNumber;
        else
            return nil;
        
        self.cardStyle = aCardStyle;
    }
    return self;
}


//=========================================================== 
// + (id)objectWith:
//
//=========================================================== 
+ (id)objectWithCardType:(CardType)aCardType cardNumber:(CardNumber)aCardNumber cardStyle:(CardStyle)aCardStyle  
{
    id result = [[[self class] alloc] initWithCardType:aCardType cardNumber:aCardNumber cardStyle:aCardStyle];
    
    return [result autorelease];
}

#pragma mark - overload
-(BOOL) isEqual:(id)object
{
    if ([object isKindOfClass:[VVCard class]]) {
        VVCard *aCard = (VVCard *)object;
        if (self.cardType == aCard.cardType && self.cardNumber == aCard.cardNumber) {
            return YES;
        }
    }
    return NO;
}

-(NSString *)description
{
    NSString *type = nil;
    NSString *number = nil;

    switch (self.cardType) {
        case CardTypeSpade:
            type = @"Spade";
            break;
        case CardTypeHeart:
            type = @"Heart";
            break;
        case CardTypeClub:
            type = @"Club";
            break;
        case CardTypeDiamond:
            type = @"Diamond";
            break;
        default:
            break;
    }
    
    switch (self.cardNumber) {
        case Card2:
            number = @"2";
            break;
        case Card3:
            number = @"3";
            break;
        case Card4:
            number = @"4";
            break;
        case Card5:
            number = @"5";
            break;
        case Card6:
            number = @"6";
            break;
        case Card7:
            number = @"7";
            break;
        case Card8:
            number = @"8";
            break;
        case Card9:
            number = @"9";
            break;
        case Card10:
            number = @"10";
            break;
        case CardJ:
            number = @"J";
            break;
        case CardQ:
            number = @"Q";
            break;
        case CardK:
            number = @"K";
            break;
        case CardA:
            number = @"A";
            break;
        default:
            break;
    }
    
    return [NSString stringWithFormat:@"Card: %@ %@",type,number];
}

@end
