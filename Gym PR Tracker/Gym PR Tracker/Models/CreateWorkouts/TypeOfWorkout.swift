//
//  TypeOfWorkout.swift
//  Gym PR Tracker
//
//  Created by Jafar Abdulkader on 8/5/24.
//

import SwiftUI


struct TypeOfWorkout: View {
    @Binding var selectedOptions: Set<String>
    
    let options = ["Chest", "Triceps", "Shoulders",
                   "Back", "Biceps","Forearms",
                   "Quads", "Hamstrings","Glutes","Calves",
                   "Core"]
    let columns = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
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
                    
                    Text("Type of Workout?")
                        .font(.headline) // Font style for the prompt
                        .foregroundColor(.white) // Color for the text
                }
                .padding(.bottom,-15)
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 270) // Adjust height as needed
                        .foregroundStyle(Color(red: 53 / 255.0, green: 57 / 255.0, blue: 53 / 255.0))
                        .cornerRadius(15)
                        .foregroundColor(Color(.systemGray6))
                        .shadow(radius: 15)
                        
                    
                    //ScrollView {
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(options, id: \.self) { option in
                            Button(action: {
                                // Action to be performed when the button is tapped
                                print("\(option) button tapped")
                                if !(selectedOptions.contains(option)){
                                    selectedOptions.insert(option)
                                }
                                else if selectedOptions.contains(option){
                                    selectedOptions.remove(option)
                                }
                            }) {
                                Text(option)
                                    .padding()
                                    //.background(.blue) // Dark blue background
                                    .background(selectedOptions.contains(option) ? Color.orange : Color.blue) // Change color based on selection
                                    .foregroundColor(.white) // Text color
                                    .cornerRadius(8)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    //}
                }
                
            }
            
        //}
    }
}

#Preview {
    TypeOfWorkout(selectedOptions: .constant([]))
}
