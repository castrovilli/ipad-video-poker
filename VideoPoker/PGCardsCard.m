//
//  PGCardsCard.m
//  ConsolePoker
//
//  Created by Paul Griffiths on 12/19/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "PGCardsCard.h"

static int get_rank_from_index(int index) {
    int rank = index % 13 + 1;
    return (rank == 1) ? 14 : rank;
}

static int get_suit_from_index(int index) {
    return index / 13;
}

NSString * suit_long_string(int suit) {
    static NSArray * suit_names = nil;
    if ( !suit_names ) {
        suit_names = [[NSArray alloc] initWithObjects:@"clubs", @"hearts", @"spades", @"diamonds", nil];
    }
    return suit_names[suit];
}

NSString * rank_long_string(int rank) {
    static NSArray * rank_names = nil;
    if ( !rank_names ) {
        rank_names = [[NSArray alloc] initWithObjects:@"ace", @"two", @"three", @"four", @"five",
                      @"six", @"seven", @"eight", @"nine", @"ten", @"jack", @"queen", @"king", @"ace", nil];
    }
    return rank_names[rank - 1];
}

NSString * suit_short_string(int suit) {
    static NSArray * suit_names = nil;
    if ( !suit_names ) {
        suit_names = [[NSArray alloc] initWithObjects:@"C", @"H", @"S", @"D", nil];
    }
    return suit_names[suit];
}

NSString * rank_short_string(int rank) {
    static NSArray * rank_names = nil;
    if ( !rank_names ) {
        rank_names = [[NSArray alloc] initWithObjects:@"A", @"2", @"3", @"4", @"5",
                      @"6", @"7", @"8", @"9", @"T", @"J", @"Q", @"K", @"A", nil];
    }
    return rank_names[rank - 1];
}


@implementation PGCardsCard {
    int _index;
    int _sortingIndex;
    int _rank;
    int _suit;
}


//  Initialization methods

-(PGCardsCard *)initWithIndex:(int)index {
    if ( index < 0 || index > 51 ) {
        NSLog(@"Index is out of range.");
        return nil;
    }

    if ( (self = [super init]) ) {
        
        _index = index;
        _suit = get_suit_from_index(index);
        _rank = get_rank_from_index(index);
        _sortingIndex = _suit + 4 * ( (_rank == 14) ? 0 : _rank - 1);
    }
    
    return self;
}

-(PGCardsCard *)initWithRank:(int)rank andSuit:(int)suit {
    if ( suit < 0 || suit > 3 ) {
        return nil;
    }
    if ( rank < 1 || rank > 14 ) {
        return nil;
    }
    
    int index = ((rank == 14) ? 0 : (rank - 1)) + (suit * 13);
    return [self initWithIndex:index];
}

-(PGCardsCard *)init {
    return [self initWithIndex:0];
}


//  Card name methods

-(NSString *)longName {
    return [[NSString alloc] initWithFormat:@"%@ of %@",rank_long_string(_rank),suit_long_string(_suit)];
}

-(NSString *)shortName {
    return [[NSString alloc] initWithFormat:@"%@%@",rank_short_string(_rank),suit_short_string(_suit)];
}


//  Card comparison methods

-(BOOL)isSameRankAsCard:(PGCardsCard *)otherCard {
    return (_rank == otherCard.rank) ? YES : NO;
}

-(BOOL)isNotSameRankAsCard:(PGCardsCard *)otherCard {
    return (_rank != otherCard.rank) ? YES : NO;
}

-(BOOL)isLowerRankThanCard:(PGCardsCard *)otherCard {
    return (_rank < otherCard.rank) ? YES : NO;
}

-(BOOL)isHigherRankThanCard:(PGCardsCard *)otherCard {
    return (_rank > otherCard.rank) ? YES : NO;
}

-(BOOL)isLowerOrEqualRankThanCard:(PGCardsCard *)otherCard {
    return (_rank <= otherCard.rank) ? YES : NO;
}

-(BOOL)isHigherOrEqualRankThanCard:(PGCardsCard *)otherCard {
    return (_rank >= otherCard.rank) ? YES : NO;
}

@end
