//
//  PGCardsCardComparisonTests.m
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGCardsCard.h"

@interface PGCardsCardComparisonTests : XCTestCase

@end

@implementation PGCardsCardComparisonTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


//  Tests isSameCardAsCard evalutes true when cards are the same

- (void)testSameCardTrue
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithIndex:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithIndex:0];
    XCTAssertTrue([card1 isSameCardAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithIndex:10];
    card2 = [[PGCardsCard alloc] initWithIndex:10];
    XCTAssertTrue([card1 isSameCardAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithIndex:21];
    card2 = [[PGCardsCard alloc] initWithIndex:21];
    XCTAssertTrue([card1 isSameCardAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithIndex:42];
    card2 = [[PGCardsCard alloc] initWithIndex:42];
    XCTAssertTrue([card1 isSameCardAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithIndex:51];
    card2 = [[PGCardsCard alloc] initWithIndex:51];
    XCTAssertTrue([card1 isSameCardAsCard:card2]);
}


//  Tests isSameCardAsCard evalutes false when cards are not the same

- (void)testSameCardFalse
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithIndex:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithIndex:11];
    XCTAssertFalse([card1 isSameCardAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithIndex:15];
    card2 = [[PGCardsCard alloc] initWithIndex:16];
    XCTAssertFalse([card1 isSameCardAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithIndex:25];
    card2 = [[PGCardsCard alloc] initWithIndex:9];
    XCTAssertFalse([card1 isSameCardAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithIndex:38];
    card2 = [[PGCardsCard alloc] initWithIndex:45];
    XCTAssertFalse([card1 isSameCardAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithIndex:51];
    card2 = [[PGCardsCard alloc] initWithIndex:6];
    XCTAssertFalse([card1 isSameCardAsCard:card2]);
}


//  Tests isNotSameCardAsCard evalutes true when cards are not the same

- (void)testNotSameCardTrue
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithIndex:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithIndex:11];
    XCTAssertTrue([card1 isNotSameCardAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithIndex:15];
    card2 = [[PGCardsCard alloc] initWithIndex:16];
    XCTAssertTrue([card1 isNotSameCardAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithIndex:25];
    card2 = [[PGCardsCard alloc] initWithIndex:9];
    XCTAssertTrue([card1 isNotSameCardAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithIndex:38];
    card2 = [[PGCardsCard alloc] initWithIndex:45];
    XCTAssertTrue([card1 isNotSameCardAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithIndex:51];
    card2 = [[PGCardsCard alloc] initWithIndex:6];
    XCTAssertTrue([card1 isNotSameCardAsCard:card2]);
}


//  Tests isNotSameCardAsCard evalutes false when cards are the same

- (void)testNotSameCardFalse
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithIndex:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithIndex:0];
    XCTAssertFalse([card1 isNotSameCardAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithIndex:10];
    card2 = [[PGCardsCard alloc] initWithIndex:10];
    XCTAssertFalse([card1 isNotSameCardAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithIndex:21];
    card2 = [[PGCardsCard alloc] initWithIndex:21];
    XCTAssertFalse([card1 isNotSameCardAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithIndex:42];
    card2 = [[PGCardsCard alloc] initWithIndex:42];
    XCTAssertFalse([card1 isNotSameCardAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithIndex:51];
    card2 = [[PGCardsCard alloc] initWithIndex:51];
    XCTAssertFalse([card1 isNotSameCardAsCard:card2]);
}


//  Tests isSameRankAsCard evaluates true when cards are equal

- (void)testCardsEqualRankTrue
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithRank:1 andSuit:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithRank:1 andSuit:1];
    XCTAssertTrue([card1 isSameRankAsCard:card2]);

    card1 = [[PGCardsCard alloc] initWithRank:14 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:1 andSuit:2];
    XCTAssertTrue([card1 isSameRankAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:2 andSuit:1];
    card2 = [[PGCardsCard alloc] initWithRank:2 andSuit:3];
    XCTAssertTrue([card1 isSameRankAsCard:card2]);

    card1 = [[PGCardsCard alloc] initWithRank:9 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:9 andSuit:3];
    XCTAssertTrue([card1 isSameRankAsCard:card2]);

    card1 = [[PGCardsCard alloc] initWithRank:13 andSuit:2];
    card2 = [[PGCardsCard alloc] initWithRank:13 andSuit:1];
    XCTAssertTrue([card1 isSameRankAsCard:card2]);
}


//  Tests isSameRankAsCard evaluates false when cards are not equal

- (void)testCardsEqualRankFalse
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithRank:1 andSuit:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithRank:5 andSuit:1];
    XCTAssertFalse([card1 isSameRankAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:14 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:8 andSuit:2];
    XCTAssertFalse([card1 isSameRankAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:2 andSuit:1];
    card2 = [[PGCardsCard alloc] initWithRank:4 andSuit:3];
    XCTAssertFalse([card1 isSameRankAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:7 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:9 andSuit:3];
    XCTAssertFalse([card1 isSameRankAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:12 andSuit:2];
    card2 = [[PGCardsCard alloc] initWithRank:6 andSuit:1];
    XCTAssertFalse([card1 isSameRankAsCard:card2]);
}


//  Tests isNotSameRankAsCard evaluates true when cards are not equal

- (void)testCardsNotEqualRankTrue
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithRank:1 andSuit:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithRank:5 andSuit:1];
    XCTAssertTrue([card1 isNotSameRankAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:14 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:8 andSuit:2];
    XCTAssertTrue([card1 isNotSameRankAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:2 andSuit:1];
    card2 = [[PGCardsCard alloc] initWithRank:4 andSuit:3];
    XCTAssertTrue([card1 isNotSameRankAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:7 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:9 andSuit:3];
    XCTAssertTrue([card1 isNotSameRankAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:12 andSuit:2];
    card2 = [[PGCardsCard alloc] initWithRank:6 andSuit:1];
    XCTAssertTrue([card1 isNotSameRankAsCard:card2]);
}


//  Tests isNotSameRankAsCard evaluates false when cards are equal

- (void)testCardsNotEqualRankFalse
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithRank:1 andSuit:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithRank:1 andSuit:1];
    XCTAssertFalse([card1 isNotSameRankAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:14 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:1 andSuit:2];
    XCTAssertFalse([card1 isNotSameRankAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:2 andSuit:1];
    card2 = [[PGCardsCard alloc] initWithRank:2 andSuit:3];
    XCTAssertFalse([card1 isNotSameRankAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:9 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:9 andSuit:3];
    XCTAssertFalse([card1 isNotSameRankAsCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:13 andSuit:2];
    card2 = [[PGCardsCard alloc] initWithRank:13 andSuit:1];
    XCTAssertFalse([card1 isNotSameRankAsCard:card2]);
}


//  Tests isLowerRankThanCard evaluates true when rank is lower

- (void)testCardLowerRankTrue
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithRank:5 andSuit:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithRank:1 andSuit:1];
    XCTAssertTrue([card1 isLowerRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:8 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:14 andSuit:2];
    XCTAssertTrue([card1 isLowerRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:2 andSuit:1];
    card2 = [[PGCardsCard alloc] initWithRank:4 andSuit:3];
    XCTAssertTrue([card1 isLowerRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:7 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:9 andSuit:3];
    XCTAssertTrue([card1 isLowerRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:6 andSuit:2];
    card2 = [[PGCardsCard alloc] initWithRank:12 andSuit:1];
    XCTAssertTrue([card1 isLowerRankThanCard:card2]);
}


//  Tests isLowerRankThanCard evaluates false when rank is equal

- (void)testCardLowerRankFalseEqual
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithRank:1 andSuit:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithRank:1 andSuit:1];
    XCTAssertFalse([card1 isLowerRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:14 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:1 andSuit:2];
    XCTAssertFalse([card1 isLowerRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:2 andSuit:1];
    card2 = [[PGCardsCard alloc] initWithRank:2 andSuit:3];
    XCTAssertFalse([card1 isLowerRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:9 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:9 andSuit:3];
    XCTAssertFalse([card1 isLowerRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:13 andSuit:2];
    card2 = [[PGCardsCard alloc] initWithRank:13 andSuit:1];
    XCTAssertFalse([card1 isLowerRankThanCard:card2]);
}


//  Tests isLowerRankThanCard evaluates false when rank is higher

- (void)testCardLowerRankFalseHigher
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithRank:1 andSuit:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithRank:3 andSuit:1];
    XCTAssertFalse([card1 isLowerRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:14 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:13 andSuit:2];
    XCTAssertFalse([card1 isLowerRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:12 andSuit:1];
    card2 = [[PGCardsCard alloc] initWithRank:2 andSuit:3];
    XCTAssertFalse([card1 isLowerRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:5 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:4 andSuit:3];
    XCTAssertFalse([card1 isLowerRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:10 andSuit:2];
    card2 = [[PGCardsCard alloc] initWithRank:7 andSuit:1];
    XCTAssertFalse([card1 isLowerRankThanCard:card2]);
}


//  Tests isLowerOrEqualRankThanCard evaluates true when rank is lower

- (void)testCardLowerOrEqualRankTrue
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithRank:5 andSuit:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithRank:1 andSuit:1];
    XCTAssertTrue([card1 isLowerOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:8 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:14 andSuit:2];
    XCTAssertTrue([card1 isLowerOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:2 andSuit:1];
    card2 = [[PGCardsCard alloc] initWithRank:4 andSuit:3];
    XCTAssertTrue([card1 isLowerOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:7 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:9 andSuit:3];
    XCTAssertTrue([card1 isLowerOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:6 andSuit:2];
    card2 = [[PGCardsCard alloc] initWithRank:12 andSuit:1];
    XCTAssertTrue([card1 isLowerOrEqualRankThanCard:card2]);
}


//  Tests isLowerOrEqualRankThanCard evaluates true when rank is equal

- (void)testCardLowerOrEqualRankTrueEqual
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithRank:1 andSuit:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithRank:1 andSuit:1];
    XCTAssertTrue([card1 isLowerOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:14 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:1 andSuit:2];
    XCTAssertTrue([card1 isLowerOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:2 andSuit:1];
    card2 = [[PGCardsCard alloc] initWithRank:2 andSuit:3];
    XCTAssertTrue([card1 isLowerOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:9 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:9 andSuit:3];
    XCTAssertTrue([card1 isLowerOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:13 andSuit:2];
    card2 = [[PGCardsCard alloc] initWithRank:13 andSuit:1];
    XCTAssertTrue([card1 isLowerOrEqualRankThanCard:card2]);
}


//  Tests isLowerOrEqualRankThanCard evaluates false when rank is higher

- (void)testCardLowerOrEqualRankFalseHigher
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithRank:1 andSuit:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithRank:3 andSuit:1];
    XCTAssertFalse([card1 isLowerOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:14 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:13 andSuit:2];
    XCTAssertFalse([card1 isLowerOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:12 andSuit:1];
    card2 = [[PGCardsCard alloc] initWithRank:2 andSuit:3];
    XCTAssertFalse([card1 isLowerOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:5 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:4 andSuit:3];
    XCTAssertFalse([card1 isLowerOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:10 andSuit:2];
    card2 = [[PGCardsCard alloc] initWithRank:7 andSuit:1];
    XCTAssertFalse([card1 isLowerOrEqualRankThanCard:card2]);
}


//  Tests isHigherRankThanCard evaluates true when rank is higher

- (void)testCardHigherRankTrue
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithRank:1 andSuit:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithRank:3 andSuit:1];
    XCTAssertTrue([card1 isHigherRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:14 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:13 andSuit:2];
    XCTAssertTrue([card1 isHigherRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:12 andSuit:1];
    card2 = [[PGCardsCard alloc] initWithRank:2 andSuit:3];
    XCTAssertTrue([card1 isHigherRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:5 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:4 andSuit:3];
    XCTAssertTrue([card1 isHigherRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:10 andSuit:2];
    card2 = [[PGCardsCard alloc] initWithRank:7 andSuit:1];
    XCTAssertTrue([card1 isHigherRankThanCard:card2]);
}


//  Tests isHigherRankThanCard evaluates false when rank is equal

- (void)testCardHigherRankFalseEqual
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithRank:1 andSuit:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithRank:1 andSuit:1];
    XCTAssertFalse([card1 isHigherRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:14 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:1 andSuit:2];
    XCTAssertFalse([card1 isHigherRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:2 andSuit:1];
    card2 = [[PGCardsCard alloc] initWithRank:2 andSuit:3];
    XCTAssertFalse([card1 isHigherRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:9 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:9 andSuit:3];
    XCTAssertFalse([card1 isHigherRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:13 andSuit:2];
    card2 = [[PGCardsCard alloc] initWithRank:13 andSuit:1];
    XCTAssertFalse([card1 isHigherRankThanCard:card2]);
}


//  Tests isHigherRankThanCard evaluates false when rank is lower

- (void)testCardHigherRankFalseLower
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithRank:5 andSuit:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithRank:1 andSuit:1];
    XCTAssertFalse([card1 isHigherRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:8 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:14 andSuit:2];
    XCTAssertFalse([card1 isHigherRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:2 andSuit:1];
    card2 = [[PGCardsCard alloc] initWithRank:4 andSuit:3];
    XCTAssertFalse([card1 isHigherRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:7 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:9 andSuit:3];
    XCTAssertFalse([card1 isHigherRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:6 andSuit:2];
    card2 = [[PGCardsCard alloc] initWithRank:12 andSuit:1];
    XCTAssertFalse([card1 isHigherRankThanCard:card2]);
}


//  Tests isHigherOrEqualRankThanCard evaluates true when rank is higher

- (void)testCardHigherOrEqualRankTrue
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithRank:1 andSuit:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithRank:3 andSuit:1];
    XCTAssertTrue([card1 isHigherOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:14 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:13 andSuit:2];
    XCTAssertTrue([card1 isHigherOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:12 andSuit:1];
    card2 = [[PGCardsCard alloc] initWithRank:2 andSuit:3];
    XCTAssertTrue([card1 isHigherOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:5 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:4 andSuit:3];
    XCTAssertTrue([card1 isHigherOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:10 andSuit:2];
    card2 = [[PGCardsCard alloc] initWithRank:7 andSuit:1];
    XCTAssertTrue([card1 isHigherOrEqualRankThanCard:card2]);
}


//  Tests isHigherOrEqualRankThanCard evaluates true when rank is equal

- (void)testCardHigherOrEqualRankTrueEqual
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithRank:1 andSuit:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithRank:1 andSuit:1];
    XCTAssertTrue([card1 isHigherOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:14 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:1 andSuit:2];
    XCTAssertTrue([card1 isHigherOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:2 andSuit:1];
    card2 = [[PGCardsCard alloc] initWithRank:2 andSuit:3];
    XCTAssertTrue([card1 isHigherOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:9 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:9 andSuit:3];
    XCTAssertTrue([card1 isHigherOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:13 andSuit:2];
    card2 = [[PGCardsCard alloc] initWithRank:13 andSuit:1];
    XCTAssertTrue([card1 isHigherOrEqualRankThanCard:card2]);
}


//  Tests isHigherOrEqualRankThanCard evaluates false when rank is lower

- (void)testCardHigherOrEqualRankFalseLower
{
    PGCardsCard * card1 = [[PGCardsCard alloc] initWithRank:5 andSuit:0];
    PGCardsCard * card2 = [[PGCardsCard alloc] initWithRank:1 andSuit:1];
    XCTAssertFalse([card1 isHigherOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:8 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:14 andSuit:2];
    XCTAssertFalse([card1 isHigherOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:2 andSuit:1];
    card2 = [[PGCardsCard alloc] initWithRank:4 andSuit:3];
    XCTAssertFalse([card1 isHigherOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:7 andSuit:0];
    card2 = [[PGCardsCard alloc] initWithRank:9 andSuit:3];
    XCTAssertFalse([card1 isHigherOrEqualRankThanCard:card2]);
    
    card1 = [[PGCardsCard alloc] initWithRank:6 andSuit:2];
    card2 = [[PGCardsCard alloc] initWithRank:12 andSuit:1];
    XCTAssertFalse([card1 isHigherOrEqualRankThanCard:card2]);
}

@end
