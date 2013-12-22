//
//  PGCardsDeckTests.m
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGCardsDeck.h"

@interface PGCardsDeckTests : XCTestCase

@end

@implementation PGCardsDeckTests

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

- (void)testInitNotNil
{
    PGCardsDeck * deck = [[PGCardsDeck alloc] init];
    XCTAssertNotNil(deck);
}

-(void)testInitialSize
{
    PGCardsDeck * deck = [[PGCardsDeck alloc] init];
    XCTAssertEqual(deck.size, 52U);
}

-(void)testDrawTopCard
{
    //  Test first three drawn cards, testing index and remaining deck size
    
    PGCardsDeck * deck = [[PGCardsDeck alloc] init];
    PGCardsCard * card = [deck drawTopCard];
    XCTAssertEqual(deck.size, 51U);
    XCTAssertEqual(card.index, 0);
    
    card = [deck drawTopCard];
    XCTAssertEqual(deck.size, 50U);
    XCTAssertEqual(card.index, 1);
    
    card = [deck drawTopCard];
    XCTAssertEqual(deck.size, 49U);
    XCTAssertEqual(card.index, 2);
    
    
    //  Draw all remaining cards and test index and remaining deck size after last one
    
    for ( int i = 0; i < 49; ++i ) {
        card = [deck drawTopCard];
    }
    XCTAssertEqual(deck.size, 0U);
    XCTAssertEqual(card.index, 51);
    
    
    //  Test that a further attempt to draw returns nil
    
    card = [deck drawTopCard];
    XCTAssertNil(card);
}

- (void)testDrawTopCards
{
    PGCardsDeck * deck = [[PGCardsDeck alloc] init];
    NSMutableArray * drawnCards = [deck drawTopCards:5];
    XCTAssertEqual([drawnCards count], 5U);
    XCTAssertEqual(deck.size, 47U);
    XCTAssertEqual(((PGCardsCard *)drawnCards[0]).index, 0);
    XCTAssertEqual(((PGCardsCard *)drawnCards[1]).index, 1);
    XCTAssertEqual(((PGCardsCard *)drawnCards[2]).index, 2);
    XCTAssertEqual(((PGCardsCard *)drawnCards[3]).index, 3);
    XCTAssertEqual(((PGCardsCard *)drawnCards[4]).index, 4);
    
    drawnCards = [deck drawTopCards:3];
    XCTAssertEqual([drawnCards count], 3U);
    XCTAssertEqual(deck.size, 44U);
    XCTAssertEqual(((PGCardsCard *)drawnCards[0]).index, 5);
    XCTAssertEqual(((PGCardsCard *)drawnCards[1]).index, 6);
    XCTAssertEqual(((PGCardsCard *)drawnCards[2]).index, 7);
    
}

- (void)testDiscardCard
{
    PGCardsDeck * deck = [[PGCardsDeck alloc] init];
    PGCardsCard * card = [deck drawTopCard];

    [deck addCardToDiscards:card];
    XCTAssertEqual(deck.size, 51U);
    XCTAssertEqual(deck.discardPileSize, 1U);

    [deck replaceDiscards];
    XCTAssertEqual(deck.size, 52U);
    XCTAssertEqual(deck.discardPileSize, 0U);
}

- (void)testDiscardCards
{
    PGCardsDeck * deck = [[PGCardsDeck alloc] init];
    NSMutableArray * drawnCards = [deck drawTopCards:5];
    
    [deck addCardsToDiscards:drawnCards];
    XCTAssertEqual(deck.size, 47U);
    XCTAssertEqual(deck.discardPileSize, 5U);
    XCTAssertEqual([drawnCards count], 0U);
    
    [deck replaceDiscards];
    XCTAssertEqual(deck.size, 52U);
    XCTAssertEqual(deck.discardPileSize, 0U);
}

@end
