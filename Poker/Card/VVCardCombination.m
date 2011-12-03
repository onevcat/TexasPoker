//
//  VVCardCombinationDecider.m
//  Poker
//
//  Created by onevcat on 11-12-1.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import "VVCardCombination.h"
#import "VVCard.h"

@implementation VVCardCombination
@synthesize cardCombination = _cardCombination;
@synthesize highLightCards = _highLightCards;

#pragma mark - Card Sorter
+(NSArray *) sortCards:(NSArray *)cards numberAscending:(BOOL)isAscending
{
    NSSortDescriptor *sorter = [NSSortDescriptor sortDescriptorWithKey:@"cardNumber" ascending:isAscending];
    return [cards sortedArrayUsingDescriptors:[NSArray arrayWithObject:sorter]];
}

+(NSArray *) sortCards:(NSArray *)cards  typeAscending:(BOOL)isAscending
{
    NSSortDescriptor *sorter = [NSSortDescriptor sortDescriptorWithKey:@"cardType" ascending:isAscending];
    return [cards sortedArrayUsingDescriptors:[NSArray arrayWithObject:sorter]];
}

+(NSArray *) sortCards:(NSArray *)cards  numberAscending:(BOOL)isNumberAscending typeAscending:(BOOL)isTypeAscending
{
    NSSortDescriptor *sorter0 = [NSSortDescriptor sortDescriptorWithKey:@"cardNumber" ascending:isNumberAscending];
    NSSortDescriptor *sorter1 = [NSSortDescriptor sortDescriptorWithKey:@"cardType" ascending:isTypeAscending];
    return [cards sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sorter1,sorter0,nil]];
}

#pragma mark - Combinatin Type Checker
//检查玩家手上和桌面上的牌的组合
//输入是排序好的牌
//成功则返回从大到小顺序的牌，失败则返回nil

+(NSArray *) checkPair:(NSArray *)numberSortedCards
{
    int count = [numberSortedCards count];
    for (int i = 0; i < count - 1; i++) 
    {
        VVCard *card = (VVCard *)[numberSortedCards objectAtIndex:i];
        VVCard *nextCard = (VVCard *)[numberSortedCards objectAtIndex:i+1];
        if (card.cardNumber == nextCard.cardNumber) 
        {
            return [NSArray arrayWithObjects:card,nextCard,nil];
        }
    }
    return nil;
}

+(NSArray *) checkTwoPairs:(NSArray *)numberSortedCards
{
    int count = [numberSortedCards count];
    NSMutableArray *returnArr = [NSMutableArray array];
    for (int i = 0; i < count - 1; i++)
    {
        VVCard *card = (VVCard *)[numberSortedCards objectAtIndex:i];
        VVCard *nextCard = (VVCard *)[numberSortedCards objectAtIndex:i+1];
        if (card.cardNumber == nextCard.cardNumber) 
        {
            [returnArr addObject:card];
            [returnArr addObject:nextCard];
            if ([returnArr count] == 4) 
            {
                return [NSArray arrayWithArray:returnArr];
            }
        }
    }
    return nil;
}

+(NSArray *) checkThreeOfKind:(NSArray *)numberSortedCards
{
    int count = [numberSortedCards count];
    for (int i = 0; i < count - 2; i++) 
    {
        VVCard *card0 = (VVCard *)[numberSortedCards objectAtIndex:i];
        VVCard *card1 = (VVCard *)[numberSortedCards objectAtIndex:i+1];
        if (card0.cardNumber == card1.cardNumber)
        {
            VVCard *card2 = (VVCard *)[numberSortedCards objectAtIndex:i+2];
            if (card1.cardNumber == card2.cardNumber)
            {
                return [NSArray arrayWithObjects:card0,card1,card2,nil];
            }
        }
    }
    return nil;
}

