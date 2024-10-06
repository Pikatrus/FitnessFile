//
//  headboard.swift
//  Gym PR Tracker
//
//  Created by Jafar Abdulkader on 8/5/24.
//

import SwiftUI

struct Headboard: View {
    @State var rank : String
    @State var rankImage : String
    
    var body: some View {
            
            Image("FitnessFile(smaller)")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    struct Headboard_Previews: PreviewProvider {
        static var previews: some View {
            Headboard(rank: "Low Class Warrior", rankImage: "gokuBase-removebg-preview")
        }
    }
    
}
