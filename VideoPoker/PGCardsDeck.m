//
//  PGCardsDeck.m
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "PGCardsDeck.h"

@implementation PGCardsDeck {
    NSMutableArray * _mainDeck;
    NSMutableArray * _discardPile;
}


//  Initialization method

- (PGCardsDeck *)init {
    if ( (self = [super init]) ) {
        _mainDeck = [[NSMutableArray alloc] init];
        _discardPile = [[NSMutableArray alloc] init];
        
        //  Add cards in reverse order, so first card is at top of deck
        
        for ( int index = 51; index >= 0; --index ) {
            [_mainDeck addObject:[[PGCardsCard alloc] initWithIndex:index]];
        }        
    }
    
    return self;
}


//  Public methods for returning number of cards in main deck and discard pile

- (NSUInteger)size {
    return [_mainDeck count];
}


- (NSUInteger)discardPileSize {
    return [_discardPile count];
}


//  Public method to shuffle deck

- (void)shuffle {
    NSUInteger deckSize = [_mainDeck count];

    for ( NSUInteger fromIndex = 0; fromIndex < deckSize; ++fromIndex ) {
        NSUInteger num_remaining = deckSize - fromIndex;
        NSUInteger toIndex = arc4random_uniform((u_int32_t) num_remaining) + fromIndex;
        [_mainDeck exchangeObjectAtIndex:fromIndex withObjectAtIndex:toIndex];
    }
}


//  Public methods for drawing top card, and drawing a number of cards from the top.
//  The drawn cards are removed from the deck. drawTopCards: may return fewer cards
//  than requested if fewer cards are available in the deck. The count of the returned
//  array can be checked.

- (PGCardsCard *)drawTopCard {
    PGCardsCard * topCard = [_mainDeck lastObject];

    if ( topCard ) {
        [_mainDeck removeLastObject];
    }

    return topCard;
}


- (NSMutableArray *)drawTopCards:(int)numCards {
    PGCardsCard * card;
    NSMutableArray * drawnCards = [[NSMutableArray alloc] init];

    while ( numCards-- && (card = [_mainDeck lastObject]) ) {
        [drawnCards addObject:card];
        [_mainDeck removeLastObject];
    }

    return drawnCards;
}


//  Public methods to add cards to the discard pile, and to replace discards back in the main deck.
//  NOTE: in addCardsToDiscards:, the supplied array is modified, and emptied of the cards it contained.

- (void)addCardToDiscards:(PGCardsCard *)card {
    [_discardPile addObject:card];
}


- (void)addCardsToDiscards:(NSMutableArray *)cards {
    for ( id array_object in cards ) {
        if ( ![array_object isMemberOfClass:[PGCardsCard class]] ) {
            assert(0);
        }
    }

    [_discardPile addObjectsFromArray:cards];
    [cards removeAllObjects];
}


- (void)replaceDiscards {
    [_mainDeck addObjectsFromArray:_discardPile];
    [_discardPile removeAllObjects];
}


@end
