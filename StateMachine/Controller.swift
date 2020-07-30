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
  
}
