//
//  TypeOfWorkout.swift
//  Gym PR Tracker
//
//  Created by Jafar Abdulkader on 8/5/24.
//

import SwiftUI

struct MaxNumberOfReps: View {
    @Binding var numberOfReps : String
    var body: some View {
        /*ZStack{
            Image("blackbackground")
                .resizable()
                .ignoresSafeArea()
         */
            
            VStack(alignment: .leading, spacing: 16) {
                ZStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width), height: 30.0)
                        .cornerRadius(15)
                        .foregroundStyle(.orange)
                        
                    Text("Max Number of Reps, Weight, or Distance?")
                        .font(.headline) // Font style for the prompt
                        .foregroundColor(.white) // Color for the text
                }
                .padding(.bottom,-15)
                        TextField("e.g., 50 lbs", text: $numberOfReps)
                            .padding()
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .background(Color(red: 53 / 255.0, green: 57 / 255.0, blue: 53 / 255.0))
                            .minimumScaleFactor(0.25)
                            .background(Color(.systemGray6)) // Light gray background for the TextField
                            .cornerRadius(8) // Rounded corners
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1) // Border color and thickness
                            )
                
                            .padding(.bottom, 16) // Space below the TextField
                        
                    }
        //}
    }
}

#Preview {
    MaxNumberOfReps(numberOfReps: .constant(""))
}
