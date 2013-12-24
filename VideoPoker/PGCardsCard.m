//
//  PGCardsCard.m
//  ConsolePoker
//
//  Created by Paul Griffiths on 12/19/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "PGCardsCard.h"


@implementation PGCardsCard


//  Public class method to return an integer rank from an integer index

+(int)getRankFromIndex:(int)index {
    int rank = index % 13 + 1;
    return (rank == 1) ? 14 : rank;
}


//  Public class method to return an integer suit from an integer index

+(int)getSuitFromIndex:(int)index {
    return index / 13;
}


//  Public class method to return an integer index from an integer rank and suit

+(int)getIndexFromRank:(int)rank andSuit:(int)suit {
    return ((rank == 14) ? 0 : (rank - 1)) + (suit * 13);
}


//  Public class method to return an integer suit from a character representation,
//  e.g. 'C' for clubs, 'S' for spades. Returns -1 on invalid character.

+ (int)getSuitIntegerFromChar:(int)shortNameChar {
    static const int shortNames[] = {'C', 'H', 'S', 'D'};
    
    for ( int idx = 0; idx < (sizeof(shortNames) / sizeof(shortNames[0])); ++idx ) {
        if ( shortNames[idx] == shortNameChar ) {
            return idx;
        }
    }
    
    return -1;
}


//  Public class method to return an integer rank from a character representation,
//  e.g. '2' for two, 'T' for ten, 'K' for king. Returns -1 on invalid character.

+ (int)getRankIntegerFromChar:(int)shortNameChar {
    static const int shortNames[] = {0, 0, '2', '3', '4', '5', '6', '7', '8',
        '9', 'T', 'J', 'Q', 'K', 'A'};
    
    for ( int idx = 2; idx < (sizeof(shortNames) / sizeof(shortNames[0])); ++idx ) {
        if ( shortNames[idx] == shortNameChar ) {
            return idx;
        }
    }
    
    return -1;
}


//  Public class method to return a long string representation of an integer suit,
//  e.g. "hearts" is returned for 1.

+ (NSString *)getSuitLongString:(int)suit {
    static NSArray * suitNames = nil;
    if ( !suitNames ) {
        suitNames = @[@"clubs", @"hearts", @"spades", @"diamonds"];
    }
    return suitNames[suit];
}


//  Public class method to return a long string representation of an integer rank,
//  e.g. "king" is returned for 13.

+ (NSString *)getRankLongString:(int)rank {
    static NSArray * rankNames = nil;
    if ( !rankNames ) {
        rankNames = @[@"ace", @"two", @"three", @"four", @"five", @"six", @"seven",
                      @"eight", @"nine", @"ten", @"jack", @"queen", @"king", @"ace"];
    }
    return rankNames[rank - 1];
}


//  Public class method to return a short string representation of an integer suit,
//  e.g. "S" is returned for 2.

+ (NSString *)getSuitShortString:(int)suit {
    static NSArray * suitNames = nil;
    if ( !suitNames ) {
        suitNames = @[@"C", @"H", @"S", @"D"];
    }
    return suitNames[suit];
}


//  Public class method to return a short string representation of an integer rank,
//  e.g. "T" is returned for 10.

+ (NSString *)getRankShortString:(int)rank {
    static NSArray * rankNames = nil;
    if ( !rankNames ) {
        rankNames = @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"T", @"J", @"Q", @"K", @"A"];
    }
    return rankNames[rank - 1];
}


//  Initialization method with specified card index

- (PGCardsCard *)initWithIndex:(int)index {
    if ( index < 0 || index > 51 ) {
        return nil;
    }

    if ( (self = [super init]) ) {
        _index = index;
        _suit = [PGCardsCard getSuitFromIndex:index];
        _rank = [PGCardsCard getRankFromIndex:index];
        _sortingIndex = _suit + 4 * ( (_rank == 14) ? 0 : _rank - 1);
    }
    
    return self;
}


//  Initialization method with specified rank and suit integers

- (PGCardsCard *)initWithRank:(int)rank andSuit:(int)suit {
    if ( suit < 0 || suit > 3 || rank < 1 || rank > 14 ) {
        return nil;
    }
    
    return [self initWithIndex:[PGCardsCard getIndexFromRank:rank andSuit:suit]];
}


//  Initialization method with specified short name, e.g. "QH"

-(PGCardsCard *)initWithShortName:(NSString *)cardName {
    if ( cardName.length != 2U ) {
        return nil;
    }
    
    int rank = [PGCardsCard getRankIntegerFromChar:[cardName characterAtIndex:0]];
    int suit = [PGCardsCard getSuitIntegerFromChar:[cardName characterAtIndex:1]];
    
    return [self initWithRank:rank andSuit:suit];
}


//  Default initialization method, returns Ace of Clubs

- (PGCardsCard *)init {
    return [self initWithIndex:0];
}


//  Public instance methods to return long and short names of cards

- (NSString *)longName {
    return [[NSString alloc] initWithFormat:@"%@ of %@", [PGCardsCard getRankLongString:_rank],
            [PGCardsCard getSuitLongString:_suit]];
}


- (NSString *)shortName {
    return [[NSString alloc] initWithFormat:@"%@%@", [PGCardsCard getRankShortString:_rank],
            [PGCardsCard getSuitShortString:_suit]];
}


//  Public instance methods to compare cards and ranks

- (BOOL)isSameCardAsCard:(PGCardsCard *)otherCard {
    return (_index == otherCard.index) ? YES : NO;
}


- (BOOL)isNotSameCardAsCard:(PGCardsCard *)otherCard {
    return (_index != otherCard.index) ? YES : NO;
}


- (BOOL)isSameRankAsCard:(PGCardsCard *)otherCard {
    return (_rank == otherCard.rank) ? YES : NO;
}


- (BOOL)isNotSameRankAsCard:(PGCardsCard *)otherCard {
    return (_rank != otherCard.rank) ? YES : NO;
}


- (BOOL)isLowerRankThanCard:(PGCardsCard *)otherCard {
    return (_rank < otherCard.rank) ? YES : NO;
}


- (BOOL)isHigherRankThanCard:(PGCardsCard *)otherCard {
    return (_rank > otherCard.rank) ? YES : NO;
}


- (BOOL)isLowerOrEqualRankThanCard:(PGCardsCard *)otherCard {
    return (_rank <= otherCard.rank) ? YES : NO;
}


- (BOOL)isHigherOrEqualRankThanCard:(PGCardsCard *)otherCard {
    return (_rank >= otherCard.rank) ? YES : NO;
}


@end
