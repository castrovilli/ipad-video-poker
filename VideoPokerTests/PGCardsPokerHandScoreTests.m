//
//  PGCardsPokerHandScoreTests.m
//  VideoPoker
//
//  Created by Paul Griffiths on 12/23/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGCardsPokerHand.h"

@interface PGCardsPokerHandScoreTests : XCTestCase

@end

@implementation PGCardsPokerHandScoreTests

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


//  Overall score tests. Tests:
//    - Basic evaluation of the ten different hand types
//    - Comparisons between different hand types, testing the truth & falsity of beatsHand:,
//      the truth & falsity of losesToHand:, and the falsity of equalsHand:. The truth of
//      equalsHand: is tested numerous times in other unit tests within this class. Outside
//      of this test, only beatsHand: and equalsHand: will be used.

- (void)testOverall
{
    PGCardsPokerHand * handRoyalFlush = [PGCardsPokerHand new];
    PGCardsPokerHand * handStraightFlush = [PGCardsPokerHand new];
    PGCardsPokerHand * handFour = [PGCardsPokerHand new];
    PGCardsPokerHand * handFullHouse = [PGCardsPokerHand new];
    PGCardsPokerHand * handFlush = [PGCardsPokerHand new];
    PGCardsPokerHand * handStraight = [PGCardsPokerHand new];
    PGCardsPokerHand * handThree = [PGCardsPokerHand new];
    PGCardsPokerHand * handTwoPair = [PGCardsPokerHand new];
    PGCardsPokerHand * handPair = [PGCardsPokerHand new];
    PGCardsPokerHand * handHighCard = [PGCardsPokerHand new];
    
    [handRoyalFlush addCardsFromArrayOfShortNames:@[@"AC", @"KC", @"QC", @"JC", @"TC"]];
    [handStraightFlush addCardsFromArrayOfShortNames:@[@"KH", @"QH", @"JH", @"TH", @"9H"]];
    [handFour addCardsFromArrayOfShortNames:@[@"AC", @"AH", @"AS", @"AD", @"KC"]];
    [handFullHouse addCardsFromArrayOfShortNames:@[@"AC", @"AS", @"AH", @"KD", @"KS"]];
    [handFlush addCardsFromArrayOfShortNames:@[@"AC", @"KC", @"QC", @"JC", @"9C"]];
    [handStraight addCardsFromArrayOfShortNames:@[@"AC", @"2H", @"3S", @"4D", @"5C"]];
    [handThree addCardsFromArrayOfShortNames:@[@"AC", @"AH", @"AD", @"KS", @"QH"]];
    [handTwoPair addCardsFromArrayOfShortNames:@[@"AC", @"AH", @"KS", @"KD", @"QS"]];
    [handPair addCardsFromArrayOfShortNames:@[@"AC", @"AD", @"KH", @"QS", @"JC"]];
    [handHighCard addCardsFromArrayOfShortNames:@[@"AC", @"KH", @"QS", @"JD", @"9C"]];
    
    [handRoyalFlush evaluate];
    [handStraightFlush evaluate];
    [handFour evaluate];
    [handFullHouse evaluate];
    [handFlush evaluate];
    [handStraight evaluate];
    [handThree evaluate];
    [handTwoPair evaluate];
    [handPair evaluate];
    [handHighCard evaluate];
    
    XCTAssertEqual(handRoyalFlush.handInfo.pokerHandType, POKERHAND_ROYALFLUSH);
    XCTAssertEqual(handStraightFlush.handInfo.pokerHandType, POKERHAND_STRAIGHTFLUSH);
    XCTAssertEqual(handFour.handInfo.pokerHandType, POKERHAND_FOUR);
    XCTAssertEqual(handFullHouse.handInfo.pokerHandType, POKERHAND_FULLHOUSE);
    XCTAssertEqual(handFlush.handInfo.pokerHandType, POKERHAND_FLUSH);
    XCTAssertEqual(handStraight.handInfo.pokerHandType, POKERHAND_STRAIGHT);
    XCTAssertEqual(handThree.handInfo.pokerHandType, POKERHAND_THREE);
    XCTAssertEqual(handTwoPair.handInfo.pokerHandType, POKERHAND_TWOPAIR);
    XCTAssertEqual(handPair.handInfo.pokerHandType, POKERHAND_PAIR);
    XCTAssertEqual(handHighCard.handInfo.pokerHandType, POKERHAND_HIGHCARD);
    
    XCTAssertEqual(handRoyalFlush.handInfo.videoPokerHandType, VIDEOPOKERHAND_ROYALFLUSH);
    XCTAssertEqual(handStraightFlush.handInfo.videoPokerHandType, VIDEOPOKERHAND_STRAIGHTFLUSH);
    XCTAssertEqual(handFour.handInfo.videoPokerHandType, VIDEOPOKERHAND_FOUR);
    XCTAssertEqual(handFullHouse.handInfo.videoPokerHandType, VIDEOPOKERHAND_FULLHOUSE);
    XCTAssertEqual(handFlush.handInfo.videoPokerHandType, VIDEOPOKERHAND_FLUSH);
    XCTAssertEqual(handStraight.handInfo.videoPokerHandType, VIDEOPOKERHAND_STRAIGHT);
    XCTAssertEqual(handThree.handInfo.videoPokerHandType, VIDEOPOKERHAND_THREE);
    XCTAssertEqual(handTwoPair.handInfo.videoPokerHandType, VIDEOPOKERHAND_TWOPAIR);
    XCTAssertEqual(handPair.handInfo.videoPokerHandType, VIDEOPOKERHAND_JACKSORBETTER);
    XCTAssertEqual(handHighCard.handInfo.videoPokerHandType, VIDEOPOKERHAND_NOWIN);
    
    XCTAssertTrue([handRoyalFlush beatsHand:handStraightFlush]);
    XCTAssertFalse([handStraightFlush beatsHand:handRoyalFlush]);
    XCTAssertFalse([handRoyalFlush equalsHand:handStraightFlush]);
    XCTAssertFalse([handRoyalFlush losesToHand:handStraightFlush]);
    XCTAssertTrue([handStraightFlush losesToHand:handRoyalFlush]);
    
    XCTAssertTrue([handStraightFlush beatsHand:handFour]);
    XCTAssertFalse([handFour beatsHand:handStraightFlush]);
    XCTAssertFalse([handStraightFlush equalsHand:handFour]);
    XCTAssertFalse([handStraightFlush losesToHand:handFour]);
    XCTAssertTrue([handFour losesToHand:handStraightFlush]);
    
    XCTAssertTrue([handFour beatsHand:handFullHouse]);
    XCTAssertFalse([handFullHouse beatsHand:handFour]);
    XCTAssertFalse([handFour equalsHand:handFullHouse]);
    XCTAssertFalse([handFour losesToHand:handFullHouse]);
    XCTAssertTrue([handFullHouse losesToHand:handFour]);
    
    XCTAssertTrue([handFullHouse beatsHand:handFlush]);
    XCTAssertFalse([handFlush beatsHand:handFullHouse]);
    XCTAssertFalse([handFullHouse equalsHand:handFlush]);
    XCTAssertFalse([handFullHouse losesToHand:handFlush]);
    XCTAssertTrue([handFlush losesToHand:handFullHouse]);
    
    XCTAssertTrue([handFlush beatsHand:handStraight]);
    XCTAssertFalse([handStraight beatsHand:handFlush]);
    XCTAssertFalse([handFlush equalsHand:handStraight]);
    XCTAssertFalse([handFlush losesToHand:handStraight]);
    XCTAssertTrue([handStraight losesToHand:handFlush]);
    
    XCTAssertTrue([handStraight beatsHand:handThree]);
    XCTAssertFalse([handThree beatsHand:handStraight]);
    XCTAssertFalse([handStraight equalsHand:handThree]);
    XCTAssertFalse([handStraight losesToHand:handThree]);
    XCTAssertTrue([handThree losesToHand:handStraight]);
    
    XCTAssertTrue([handThree beatsHand:handTwoPair]);
    XCTAssertFalse([handTwoPair beatsHand:handThree]);
    XCTAssertFalse([handThree equalsHand:handTwoPair]);
    XCTAssertFalse([handThree losesToHand:handTwoPair]);
    XCTAssertTrue([handTwoPair losesToHand:handThree]);
    
    XCTAssertTrue([handTwoPair beatsHand:handPair]);
    XCTAssertFalse([handPair beatsHand:handTwoPair]);
    XCTAssertFalse([handTwoPair equalsHand:handPair]);
    XCTAssertFalse([handTwoPair losesToHand:handPair]);
    XCTAssertTrue([handPair losesToHand:handTwoPair]);
    
    XCTAssertTrue([handPair beatsHand:handHighCard]);
    XCTAssertFalse([handHighCard beatsHand:handPair]);
    XCTAssertFalse([handPair equalsHand:handHighCard]);
    XCTAssertFalse([handPair losesToHand:handHighCard]);
    XCTAssertTrue([handHighCard losesToHand:handPair]);
}


