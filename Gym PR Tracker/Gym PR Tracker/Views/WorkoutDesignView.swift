import SwiftUI

struct WorkoutDesignView: View {
    @State private var workoutName: String = ""
    @State private var workoutType: Set<String> = []
    @State private var reps: String = ""
    @EnvironmentObject var workoutDataModel: WorkoutDataModel
    @State private var typeError: Bool = false
    @State private var nameError: Bool = false
    @State private var repError: Bool = false
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        ZStack{
            Image("blackbackground")
                .resizable()
                .ignoresSafeArea()
            VStack{
                ZStack{
                    Rectangle()
                        .frame(width: ((UIScreen.main.bounds.width))-15, height: 40.0)
                        .cornerRadius(15)
                        .foregroundStyle(.orange)
                        
                    Text("Workout Creation")
                        .foregroundStyle(.white)
                        .font(.title)
                }
                
                TypeOfWorkout(selectedOptions: $workoutType)
                Spacer()
                NameOfWorkouts(nameOfWorkout: $workoutName)
                Spacer()
                MaxNumberOfReps(numberOfReps: $reps)
                Spacer()
                VStack{
                    if typeError {
                        Text("Select the type of workout")
                            .foregroundStyle(.red)
                    }
                    if nameError {
                        Text("Enter the name of the workout")
                            .foregroundStyle(.red)
                    }
                    if repError {
                        Text("Enter the number for your workout")
                            .foregroundStyle(.red)
                    }
                }
                
                Button(action: {
                    if workoutType.isEmpty {
                        typeError = true
                    } else {
                        typeError = false
                    }
                    
                    if workoutName.isEmpty {
                        nameError = true
                    } else {
                        nameError = false
                    }
                    
                    if reps.isEmpty {
                        repError = true
                    } else {
                        repError = false
                    }
                    
                    if !typeError && !nameError && !repError {
                        addWorkout()
                        // Navigate back to the previous view
                        presentationMode.wrappedValue.dismiss()
                    }
                }, label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 80, height: 50)
                            .cornerRadius(15)
                       
                        Text("Done")
                            .foregroundStyle(.white)
                    }
                })
                
            }
        }
    }

    private func addWorkout() {
        let newIndex = (workoutDataModel.workoutData.max(by: { $0.index < $1.index })?.index ?? -1) + 1
        let newWorkout = Workout(exercise: workoutName, typeOfWorkout: workoutType, number: reps, index: newIndex)
        workoutDataModel.workoutData.append(newWorkout)
    }
}

#Preview {
    WorkoutDesignView().environmentObject(WorkoutDataModel())
}
