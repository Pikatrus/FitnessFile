import SwiftUI

struct MainView: View {
    @EnvironmentObject var workoutDataModel: WorkoutDataModel
    @State private var currentPage = 0
    private let itemsPerPage = 10
    
    private var pages: [[Workout]] {
        workoutDataModel.workoutData.chunked(into: itemsPerPage)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("blackbackground")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Headboard(rank: "Low Class Saiyan", rankImage: "gokuBase-removebg-preview")
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 15.0)
                        .cornerRadius(15)
                    
                    Spacer()
                    
                    TabView(selection: $currentPage) {
                        ForEach(pages.indices, id: \.self) { pageIndex in
                            VStack { // Add VStack to handle alignment
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                                    ForEach(pages[pageIndex]) { workout in
                                        WorkoutBoxDisplay(workout: workout)
                                    }
                                }
                                .padding(.top, 16) // Add some padding to top if needed
                                .frame(maxHeight: .infinity, alignment: .top) // Ensure content aligns at top
                                
                                Spacer() // Pushes grid content to top
                            }
                            .tag(pageIndex) // Tag each page with its index
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .frame(maxHeight: .infinity) // Ensure the TabView takes full available height
                    
                    Spacer()
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 15.0)
                        .cornerRadius(15)
                    
                    smallButtons()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(WorkoutDataModel())
    }
}