//  Tests high card poker hands. The hand with the highest ranked card should win. If the two
//  highest cards are equal in rank, compare the two second-highest cards, then the two third-highest
//  cards, and so on. If both hands consist of the same five ranks, the hands are equal.

- (void)testHighCard {
    PGCardsPokerHand * handAceHighSixNext = [PGCardsPokerHand new];
    PGCardsPokerHand * handAceHighTenNext = [PGCardsPokerHand new];
    PGCardsPokerHand * handTenHigh = [PGCardsPokerHand new];
    PGCardsPokerHand * handTenHighAlt = [PGCardsPokerHand new];
    PGCardsPokerHand * handSevenHigh = [PGCardsPokerHand new];
    
    [handAceHighSixNext addCardsFromArrayOfShortNames:@[@"AC", @"6H", @"4S", @"3D", @"2C"]];
    [handAceHighTenNext addCardsFromArrayOfShortNames:@[@"AC", @"TH", @"4S", @"3D", @"2C"]];
    [handTenHigh addCardsFromArrayOfShortNames:@[@"TH", @"6S", @"4D", @"3C", @"2H"]];
    [handTenHighAlt addCardsFromArrayOfShortNames:@[@"TD", @"6C", @"4H", @"3S", @"2D"]];
    [handSevenHigh addCardsFromArrayOfShortNames:@[@"7S", @"6D", @"4C", @"3H", @"2S"]];
    
    [handAceHighSixNext evaluate];
    [handAceHighTenNext evaluate];
    [handTenHigh evaluate];
    [handTenHighAlt evaluate];
    [handSevenHigh evaluate];

    XCTAssertEqual(handAceHighTenNext.handInfo.pokerHandType, POKERHAND_HIGHCARD);
    XCTAssertEqual(handAceHighSixNext.handInfo.pokerHandType, POKERHAND_HIGHCARD);
    XCTAssertEqual(handTenHigh.handInfo.pokerHandType, POKERHAND_HIGHCARD);
    XCTAssertEqual(handTenHighAlt.handInfo.pokerHandType, POKERHAND_HIGHCARD);
    XCTAssertEqual(handSevenHigh.handInfo.pokerHandType, POKERHAND_HIGHCARD);
    
    XCTAssertTrue([handAceHighTenNext beatsHand:handAceHighSixNext]);
    XCTAssertTrue([handAceHighTenNext beatsHand:handTenHigh]);
    XCTAssertTrue([handAceHighSixNext beatsHand:handTenHigh]);
    XCTAssertTrue([handTenHigh beatsHand:handSevenHigh]);
    XCTAssertTrue([handTenHigh equalsHand:handTenHighAlt]);
}


