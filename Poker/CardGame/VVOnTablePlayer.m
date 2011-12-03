//
//  VVPlayerList.m
//  Poker
//
//  Created by onevcat on 11-12-2.
//  Copyright (c) 2011年 Tsinghua University. All rights reserved.
//

#import "VVOnTablePlayer.h"

@implementation VVOnTablePlayer

@synthesize player = _player;
@synthesize next = _next;

-(id) initWithPlayer:(VVPlayer *)aPlayer seatsNum:(int)seatsNum
{
    if (self = [super init])
    {
        
        NSLog(@"\n Function: %s\n Pretty function: %s\n Line: %d\n File: %s\n Object: %@",
              __func__, __PRETTY_FUNCTION__, __LINE__, __FILE__, aPlayer); 
        
        self.player = aPlayer;
        if (aPlayer)
        {
            VVOnTablePlayer *tempOnTablePlayer = self;
            for (int i = 0; i < seatsNum; i++)
            {
                NSLog(@"SELF COUNT: %d",[self retainCount]);
                if (i == seatsNum - 1)
                {
                    tempOnTablePlayer.player = self.player;
                    tempOnTablePlayer.next = self;
                    
                    [self release];
                    
//                    NSLog(@"SELF:%@ COUNT: %d",self,[self retainCount]);
//                    NSLog(@"SELF+1:%@ COUNT: %d",self.next,[self.next retainCount]);
//                    NSLog(@"SELF+2:%@ COUNT: %d",self.next.next,[self.next.next retainCount]);
//                    NSLog(@"SELF+3:%@ COUNT: %d",self.next.next.next,[self.next.next.next retainCount]);
//                    NSLog(@"SELF+4:%@ COUNT: %d",self.next.next.next.next,[self.next.next.next.next retainCount]);
//                    NSLog(@"SELF+5:%@ COUNT: %d",self.next.next.next.next.next,[self.next.next.next.next.next retainCount]);
                }
                else
                {   
                    VVOnTablePlayer *emptyPlayer = [[VVOnTablePlayer alloc] initWithPlayer:nil seatsNum:seatsNum];
                    tempOnTablePlayer.next = emptyPlayer;
                    tempOnTablePlayer = emptyPlayer;
                    [emptyPlayer release];
                }
            }
        }
    }
    return self;
}


-(void) dealloc
{
//    NSLog(@"VVOnTablePlayer dealloc. SELF:%@, NEXT:%@",self,self.next);
    self.player = nil;
    self.next = nil;
    [super dealloc];
}

@end
