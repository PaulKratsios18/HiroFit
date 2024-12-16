//
//  ExerciseView.swift
//  HiroFit
//
//  Created by Paul Kratsios on 7/17/22.
//

import SwiftUI

struct ExerciseView: View {
    @Binding var rootIsActive : Bool
    let exercise: Exercise
    @State private var standFurtherAway = false
    var workout: Workout
//    init(rootIsActive: Bool ,exercise: Exercise) {
//        self.rootIsActive = rootIsActive
//        self.exercise = exercise
//        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .title1), size: 30) ]
//    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("AI TRAINER WITH CAMERA")
                .padding()
            Spacer()
            if standFurtherAway {
                Text("Stand Further Away From the Camera.")
            } else {
                VStack {
                    HStack {
                        Text(exercise.name)
                        Spacer()
                        Text("Time")
                    }
                    HStack {
                        Spacer()
                        VStack {
                            Text("0")
                                .font(.largeTitle)
                            Text("Reps/Sec")
                        }
                        
                        Spacer()
                        Divider()
                        Spacer()
                        VStack {
                            Text("0")
                            .font(.largeTitle)
                            Text("Reps")
                        }
                        Spacer()
                    }
                        .frame(height: UIScreen.main.bounds.height/8)
                }
                .padding()
//                .border(RoundedRectangle(cornerRadius: 20))
                .frame(width: UIScreen.main.bounds.width-50, height:  UIScreen.main.bounds.height/4)
                .background(.secondary)
                
            }
        }
        .navigationBarTitle(exercise.name, displayMode: .inline)
        .toolbar {
            NavigationLink {
                ExercisesView(rootIsActive: self.$rootIsActive, workout: self.workout)
            } label: {
                Text("Finish Exercise")
                    .foregroundColor(Color("Logo"))
            }
            .isDetailLink(false)
        }
//        .navigationBarHidden(true)
    }
}

//struct ExerciseView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseView(rootIsActive: false, exercise: Exercise(type: "Arms", name: "Bicep Curls (right)", JTM: "Right Elbow"))
//    }
//}