//  Tests pair poker hands. The hand with the higher pair wins. If the pairs are of equal rank,
//  then the value of the highest card in the remaining three decides. If those cards of are equal
//  rank, then the value of the highest card in the remaining two decides, and so on.

- (void)testPair {
    PGCardsPokerHand * handPairJackAceTenThree = [PGCardsPokerHand new];
    PGCardsPokerHand * handPairJackKingTenThree = [PGCardsPokerHand new];
    PGCardsPokerHand * handPairJackKingNineThree = [PGCardsPokerHand new];
    PGCardsPokerHand * handPairJackKingNineThreeAlt = [PGCardsPokerHand new];
    PGCardsPokerHand * handPairJackKingNineTwo = [PGCardsPokerHand new];
    PGCardsPokerHand * handPairSevenAceJackFour = [PGCardsPokerHand new];
    
    [handPairJackAceTenThree addCardsFromArrayOfShortNames:@[@"JC", @"JH", @"AS", @"TD", @"3C"]];
    [handPairJackKingTenThree addCardsFromArrayOfShortNames:@[@"JH", @"JS", @"KD", @"TC", @"3H"]];
    [handPairJackKingNineThree addCardsFromArrayOfShortNames:@[@"JS", @"JD", @"KC", @"9H", @"3S"]];
    [handPairJackKingNineThreeAlt addCardsFromArrayOfShortNames:@[@"JD", @"JC", @"KH", @"9S", @"3D"]];
    [handPairJackKingNineTwo addCardsFromArrayOfShortNames:@[@"JH", @"JD", @"KS", @"9C", @"2S"]];
    [handPairSevenAceJackFour addCardsFromArrayOfShortNames:@[@"7S", @"7H", @"AC", @"JH", @"4D"]];
    
    [handPairJackAceTenThree evaluate];
    [handPairJackKingTenThree evaluate];
    [handPairJackKingNineThree evaluate];
    [handPairJackKingNineThreeAlt evaluate];
    [handPairJackKingNineTwo evaluate];
    [handPairSevenAceJackFour evaluate];
    
    XCTAssertEqual(handPairJackKingTenThree.handInfo.pokerHandType, POKERHAND_PAIR);
    XCTAssertEqual(handPairJackAceTenThree.handInfo.pokerHandType, POKERHAND_PAIR);
    XCTAssertEqual(handPairJackKingNineThree.handInfo.pokerHandType, POKERHAND_PAIR);
    XCTAssertEqual(handPairJackKingNineThreeAlt.handInfo.pokerHandType, POKERHAND_PAIR);
    XCTAssertEqual(handPairJackKingNineTwo.handInfo.pokerHandType, POKERHAND_PAIR);
    XCTAssertEqual(handPairSevenAceJackFour.handInfo.pokerHandType, POKERHAND_PAIR);

    XCTAssertEqual(handPairJackKingNineTwo.handInfo.videoPokerHandType, VIDEOPOKERHAND_JACKSORBETTER);
    XCTAssertEqual(handPairSevenAceJackFour.handInfo.videoPokerHandType, VIDEOPOKERHAND_NOWIN);

    XCTAssertTrue([handPairJackAceTenThree beatsHand:handPairJackKingTenThree]);
    XCTAssertTrue([handPairJackAceTenThree beatsHand:handPairJackKingNineThree]);
    XCTAssertTrue([handPairJackAceTenThree beatsHand:handPairJackKingNineTwo]);
    XCTAssertTrue([handPairJackAceTenThree beatsHand:handPairSevenAceJackFour]);
    
    XCTAssertTrue([handPairJackKingTenThree beatsHand:handPairJackKingNineThree]);
    XCTAssertTrue([handPairJackKingTenThree beatsHand:handPairJackKingNineTwo]);
    XCTAssertTrue([handPairJackKingTenThree beatsHand:handPairSevenAceJackFour]);
    
    XCTAssertTrue([handPairJackKingNineThree beatsHand:handPairJackKingNineTwo]);
    XCTAssertTrue([handPairJackKingNineThree beatsHand:handPairSevenAceJackFour]);

    XCTAssertTrue([handPairJackKingNineTwo beatsHand:handPairSevenAceJackFour]);

    XCTAssertTrue([handPairJackKingNineThree equalsHand:handPairJackKingNineThreeAlt]);
}


