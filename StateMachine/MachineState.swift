


enum MachineState {
    
    case PlacePhoneCall //can go to StartOfCall or NotHome
    
    case NotHome //you can leave a custom message; after that, you go to WaitForCallback
    case WaitForCallback //at some random point in the future, you go to StartOfCall
    case StartOfCall //now you have to ask if the callee would like to share a meal
    
    case DoesNotWantToShareAMeal //now you have to ask if the callee wants to enjoy a hot beverage
    case WantsToShareAMeal //negotiate a time and start the friendship
    case WantsToEnjoyAHotBeverage //go enjoy a beverage and start the friendship
    
    case DoesNotWantToEnjoyAHotBeverage //ask the callee for their interests
    
    case ProposedInterest(interest: Interest) //if you share the given interest, go for it; otherwise, ask for another interest
    
    case PartakeInInterest(interest: Interest) //partake in the interest and start the friendship
    
    case StartOfFriendship //Final state - you are done!
    
}


enum Interest : Equatable{
    case Climbing
}
