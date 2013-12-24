//
//  PGCardsHand.m
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "PGCardsHand.h"

@implementation PGCardsHand


//  Initialization method

- (PGCardsHand *)init {
    if ( (self = [super init]) ) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return self;
}


//  Public method to return the number of cards currently in the hand

- (NSUInteger)size {
    return [_cards count];
}


//  Public method to add arbitrary cards from an array of short names

- (void)addCardsFromArrayOfShortNames:(NSArray *)cardNames {
    for ( NSString * cardName in cardNames ) {
        [_cards addObject:[[PGCardsCard alloc] initWithShortName:cardName]];
    }
}


//  Public method to draw the specified number of cards from the specified deck and add to the hand

- (void)drawCards:(int)numCards fromDeck:(PGCardsDeck *)deck {
    [_cards addObjectsFromArray:[deck drawTopCards:numCards]];
}


//  Public method to discard the entire hand back to the specified deck

- (void)discardAllCardsToDeck:(PGCardsDeck *)deck {
    [deck addCardsToDiscards:_cards];
}


//  Public method to replace a card at a specified index with a new card from the specified deck

- (int)replaceCardAtPosition:(int)position fromDeck:(PGCardsDeck *)deck {
    PGCardsCard * newCard = [deck drawTopCard];
    if ( !newCard) {
        return -1;
    }
    
    [deck addCardToDiscards:_cards[position - 1]];
    [_cards removeObjectAtIndex:(position - 1)];
    [_cards insertObject:newCard atIndex:(position - 1)];
    
    return 0;
}


//  Public methods to return information about the card at a specified index

- (int)cardIndexAtPosition:(int)position {
    if ( position > [_cards count] || position < 1 ) {
        return -1;
    }
    
    return ((PGCardsCard *) _cards[position - 1]).index;
}


- (int)cardRankAtPosition:(int)position {
    if ( position > [_cards count] || position < 1 ) {
        return -1;
    }
    
    return ((PGCardsCard *) _cards[position - 1]).rank;
}


- (int)cardSuitAtPosition:(int)position {
    if ( position > [_cards count] || position < 1 ) {
        return -1;
    }
    
    return ((PGCardsCard *) _cards[position - 1]).suit;
}

@end