//  Tests two pair poker hands. The hand with the highest pair wins. If the highest pairs are of,
//  equal rank, then the value of the second highest pair decides. If both pairs are of equal
//  rank, then the value of the odd card decides. If the odd cards are also of equal rank, then
//  the hands are equal.

- (void)testTwoPair {
    PGCardsPokerHand * handQueenFourKing = [PGCardsPokerHand new];
    PGCardsPokerHand * handQueenFourTwo = [PGCardsPokerHand new];
    PGCardsPokerHand * handTenSixKing = [PGCardsPokerHand new];
    PGCardsPokerHand * handTenSixKingAlt = [PGCardsPokerHand new];
    PGCardsPokerHand * handTenSixTwo = [PGCardsPokerHand new];
    PGCardsPokerHand * handQueenThreeTwo = [PGCardsPokerHand new];
    
    [handQueenFourKing addCardsFromArrayOfShortNames:@[@"QC", @"QH", @"4S", @"4D", @"KC"]];
    [handQueenFourTwo addCardsFromArrayOfShortNames:@[@"QH", @"QS", @"4D", @"4C", @"2H"]];
    [handTenSixKing addCardsFromArrayOfShortNames:@[@"TS", @"TD", @"6C", @"6H", @"KS"]];
    [handTenSixKingAlt addCardsFromArrayOfShortNames:@[@"TH", @"TC", @"6S", @"6D", @"KD"]];
    [handTenSixTwo addCardsFromArrayOfShortNames:@[@"TH", @"TD", @"6S", @"6C", @"2S"]];
    [handQueenThreeTwo addCardsFromArrayOfShortNames:@[@"QS", @"QH", @"3C", @"3H", @"2D"]];
    
    [handQueenFourKing evaluate];
    [handQueenFourTwo evaluate];
    [handTenSixKing evaluate];
    [handTenSixKingAlt evaluate];
    [handTenSixTwo evaluate];
    [handQueenThreeTwo evaluate];
    
    XCTAssertEqual(handQueenFourTwo.handInfo.pokerHandType, POKERHAND_TWOPAIR);
    XCTAssertEqual(handQueenFourKing.handInfo.pokerHandType, POKERHAND_TWOPAIR);
    XCTAssertEqual(handTenSixKing.handInfo.pokerHandType, POKERHAND_TWOPAIR);
    XCTAssertEqual(handTenSixKingAlt.handInfo.pokerHandType, POKERHAND_TWOPAIR);
    XCTAssertEqual(handTenSixTwo.handInfo.pokerHandType, POKERHAND_TWOPAIR);
    XCTAssertEqual(handQueenThreeTwo.handInfo.pokerHandType, POKERHAND_TWOPAIR);
    
    XCTAssertTrue([handQueenFourKing beatsHand:handQueenFourTwo]);
    XCTAssertTrue([handQueenFourKing beatsHand:handTenSixKing]);
    XCTAssertTrue([handQueenFourKing beatsHand:handTenSixTwo]);
    XCTAssertTrue([handQueenFourKing beatsHand:handQueenThreeTwo]);
    
    XCTAssertTrue([handQueenFourTwo beatsHand:handTenSixKing]);
    XCTAssertTrue([handQueenFourTwo beatsHand:handTenSixTwo]);
    XCTAssertTrue([handQueenFourTwo beatsHand:handQueenThreeTwo]);
    
    XCTAssertTrue([handTenSixKing beatsHand:handTenSixTwo]);
    
    XCTAssertTrue([handTenSixKing equalsHand:handTenSixKingAlt]);
}