+(NSArray *) checkStraight:(NSArray *)numberSortedCards
{
    int count = [numberSortedCards count];
    for (int i = 0; i < count - 4; i++)
    {
        VVCard *card0 = (VVCard *)[numberSortedCards objectAtIndex:i];
        VVCard *card1 = (VVCard *)[numberSortedCards objectAtIndex:i+1];
        if (card0.cardNumber - 1 == card1.cardNumber)
        {
            VVCard *card2 = (VVCard *)[numberSortedCards objectAtIndex:i+2];
            if (card1.cardNumber - 1 == card2.cardNumber)
            {
                VVCard *card3 = (VVCard *)[numberSortedCards objectAtIndex:i+3];
                if (card2.cardNumber - 1 == card3.cardNumber)
                {
                    VVCard *card4 = (VVCard *)[numberSortedCards objectAtIndex:i+4];
                    if (card3.cardNumber - 1 == card4.cardNumber)
                        return [NSArray arrayWithObjects:card0,card1,card2,card3,card4,nil];
                }
            }
        }
    }
    return nil;
}

+(NSArray *) checkFlush:(NSArray *)typeSortedCards
{
    int count = [typeSortedCards count];
    for (int i = 0; i < count - 4; i++)
    {
        VVCard *card0 = (VVCard *)[typeSortedCards objectAtIndex:i];
        VVCard *card1 = (VVCard *)[typeSortedCards objectAtIndex:i+1];
        if (card0.cardType == card1.cardType)
        {
            VVCard *card2 = (VVCard *)[typeSortedCards objectAtIndex:i+2];
            if (card1.cardType == card2.cardType)
            {
                VVCard *card3 = (VVCard *)[typeSortedCards objectAtIndex:i+3];
                if (card2.cardType == card3.cardType)
                {
                    VVCard *card4 = (VVCard *)[typeSortedCards objectAtIndex:i+4];
                    if (card3.cardType == card4.cardType)
                        return [NSArray arrayWithObjects:card0,card1,card2,card3,card4,nil];
                }
            }
        }
    }
    return nil;
}

+(NSArray *) checkFullHouse:(NSArray *)numberSortedCards
{
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:numberSortedCards];
    NSMutableArray *returnArr = [NSMutableArray array];
    NSArray *threeArray = [VVCardCombination checkThreeOfKind:tempArr];
    if (threeArray)
    {
        [tempArr removeObjectsInArray:threeArray];
        [returnArr addObjectsFromArray:threeArray];
        NSArray *pariArray = [VVCardCombination checkPair:tempArr];
        if (pariArray)
        {
            [returnArr addObjectsFromArray:pariArray];
            return [NSArray arrayWithArray:returnArr];
        }
    }
    return nil;
}

+(NSArray *) checkFourOfKind:(NSArray *)numberSortedCards
{
    int count = [numberSortedCards count];
    for (int i = 0; i < count - 3; i++)
    {
        VVCard *card0 = (VVCard *)[numberSortedCards objectAtIndex:i];
        VVCard *card1 = (VVCard *)[numberSortedCards objectAtIndex:i+1];
        if (card0.cardNumber == card1.cardNumber)
        {
            VVCard *card2 = (VVCard *)[numberSortedCards objectAtIndex:i+2];
            if (card1.cardNumber == card2.cardNumber)
            {
                VVCard *card3 = (VVCard *)[numberSortedCards objectAtIndex:3];
                if (card2.cardNumber == card3.cardNumber)
                {
                    return [NSArray arrayWithObjects:card0,card1,card2,card3,nil];
                }
            }
        }
    }
    return nil;
}

+(NSArray *) checkStraightFlush:(NSArray *)typeNumberSortedCards
{
    NSArray *flushArr = [VVCardCombination checkFlush:typeNumberSortedCards];
    if (flushArr)
    {
        NSArray *returnArr = [VVCardCombination checkStraight:flushArr];
        if (returnArr)
        {
            return returnArr;
        }
    }
    return nil;
}

#pragma mark - Init Method
-(id) initWithCardCombinationType:(CardCombinationType)combinationType array:(NSArray *)anArray
{
    if (self = [super init])
    {
        self.cardCombination = combinationType;
        self.highLightCards = anArray;
    }
    return self;
}

+(id) combinationWithCardCombinationType:(CardCombinationType)combinationType array:(NSArray *)anArray
{
    VVCardCombination *combination = [[VVCardCombination alloc] initWithCardCombinationType:combinationType array:anArray];
    return [combination autorelease];
}




