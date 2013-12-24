//
//  PGCardsPokerHand.h
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGCardsHand.h"
#import "PGCardsPokerHandInfo.h"

@interface PGCardsPokerHand : PGCardsHand


//  Property

@property (strong, nonatomic, readonly) PGCardsPokerHandInfo * handInfo;


//  Public instance methods

-(int)evaluate;
-(NSString *)evaluateString;

-(BOOL)equalsHand:(PGCardsPokerHand *)otherHand;
-(BOOL)beatsHand:(PGCardsPokerHand *)otherHand;
-(BOOL)losesToHand:(PGCardsPokerHand *)otherHand;


@end
