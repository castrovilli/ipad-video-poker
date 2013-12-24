//
//  PGCardsHandTests.m
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGCardsHand.h"

@interface PGCardsHandTests : XCTestCase

@end

@implementation PGCardsHandTests

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

- (void)testDrawAndDiscard
{
    PGCardsDeck * deck = [[PGCardsDeck alloc] init];
    PGCardsHand * hand = [[PGCardsHand alloc] init];
    
    XCTAssertEqual(hand.size, 0U);
    
    [hand drawCards:5 fromDeck:deck];
    
    XCTAssertEqual(hand.size, 5U);
    XCTAssertEqual(deck.size, 47U);
    
    [hand discardAllCardsToDeck:deck];
    
    XCTAssertEqual(hand.size, 0U);
    XCTAssertEqual(deck.size, 47U);
    XCTAssertEqual(deck.discardPileSize, 5U);
    
}

- (void)testCardIndexAtPosition
{
    PGCardsDeck * deck = [[PGCardsDeck alloc] init];
    PGCardsHand * hand = [[PGCardsHand alloc] init];
    
    [hand drawCards:5 fromDeck:deck];
    XCTAssertEqual([hand cardIndexAtPosition:1], 0);
    XCTAssertEqual([hand cardIndexAtPosition:2], 1);
    XCTAssertEqual([hand cardIndexAtPosition:3], 2);
    XCTAssertEqual([hand cardIndexAtPosition:4], 3);
    XCTAssertEqual([hand cardIndexAtPosition:5], 4);
}

- (void)testCardRankAtPosition
{
    PGCardsDeck * deck = [[PGCardsDeck alloc] init];
    PGCardsHand * hand = [[PGCardsHand alloc] init];
    
    [hand drawCards:5 fromDeck:deck];
    XCTAssertEqual([hand cardRankAtPosition:1], 14);
    XCTAssertEqual([hand cardRankAtPosition:2], 2);
    XCTAssertEqual([hand cardRankAtPosition:3], 3);
    XCTAssertEqual([hand cardRankAtPosition:4], 4);
    XCTAssertEqual([hand cardRankAtPosition:5], 5);
}

- (void)testCardSuitAtPosition
{
    PGCardsDeck * deck = [[PGCardsDeck alloc] init];
    PGCardsHand * hand = [[PGCardsHand alloc] init];
    
    [deck drawTopCards:11];
    [hand drawCards:5 fromDeck:deck];
    XCTAssertEqual([hand cardSuitAtPosition:1], 0);
    XCTAssertEqual([hand cardSuitAtPosition:2], 0);
    XCTAssertEqual([hand cardSuitAtPosition:3], 1);
    XCTAssertEqual([hand cardSuitAtPosition:4], 1);
    XCTAssertEqual([hand cardSuitAtPosition:5], 1);
}

- (void)testCardExchange
{
    PGCardsDeck * deck = [[PGCardsDeck alloc] init];
    PGCardsHand * hand = [[PGCardsHand alloc] init];
    [hand drawCards:5 fromDeck:deck];
    
    [hand replaceCardAtPosition:2 fromDeck:deck];
    [hand replaceCardAtPosition:4 fromDeck:deck];
    
    XCTAssertEqual([hand cardIndexAtPosition:1], 0);
    XCTAssertEqual([hand cardIndexAtPosition:2], 5);
    XCTAssertEqual([hand cardIndexAtPosition:3], 2);
    XCTAssertEqual([hand cardIndexAtPosition:4], 6);
    XCTAssertEqual([hand cardIndexAtPosition:5], 4);
    
    XCTAssertEqual(hand.size, 5U);
    XCTAssertEqual(deck.size, 45U);
    XCTAssertEqual(deck.discardPileSize, 2U);
}


- (void)testAddCardsFromArray
{
    PGCardsHand * hand = [PGCardsHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AC", @"2H", @"3S", @"9D", @"TC", @"JH", @"QS", @"KD"]];
    XCTAssertEqual([hand cardIndexAtPosition:1], 0);
    XCTAssertEqual([hand cardIndexAtPosition:2], 14);
    XCTAssertEqual([hand cardIndexAtPosition:3], 28);
    XCTAssertEqual([hand cardIndexAtPosition:4], 47);
    XCTAssertEqual([hand cardIndexAtPosition:5], 9);
    XCTAssertEqual([hand cardIndexAtPosition:6], 23);
    XCTAssertEqual([hand cardIndexAtPosition:7], 37);
    XCTAssertEqual([hand cardIndexAtPosition:8], 51);
 
}

@end