//  Tests three-of-a-kind poker hands. The higher of the two threes-of-a-kind wins. If the ranks
//  are equal, the rank of the next highest card decides, and then the final card.

- (void)testThree {
    PGCardsPokerHand * handEightNineSix = [PGCardsPokerHand new];
    PGCardsPokerHand * handEightNineFive = [PGCardsPokerHand new];
    PGCardsPokerHand * handSevenNineSix = [PGCardsPokerHand new];
    PGCardsPokerHand * handSevenNineSixAlt = [PGCardsPokerHand new];
    PGCardsPokerHand * handSevenTenSix = [PGCardsPokerHand new];
    
    [handEightNineSix addCardsFromArrayOfShortNames:@[@"8C", @"8H", @"8S", @"9D", @"6C"]];
    [handEightNineFive addCardsFromArrayOfShortNames:@[@"8H", @"8S", @"8D", @"9C", @"5H"]];
    [handSevenNineSix addCardsFromArrayOfShortNames:@[@"7S", @"7D", @"7C", @"9H", @"6S"]];
    [handSevenNineSixAlt addCardsFromArrayOfShortNames:@[@"7D", @"7C", @"7H", @"9S", @"6D"]];
    [handSevenTenSix addCardsFromArrayOfShortNames:@[@"7H", @"7D", @"7S", @"TD", @"6S"]];
    
    [handEightNineSix evaluate];
    [handEightNineFive evaluate];
    [handSevenNineSix evaluate];
    [handSevenNineSixAlt evaluate];
    [handSevenTenSix evaluate];
    
    XCTAssertEqual(handEightNineFive.handInfo.pokerHandType, POKERHAND_THREE);
    XCTAssertEqual(handEightNineSix.handInfo.pokerHandType, POKERHAND_THREE);
    XCTAssertEqual(handSevenNineSix.handInfo.pokerHandType, POKERHAND_THREE);
    XCTAssertEqual(handSevenNineSixAlt.handInfo.pokerHandType, POKERHAND_THREE);
    XCTAssertEqual(handSevenTenSix.handInfo.pokerHandType, POKERHAND_THREE);
    
    XCTAssertTrue([handEightNineSix beatsHand:handEightNineFive]);
    XCTAssertTrue([handEightNineSix beatsHand:handSevenNineSix]);
    XCTAssertTrue([handEightNineSix beatsHand:handSevenTenSix]);
    
    XCTAssertTrue([handEightNineFive beatsHand:handSevenNineSix]);
    XCTAssertTrue([handEightNineFive beatsHand:handSevenTenSix]);
    
    XCTAssertTrue([handSevenTenSix beatsHand:handSevenNineSix]);
    
    XCTAssertTrue([handSevenNineSix equalsHand:handSevenNineSixAlt]);
}