#pragma mark - Main Method
+(id) combinationOfCards:(NSArray *)cards
{
    //如果输入为nil或空数组
    int cardsCount = [cards count];
    if (cardsCount == 0) 
        return nil;
    
    //类型转换，检查数组内是否全为VVCard
    NSMutableArray *tempCards = [NSMutableArray array];
    for (id obj in cards)
    {
        if ([obj isKindOfClass:[VVCard class]]) 
        {
            VVCard *tempCard = (VVCard *)obj;
            [tempCards addObject:tempCard];
        }
    }
    
    //如果有不是VVCard的对象，返回nil表示错误
    if ([tempCards count] != cardsCount) 
        return nil;
    
    
    //开始检查组合
    NSArray *returnArr = nil;
    
    //先检查是否是同花顺
    NSArray *typeNumberSortedCards  = [VVCardCombination sortCards:tempCards numberAscending:NO typeAscending:YES];
    if ( ( returnArr = [VVCardCombination checkStraightFlush:typeNumberSortedCards] ) )
    {
        return [VVCardCombination combinationWithCardCombinationType:StraightFlush array:returnArr];
    }
    
    //不是同花顺，检查是否是四个相同
    NSArray *numberSortedCards = [VVCardCombination sortCards:tempCards numberAscending:NO];
    if ( ( returnArr = [VVCardCombination checkFourOfKind:numberSortedCards] ) )
    {
        return [VVCardCombination combinationWithCardCombinationType:FourOfKind array:returnArr];
    }
    
    //也不是四同，检查是否是满堂
    if ((returnArr = [VVCardCombination checkFullHouse:numberSortedCards]))
    {
        return [VVCardCombination combinationWithCardCombinationType:FullHouse array:returnArr];
    }
    
    //也不是满堂，检查是否是同花
    NSArray *typeSortedCards = [VVCardCombination sortCards:tempCards typeAscending:YES];
    if ((returnArr = [VVCardCombination checkFlush:typeSortedCards]))
    {
        return [VVCardCombination combinationWithCardCombinationType:Flush array:returnArr];
    }
    
    //也不是同花，检查是否是顺子
    if ( ( returnArr = [VVCardCombination checkStraight:numberSortedCards] ) )
    {
        return [VVCardCombination combinationWithCardCombinationType:Straight array:returnArr];
    }
    
    //也不是顺子，检查是否是三张
    if ( ( returnArr = [VVCardCombination checkThreeOfKind:numberSortedCards] ) )
    {
        return [VVCardCombination combinationWithCardCombinationType:ThreeOfKind array:returnArr];
    }
    
    //也不是三张，检查是否是两对
    if ( ( returnArr = [VVCardCombination checkTwoPairs:numberSortedCards] ) )
    {
        return [VVCardCombination combinationWithCardCombinationType:TwoPairs array:returnArr];
    }
    
    //也不是两对，检查是否是一对
    if ( ( returnArr = [VVCardCombination checkPair:numberSortedCards] ) )
    {
        return [VVCardCombination combinationWithCardCombinationType:Pair array:returnArr];
    }
    
    //都不是，只能是高牌咯
    returnArr =  [NSArray arrayWithObject:[numberSortedCards objectAtIndex:0]];
    
    return [VVCardCombination combinationWithCardCombinationType:HighCard array:returnArr];
    
}


#pragma mark - dealloc
-(void) dealloc
{
    self.highLightCards = nil;
    [super dealloc];
}

#pragma mark - overload
-(NSString *)description
{
    NSString *type = nil;
    switch (self.cardCombination)
    {
        case HighCard:
            type = @"HighCard";
            break;
        case Pair:
            type = @"Pair";
            break;
        case TwoPairs:
            type = @"TwoPairs";
            break;
        case ThreeOfKind:
            type = @"ThreeOfKind";
            break;
        case Straight:
            type = @"Straight";
            break;
        case Flush:
            type = @"Flush";
            break;
        case FullHouse:
            type = @"FullHouse";
            break;
        case FourOfKind:
            type = @"FourOfKind";
            break;
        case StraightFlush:
            type = @"StraightFlush";
            break;
        default:
            break;
    }
    
    NSString *returnStr = [NSString stringWithFormat:@"Combination: %@\n%@",type,self.highLightCards];
    
    return returnStr;
}

@end
