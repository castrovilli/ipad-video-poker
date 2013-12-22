//
//  PGCardsPokerHand.h
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGCardsHand.h"

@interface PGCardsPokerHand : PGCardsHand

-(void)evaluate;
-(NSString *)evaluateString;

@end
