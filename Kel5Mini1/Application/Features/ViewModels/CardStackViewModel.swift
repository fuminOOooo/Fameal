//
//  CardStack View Model.swift
//  FamealPrompt
//
//  Created by Elvis Susanto on 04/05/23.
//

import Foundation
import Combine

class CardStackViewModel : ObservableObject {
    init() {
        // Randomize the order of cards
        cards.shuffle()
    }
    
    @Published var cards: [OneCard] = [
        OneCard(title: "What family member do you wish to have a closer relationship with, and why?"),
        OneCard(title: "I am proud to be a part of this family because ___"),
        OneCard(title: "Explain one thing you are proud of for each of your family members!"),
        OneCard(title: "Have you ever felt like home is not where you belong? Give examples.."),
        OneCard(title: "What is your dream for this family that has not yet been achieved?"),
        OneCard(title: "What expectations do you have for each family member? Answer honestly!"),
        OneCard(title: "Tell each other about a most memorable moment with your family that you would like to relive!"),
        OneCard(title: "If you could be born again, would you want to be an only child, first-born, middle child, or youngest, and why?"),
        OneCard(title: "What is your favorite family tradition for celebrating big holidays?"),
        OneCard(title: "Have you ever felt egoistic enough to apologize to a family member even though you knew you were wrong?"),
        OneCard(title: "What does family mean to each of you?"),
        OneCard(title: "If this is your last chance to meet your family, what do you want to say to them?"),
        OneCard(title: "What is your favorite childhood memory?"),
        OneCard(title: "What is the best piece of advice you've received from a family member?"),
        OneCard(title: "What is one thing you admire about each family member?"),
        OneCard(title: "What is your funniest family vacation memory?"),
        OneCard(title: "If you could have a family reunion anywhere in the world, where would it be?"),
        OneCard(title: "What is the most memorable meal you've shared as a family?"),
        OneCard(title: "What is your favorite family activity to do together?"),
        OneCard(title: "What is the most valuable lesson you've learned from a family member?"),
        OneCard(title: "Who is the most adventurous family member? Share a memorable adventure they had."),
        OneCard(title: "Who is the most organized family member? How do they keep everything in order?"),
        OneCard(title: "What is your favorite family movie or TV show that you all enjoy watching together?"),
        OneCard(title: "Share a special tradition that your family has for birthdays or special occasions."),
        OneCard(title: "Who in your family is the best cook or baker? What is their specialty?"),
        OneCard(title: "What is the most memorable road trip or vacation your family has taken?"),
        OneCard(title: "If your family had a mascot, what would it be and why?"),
        OneCard(title: "What is the most memorable gift you've received from a family member?")
    ]
}