//  Tests straight poker hands. The hand with the highest card wins. Uniquely among all
//  the poker hands, ace is treated as a low card in a A-2-3-4-5 straight. If the high
//  card in the two hands are the same, then because of the nature of a straight we know
//  that all the other cards will match in rank also, so the hands are equal.

- (void)testStraight {
    PGCardsPokerHand * handAceHigh = [PGCardsPokerHand new];
    PGCardsPokerHand * handNineHigh = [PGCardsPokerHand new];
    PGCardsPokerHand * handNineHighAlt = [PGCardsPokerHand new];
    PGCardsPokerHand * handFiveHigh = [PGCardsPokerHand new];
    
    [handAceHigh addCardsFromArrayOfShortNames:@[@"AC", @"KH", @"QS", @"JD", @"TC"]];
    [handNineHigh addCardsFromArrayOfShortNames:@[@"9H", @"8S", @"7D", @"6C", @"5H"]];
    [handNineHighAlt addCardsFromArrayOfShortNames:@[@"9S", @"8D", @"7C", @"6H", @"5S"]];
    [handFiveHigh addCardsFromArrayOfShortNames:@[@"5D", @"4C", @"3H", @"2S", @"AD"]];
    
    [handAceHigh evaluate];
    [handNineHigh evaluate];
    [handNineHighAlt evaluate];
    [handFiveHigh evaluate];

    XCTAssertEqual(handAceHigh.handInfo.pokerHandType, POKERHAND_STRAIGHT);
    XCTAssertEqual(handNineHigh.handInfo.pokerHandType, POKERHAND_STRAIGHT);
    XCTAssertEqual(handNineHighAlt.handInfo.pokerHandType, POKERHAND_STRAIGHT);
    XCTAssertEqual(handFiveHigh.handInfo.pokerHandType, POKERHAND_STRAIGHT);

    XCTAssertTrue([handAceHigh beatsHand:handNineHigh]);
    XCTAssertTrue([handNineHigh beatsHand:handFiveHigh]);
    XCTAssertTrue([handNineHighAlt equalsHand:handNineHigh]);
}


//  Tests flush poker hands. The hand with the highest card wins, in an identical way to
//  high card hands previously explained.

- (void)testFlush {
    PGCardsPokerHand * handAceHighSixNext = [PGCardsPokerHand new];
    PGCardsPokerHand * handAceHighTenNext = [PGCardsPokerHand new];
    PGCardsPokerHand * handTenHigh = [PGCardsPokerHand new];
    PGCardsPokerHand * handTenHighAlt = [PGCardsPokerHand new];
    PGCardsPokerHand * handSevenHigh = [PGCardsPokerHand new];
    
    [handAceHighSixNext addCardsFromArrayOfShortNames:@[@"AC", @"6C", @"4C", @"3C", @"2C"]];
    [handAceHighTenNext addCardsFromArrayOfShortNames:@[@"AH", @"TH", @"4H", @"3H", @"2H"]];
    [handTenHigh addCardsFromArrayOfShortNames:@[@"TS", @"6S", @"4S", @"3S", @"2S"]];
    [handTenHighAlt addCardsFromArrayOfShortNames:@[@"TD", @"6D", @"4D", @"3D", @"2D"]];
    [handSevenHigh addCardsFromArrayOfShortNames:@[@"7C", @"6C", @"4C", @"3C", @"2C"]];
    
    [handAceHighSixNext evaluate];
    [handAceHighTenNext evaluate];
    [handTenHigh evaluate];
    [handTenHighAlt evaluate];
    [handSevenHigh evaluate];

    XCTAssertEqual(handAceHighSixNext.handInfo.pokerHandType, POKERHAND_FLUSH);
    XCTAssertEqual(handAceHighTenNext.handInfo.pokerHandType, POKERHAND_FLUSH);
    XCTAssertEqual(handTenHigh.handInfo.pokerHandType, POKERHAND_FLUSH);
    XCTAssertEqual(handTenHighAlt.handInfo.pokerHandType, POKERHAND_FLUSH);
    XCTAssertEqual(handSevenHigh.handInfo.pokerHandType, POKERHAND_FLUSH);

    XCTAssertTrue([handAceHighTenNext beatsHand:handAceHighSixNext]);
    XCTAssertTrue([handAceHighTenNext beatsHand:handTenHigh]);
    XCTAssertTrue([handAceHighSixNext beatsHand:handTenHigh]);
    XCTAssertTrue([handTenHigh beatsHand:handSevenHigh]);
    XCTAssertTrue([handTenHigh equalsHand:handTenHighAlt]);
}


