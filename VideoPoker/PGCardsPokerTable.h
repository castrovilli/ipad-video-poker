//
//  PGCardsPokerTable.h
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <Foundation/Foundation.h>

enum PGCardsPokerGameState {
    POKER_GAMESTATE_INITIAL,
    POKER_GAMESTATE_DEALED,
    POKER_GAMESTATE_FLIPPED,
    POKER_GAMESTATE_EVALUATED
};

@interface PGCardsPokerTable : NSObject

@property (nonatomic, readonly) enum PGCardsPokerGameState gameState;

-(BOOL)isCardFlipped:(int)cardPosition;
-(void)switchCardFlip:(int)cardPosition;
-(void)replaceFlippedCards;
-(int)cardIndexAtPosition:(int)position;
-(void)advanceGameState;
-(NSString *)evaluationString;


@end
