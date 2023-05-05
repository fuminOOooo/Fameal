//
//  CardStack View Model.swift
//  FamealPrompt
//
//  Created by Elvis Susanto on 04/05/23.
//

import Foundation
import Combine

class CardStackViewModel : ObservableObject {
    
    @Published var cards: [OneCard] = [
        OneCard(title: "What family member do you wish to have a closer relationship with, and why?"),
        OneCard(title: "I am proud to be a part of this family because ___"),
        OneCard(title: "Explain one thing you are proud of for each of your family members!"),
        OneCard(title: "Have you ever felt like home is not where you belong? Give examples.."),
        OneCard(title: "What is your dream for this family that has not yet been achieved?"),
        OneCard(title: "What expectations do you have for each family member? Answer honestly!"),
        OneCard(title: "Tell each other about a most memorable moment with your family that you would like to relive!"),
        OneCard(title: "Have you ever felt like your parents loved your sibling more than you? Please share your story.."),
        OneCard(title: "If you could be born again, would you want to be an only child, first-born, middle child, or youngest, and why?"),
        OneCard(title: "What is your favorite family tradition for celebrating big holidays?"),
        OneCard(title: "Have you ever felt egoistic enough to apologize to a family member even though you knew you were wrong?"),
        OneCard(title: "What does family mean to each of you?"),
        OneCard(title: "If this is your last chance to meet your family, what do you want to say to them?")
    ]
}