//  Tests full house poker hands. The hand with the higher three-of-a-kind wins. If the two
//  threes-of-a-kind are of equal rank (in practice, this is only possible if more than one
//  deck is in use, or if there are wild cards) then the hand with the higher pair wins. If
//  the pairs are also of equal rank, then the hands are tied.

- (void)testFullHouse {
    PGCardsPokerHand * handHouseNineQueen = [PGCardsPokerHand new];
    PGCardsPokerHand * handHouseNineFour = [PGCardsPokerHand new];
    PGCardsPokerHand * handHouseSixQueen = [PGCardsPokerHand new];
    PGCardsPokerHand * handHouseSixFour = [PGCardsPokerHand new];
    PGCardsPokerHand * handHouseSixFourAlt = [PGCardsPokerHand new];
    
    [handHouseNineQueen addCardsFromArrayOfShortNames:@[@"9C", @"9H", @"9S", @"QD", @"QC"]];
    [handHouseNineFour addCardsFromArrayOfShortNames:@[@"9H", @"9S", @"9D", @"4C", @"4H"]];
    [handHouseSixQueen addCardsFromArrayOfShortNames:@[@"6S", @"6D", @"6C", @"QH", @"QS"]];
    [handHouseSixFour addCardsFromArrayOfShortNames:@[@"6D", @"6C", @"6H", @"4S", @"4D"]];
    [handHouseSixFourAlt addCardsFromArrayOfShortNames:@[@"6C", @"6H", @"6S", @"4D", @"4C"]];
    
    [handHouseNineQueen evaluate];
    [handHouseNineFour evaluate];
    [handHouseSixQueen evaluate];
    [handHouseSixFour evaluate];
    [handHouseSixFourAlt evaluate];
    
    XCTAssertEqual(handHouseNineQueen.handInfo.pokerHandType, POKERHAND_FULLHOUSE);
    XCTAssertEqual(handHouseNineFour.handInfo.pokerHandType, POKERHAND_FULLHOUSE);
    XCTAssertEqual(handHouseSixQueen.handInfo.pokerHandType, POKERHAND_FULLHOUSE);
    XCTAssertEqual(handHouseSixFour.handInfo.pokerHandType, POKERHAND_FULLHOUSE);
    XCTAssertEqual(handHouseSixFourAlt.handInfo.pokerHandType, POKERHAND_FULLHOUSE);
    
    XCTAssertTrue([handHouseNineQueen beatsHand:handHouseNineFour]);
    XCTAssertTrue([handHouseNineQueen beatsHand:handHouseSixQueen]);
    XCTAssertTrue([handHouseNineQueen beatsHand:handHouseSixFour]);
    XCTAssertTrue([handHouseNineFour beatsHand:handHouseSixQueen]);
    XCTAssertTrue([handHouseNineFour beatsHand:handHouseSixFour]);
    XCTAssertTrue([handHouseSixQueen beatsHand:handHouseSixFour]);
    XCTAssertTrue([handHouseSixFour equalsHand:handHouseSixFourAlt]);
}


//  Tests four-of-a-kind poker hands. The hand with the highest four-of-a-kind wins. If the two
//  fours-of-a-kind are equal (again, only possible in practice with multiple decks or wildcards)
//  then the highest odd card wins. If the odd cards are also equal in rank, the hands are equal.

