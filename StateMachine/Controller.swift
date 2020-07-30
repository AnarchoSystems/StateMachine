//
//  Controller.swift
//  StateMachine
//
//  Created by Markus Pfeifer on 30.07.20.
//  Copyright © 2020 Markus Pfeifer. All rights reserved.
//

import Foundation
import SwiftUI


class Controller : ObservableObject {
  
 @Published var publicState : MachineState! //to be written later
  
  private var state : MachineState!{
   didSet{
     let newValue = state
     DispatchQueue.main.async{
       self.publicState = newValue
       }
     }
  }
    
    
    init(){
        
        self.state = .PlacePhoneCall(proceed: self.start)
        
    }
    
  
}


fileprivate extension Controller {
    
    func start(){
        
        let callAnswered = Bool.random()
        
        self.state = callAnswered ?
            .StartOfCall(askShareAMeal: askShareAMeal) :
            .NotHome(leaveMessage: leaveMessage)
        
    }
    
    
    func leaveMessage(_ message: String){
        
        let annoyedFactor = Double(message.split(separator: " ").count)
        
        let range = (annoyedFactor/3)...annoyedFactor
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .random(in: range)) {
            self.state = .StartOfCall(askShareAMeal: self.askShareAMeal)
        }
        
    }
    
    func askShareAMeal(){
        
        let wantsToShareMeal = Bool.random()
        
        self.state = wantsToShareMeal ?
            .WantsToShareAMeal(dineTogether: dineTogether) :
        .DoesNotWantToShareAMeal(askEnjoyBeverage: askEnjoyBeverage)
        
    }
    
    
    func askEnjoyBeverage(){
        
    }
    
    
    func dineTogether(){
        
    }
    
    
    func enjoyBeverageTogether(){
        
    }
    
    
    func askForInterests(){
        
    }
    
    
    func agreeToInterest(){
        
    }
    
    
    func askForAnotherInterest(){
        
    }
    
    
    func partakeInCurrentInterest(){
        
    }
    
}
