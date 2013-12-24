//
//  PGCardsPokerTable.m
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "PGCardsPokerTable.h"
#import "PGCardsCard.h"
#import "PGCardsDeck.h"
#import "PGCardsPokerHand.h"


static const int BET_INITIAL_VALUE = 50;
static const int CASH_INITIAL_VALUE = 1000;


@implementation PGCardsPokerTable {
    PGCardsPokerHand * _hand;
    PGCardsDeck * _deck;
    BOOL _flipped[5];
}


//  Initialization method

- (PGCardsPokerTable *)init {
    if ( (self = [super init]) ) {
        _deck = [PGCardsDeck new];
        _hand = [PGCardsPokerHand new];
        
        [self setGameState:POKER_GAMESTATE_INITIAL];
        [self resetBetAndCashToInitialValues];
        [self flipCards];
    }
    
    return self;
}


//  Public methods for changing a card's flipped status and querying its flipped status.
//  The card's position is specified in the range 1 through 5, inclusive.

- (BOOL)isCardFlipped:(int)position {
    return _flipped[position - 1];
}


- (void)switchCardFlip:(int)position {
    if ( [self isCardFlipped:position] ) {
        [self unflipCard:position];
    } else {
        [self flipCard:position];
    }
}


//  Public method for replacing the flipped cards with new ones
//  The card's position is specified in the range 1 through 5, inclusive.

- (void)replaceFlippedCards {
    for ( int position = 1; position < 6; ++position ) {
        if ( [self isCardFlipped:position] ) {
            [_hand replaceCardAtPosition:position fromDeck:_deck];
        }
    }
    
    [self unflipCards];
}


//  Public method for getting the index value of an individual card.
//  The card's position is specified in the range 1 through 5, inclusive.

- (int)cardIndexAtPosition:(int)position {
    return [_hand cardIndexAtPosition:position];
}


//  Main public method for advancing the game state and progressing through the game.

- (void)advanceGameState {
    if ( self.gameState == POKER_GAMESTATE_INITIAL ) {
        
        //  Initial game state. Initial interface has been displayed prior to calling
        //  this method, so the player has already chosen her bet amount, or accepted
        //  the default, and is ready to be dealt a hand of cards, so the bet should be
        //  deducted from the pot now. The cards are initially flipped, so we should
        //  unflip them now.
        
        [self shuffleAndDrawWithDiscard:NO];
        [self unflipCards];
        [self deductBetFromPot];
        
        [self setGameState:POKER_GAMESTATE_DEALED];
        
    } else if ( self.gameState == POKER_GAMESTATE_DEALED ) {
        
        //  Cards have been dealt, and the player has flipped the cards she wants to
        //  exchange, so replace the flipped cards with new ones from the deck, which
        //  also unflips them all. Then, evaluate the resulting poker hand and update
        //  the pot with any winnings, set the evaluation string, and end the game if
        //  the player is out of cash.
        
        [self replaceFlippedCards];
        
        int winRatio = [_hand evaluate];
        [self updateCashAndBetWithWinRatio:winRatio];
        [self setEvaluationStringWithWinRatio:winRatio];
        
        if ( [self outOfCash] ) {
            [self setGameState:POKER_GAMESTATE_GAMEOVER];
        } else {
            [self setGameState:POKER_GAMESTATE_EVALUATED];
        }
        
    } else if ( self.gameState == POKER_GAMESTATE_EVALUATED ) {
        
        //  Player has made a new bet, if she wants, and chosen to deal another
        //  hand, so draw new cards and deduct the bet from the pot. Since the
        //  cards were already unflipped to show the final hand, we don't need
        //  to unflip them again, here.
        
        [self shuffleAndDrawWithDiscard:YES];
        [self deductBetFromPot];
        
        [self setGameState:POKER_GAMESTATE_DEALED];
        
    } else if ( self.gameState == POKER_GAMESTATE_GAMEOVER ) {
        
        //  Player has chosen to start a new game, so flip the cards to replicate the
        //  initial state, and reset the current bet and pot to their initial values.
        
        [self flipCards];
        [self resetBetAndCashToInitialValues];
        
        [self setGameState:POKER_GAMESTATE_NEWGAME];
        
    } else if ( self.gameState == POKER_GAMESTATE_NEWGAME ) {
        
        //  Following the start of a new game, game is in a situation equivalent
        //  to POKER_GAMESTATE_INITIAL where the bet has been made the the cards
        //  are ready to be drawn. The only difference is that we start with an
        //  existing hand, so we have to specify YES for shuffleAndDrawWithDiscard:.
        
        [self shuffleAndDrawWithDiscard:YES];
        [self unflipCards];
        [self deductBetFromPot];
        
        [self setGameState:POKER_GAMESTATE_DEALED];
        
    } else {
        
        //  We shouldn't ever get here, so log an error message and abort if we do.
        
        NSLog(@"Unrecognized game state in advanceGameState:");
        assert(0);
        
    }
}


//  Private methods for flipping all or individual cards.
//  The card's position is specified in the range 1 through 5, inclusive.

- (void)flipCard:(int)position {
    _flipped[position - 1] = YES;
}


- (void)flipCards {
    for ( int position = 1; position < 6; ++position ) {
        [self flipCard:position];
    }
}


- (void)unflipCard:(int)position {
    _flipped[position - 1] = NO;
}


- (void)unflipCards {
    for ( int position = 1; position < 6; ++position ) {
        [self unflipCard:position];
    }
}


//  Private method for shuffling deck and drawing a hand of cards

- (void)shuffleAndDrawWithDiscard:(BOOL)discard {
    if ( discard ) {
        [_hand discardAllCardsToDeck:_deck];
        [_deck replaceDiscards];
    }
    
    [_deck shuffle];
    [_hand drawCards:5 fromDeck:_deck];
}


//  Private method for deducting the bet amount from the pot

- (void)deductBetFromPot {
    _currentCash -= self.currentBet;
}


//  Private method to reset cash and bet to initial values

- (void)resetBetAndCashToInitialValues {
    _currentBet = BET_INITIAL_VALUE;
    _currentCash = CASH_INITIAL_VALUE;
  
}

//  Private method for setting the game state, a read-only property

- (void)setGameState:(enum PGCardsPokerGameState)gameState {
    _gameState = gameState;
}


//  Private method for updating the pot with any winnings, and adjusting
//  the default bet if it now exceeds the remaining cash.

- (void)updateCashAndBetWithWinRatio:(int)winRatio {
    _currentCash += winRatio * _currentBet;
    
    if ( _currentBet > _currentCash ) {
        _currentBet = _currentCash;
    }
}


//  Private method for setting the evaluation string. The evaluation string shows the
//  type of poker hand achieved, plus either the amount of cash they won, or a generic
//  bad luck message if they did not win.

- (void)setEvaluationStringWithWinRatio:(int)winRatio {
    NSString * winLoseString;
    
    if ( winRatio ) {
        NSNumberFormatter * nf = [NSNumberFormatter new];
        nf.numberStyle = NSNumberFormatterDecimalStyle;
        winLoseString = [NSString stringWithFormat:@"You win $%@!",
                         [nf stringFromNumber:[NSNumber numberWithInt:winRatio * _currentBet]]];
    } else {
        winLoseString = @"Better luck next time!";
    }
    
    _evaluationString = [NSString stringWithFormat:@"%@ %@", [_hand evaluateString], winLoseString];
}


//  Private method returns YES if the player is out of cash, NO otherwise

- (BOOL)outOfCash {
    return (self.currentCash < 1) ? YES : NO;
}


@end
