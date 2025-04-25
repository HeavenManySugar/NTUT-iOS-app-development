//
//  RandomCard.swift
//  midterm
//
//  Created by 張睿恩 on 2025/4/24.
//

import UIKit

class randomCard {
    let cardList: [String] = ["AceOfCups","AceOfPentacles","AceOfSwords","AceOfWands","Death","EightOfCups","EightOfPentacles","EightOfSwords","EightOfWands","FiveOfCups","FiveOfPentacles","FiveOfSwords","FiveOfWands","FourOfCups","FourOfPentacles","FourOfSwords","FourOfWands","Judgement","Justice","KingOfCups","KingOfPentacles","KingOfSwords","KingOfWands","KnightOfCups","KnightOfPentacles","KnightOfSwords","KnightOfWands","NineOfCups","NineOfPentacles","NineOfSwords","NineOfWands","PageOfCups","PageOfPentacles","PageOfSwords","PageOfWands","QueenOfCups","QueenOfPentacles","QueenOfSwords","QueenOfWands","SevenOfCups","SevenOfPentacles","SevenOfSwords","SevenOfWands","SixOfCups","SixOfPentacles","SixOfSwords","SixOfWands","Strength","Temperance","TenOfCups","TenOfPentacles","TenOfSwords","TenOfWands","TheChariot","TheDevil","TheEmperor","TheEmpress","TheFool","TheHangedMan","TheHermit","TheHierophant","TheHighPriestess","TheLovers","TheMagician","TheMoon","TheStar","TheSun","TheTower","TheWorld","ThreeOfCups","ThreeOfPentacles","ThreeOfSwords","ThreeOfWands","TwoOfCups","TwoOfPentacles","TwoOfSwords","TwoOfWands","WheelOfFortune"]
    lazy var currentCardList: [String] = cardList
    
//    init(cardImages: [UIImageView]) ->
    
    func getRandomCard() -> Card {
        let randomIndex = Int.random(in: 0..<currentCardList.count)
        let currentCard = currentCardList[randomIndex]
        currentCardList.remove(at: randomIndex)
        return Card(name:currentCard, reversed:Bool.random())
    }
        
    func reset() {
        currentCardList = cardList
    }
}
