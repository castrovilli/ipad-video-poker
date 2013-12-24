//
//  PGCardsCard.h
//  ConsolePoker
//
//  Created by Paul Griffiths on 12/19/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <Foundation/Foundation.h>


//  Class interface

@interface PGCardsCard : NSObject


//  Properties

@property (nonatomic, readonly) int index;
@property (nonatomic, readonly) int sortingIndex;
@property (nonatomic, readonly) int rank;
@property (nonatomic, readonly) int suit;


//  Public class methods

+(int)getRankFromIndex:(int)index;
+(int)getSuitFromIndex:(int)index;
+(int)getIndexFromRank:(int)rank andSuit:(int)suit;
+(int)getSuitIntegerFromChar:(int)shortNameChar;
+(int)getRankIntegerFromChar:(int)shortNameChar;

+(NSString *)getSuitLongString:(int)suit;
+(NSString *)getRankLongString:(int)rank;
+(NSString *)getSuitShortString:(int)suit;
+(NSString *)getRankShortString:(int)rank;


//  Public instance methods

-(PGCardsCard *)initWithIndex:(int)index;
-(PGCardsCard *)initWithRank:(int)rank andSuit:(int)suit;
-(PGCardsCard *)initWithShortName:(NSString *)cardName;

-(NSString *)longName;
-(NSString *)shortName;

-(BOOL)isSameCardAsCard:(PGCardsCard *)otherCard;
-(BOOL)isNotSameCardAsCard:(PGCardsCard *)otherCard;

-(BOOL)isSameRankAsCard:(PGCardsCard *)otherCard;
-(BOOL)isNotSameRankAsCard:(PGCardsCard *)otherCard;
-(BOOL)isLowerRankThanCard:(PGCardsCard *)otherCard;
-(BOOL)isHigherRankThanCard:(PGCardsCard *)otherCard;
-(BOOL)isLowerOrEqualRankThanCard:(PGCardsCard *)otherCard;
-(BOOL)isHigherOrEqualRankThanCard:(PGCardsCard *)otherCard;


@end
