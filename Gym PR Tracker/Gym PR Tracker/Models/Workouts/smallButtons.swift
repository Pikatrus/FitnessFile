//
//  smallButtons.swift
//  Gym PR Tracker
//
//  Created by Jafar Abdulkader on 8/5/24.
//

import SwiftUI

struct smallButtons: View {
    //@State var numberOfPages : Int
    @State var numberOfPages = 1
    
    var body: some View {
        HStack{
            Spacer()
            /*ZStack{
                Circle()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundColor(.white)
                Text("1")
            }
            ZStack{
                Circle()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundColor(.white)
                    .padding(5)
                Text("2")
            }
            ZStack{
                Circle()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundColor(.white)
                    .padding(5)
                Text("...")
            }
            ZStack{
                Circle()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundColor(.white)
                    .padding(5)
                Text(String(numberOfPages))
            }
             */
            Spacer()
            /*ZStack{
                Circle()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundColor(.white)
                    .padding(5)
                Image(systemName: "plus")
            }
             */
            
            NavigationLink(destination: WorkoutDesignView()) {
                    ZStack{
                        Circle()
                            .frame(width: 30.0, height: 30.0)
                            .foregroundColor(.white)
                            .padding(5)
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                }
            }
            
           /*
            ZStack{
                Circle()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundColor(.white)

                Image(systemName: "arrow.up.arrow.down")
            }
            */
            
            
        }
        //.padding(.trailing, 50.0)
    }
}



#Preview {
    //smallButtons(numberOfPages: 0)
    smallButtons()
}