- (void)testFour {
    PGCardsPokerHand * handFourTenKingHigh = [PGCardsPokerHand new];
    PGCardsPokerHand * handFourTenThreeHigh = [PGCardsPokerHand new];
    PGCardsPokerHand * handFourFiveKingHigh = [PGCardsPokerHand new];
    PGCardsPokerHand * handFourFiveThreeHigh = [PGCardsPokerHand new];
    PGCardsPokerHand * handFourFiveThreeHighAlt = [PGCardsPokerHand new];
    
    [handFourTenKingHigh addCardsFromArrayOfShortNames:@[@"TC", @"TH", @"TS", @"TD", @"KC"]];
    [handFourTenThreeHigh addCardsFromArrayOfShortNames:@[@"TC", @"TH", @"TS", @"TD", @"3H"]];
    [handFourFiveKingHigh addCardsFromArrayOfShortNames:@[@"5C", @"5H", @"5S", @"5D", @"KS"]];
    [handFourFiveThreeHigh addCardsFromArrayOfShortNames:@[@"5C", @"5H", @"5S", @"5D", @"3D"]];
    [handFourFiveThreeHighAlt addCardsFromArrayOfShortNames:@[@"5C", @"5H", @"5S", @"5D", @"3C"]];
    
    [handFourTenKingHigh evaluate];
    [handFourTenThreeHigh evaluate];
    [handFourFiveKingHigh evaluate];
    [handFourFiveThreeHigh evaluate];
    [handFourFiveThreeHighAlt evaluate];
    
    XCTAssertEqual(handFourTenKingHigh.handInfo.pokerHandType, POKERHAND_FOUR);
    XCTAssertEqual(handFourTenThreeHigh.handInfo.pokerHandType, POKERHAND_FOUR);
    XCTAssertEqual(handFourFiveKingHigh.handInfo.pokerHandType, POKERHAND_FOUR);
    XCTAssertEqual(handFourFiveThreeHigh.handInfo.pokerHandType, POKERHAND_FOUR);
    XCTAssertEqual(handFourFiveThreeHighAlt.handInfo.pokerHandType, POKERHAND_FOUR);
    
    XCTAssertTrue([handFourTenKingHigh beatsHand:handFourTenThreeHigh]);
    XCTAssertTrue([handFourTenKingHigh beatsHand:handFourFiveKingHigh]);
    XCTAssertTrue([handFourTenKingHigh beatsHand:handFourFiveThreeHigh]);
    XCTAssertTrue([handFourTenThreeHigh beatsHand:handFourFiveKingHigh]);
    XCTAssertTrue([handFourTenThreeHigh beatsHand:handFourFiveThreeHigh]);
    XCTAssertTrue([handFourFiveKingHigh beatsHand:handFourFiveThreeHigh]);
    XCTAssertTrue([handFourFiveThreeHigh equalsHand:handFourFiveThreeHighAlt]);
}


//  Tests straight flush poker hands. The logic is identical to testing straights.

- (void)testStraightFlush {
    PGCardsPokerHand * handKingHigh = [PGCardsPokerHand new];
    PGCardsPokerHand * handNineHigh = [PGCardsPokerHand new];
    PGCardsPokerHand * handNineHighAlt = [PGCardsPokerHand new];
    PGCardsPokerHand * handFiveHigh = [PGCardsPokerHand new];
    
    [handKingHigh addCardsFromArrayOfShortNames:@[@"KH", @"QH", @"JH", @"TH", @"9H"]];
    [handNineHigh addCardsFromArrayOfShortNames:@[@"9S", @"8S", @"7S", @"6S", @"5S"]];
    [handNineHighAlt addCardsFromArrayOfShortNames:@[@"9D", @"8D", @"7D", @"6D", @"5D"]];
    [handFiveHigh addCardsFromArrayOfShortNames:@[@"5C", @"4C", @"3C", @"2C", @"AC"]];
    
    [handKingHigh evaluate];
    [handNineHigh evaluate];
    [handNineHighAlt evaluate];
    [handFiveHigh evaluate];

    XCTAssertEqual(handKingHigh.handInfo.pokerHandType, POKERHAND_STRAIGHTFLUSH);
    XCTAssertEqual(handNineHigh.handInfo.pokerHandType, POKERHAND_STRAIGHTFLUSH);
    XCTAssertEqual(handNineHighAlt.handInfo.pokerHandType, POKERHAND_STRAIGHTFLUSH);
    XCTAssertEqual(handFiveHigh.handInfo.pokerHandType, POKERHAND_STRAIGHTFLUSH);
    
    XCTAssertTrue([handKingHigh beatsHand:handNineHigh]);
    XCTAssertTrue([handNineHigh beatsHand:handFiveHigh]);
    XCTAssertTrue([handNineHighAlt equalsHand:handNineHigh]);
}


//  Tests royal flush poker hands. Royal flushes are always equal with each other.

- (void)testRoyalFlush {
    PGCardsPokerHand * handHearts = [PGCardsPokerHand new];
    PGCardsPokerHand * handSpades = [PGCardsPokerHand new];
    
    [handHearts addCardsFromArrayOfShortNames:@[@"AH", @"KH", @"QH", @"JH", @"TH"]];
    [handSpades addCardsFromArrayOfShortNames:@[@"AS", @"KS", @"QS", @"JS", @"TS"]];
    
    [handHearts evaluate];
    [handSpades evaluate];
    
    XCTAssertEqual(handHearts.handInfo.pokerHandType, POKERHAND_ROYALFLUSH);
    XCTAssertEqual(handSpades.handInfo.pokerHandType, POKERHAND_ROYALFLUSH);
    
    XCTAssertTrue([handHearts equalsHand:handSpades]);
}


@end
