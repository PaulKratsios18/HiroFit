//
//  StartWorkoutView.swift
//  HiroFit
//
//  Created by Paul Kratsios on 7/17/22.
//

import SwiftUI

struct Correction {
    var name: String
}

class Workout : ObservableObject {
    @Published var exercises: [Exercise] = []
    let startTime = Date.now
    var endTime = Date.now
    var totalReps = 0
    var totalWeightLifted = 0
    
//    mutating func setEndTime() {
//        endTime = Date.now
//    }
//    mutating func addExercise(exercise: Exercise) {
//        exercises.append(exercise)
//    }
}


func fireTimer() {
    print("Timer fired!")
}

struct StartWorkoutView: View {
    @State var isActive : Bool = false
//    let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .title1), size: 30) ]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Spacer()
                HStack(spacing: 0) {
                    Text("Hiro")
                        .font(.largeTitle)
                        .foregroundColor(Color("LogoOpposite"))
                    +
                    Text("Fit")
                        .font(.largeTitle)
                        .foregroundColor(Color(UIColor.systemBackground))
                }.colorInvert()
                
                NavigationLink (
                    destination: ExercisesView(rootIsActive: self.$isActive, workout: Workout()),
                    isActive: self.$isActive
                ) {
                    Text("Start Workout")
                        .foregroundColor(Color(UIColor.systemBackground))
                        .frame(width: 200)
                        .padding()
                        .background(Color("Logo"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                    .isDetailLink(false)

                Spacer()
                Spacer()
            }
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarHidden(true)
        }
        .accentColor(Color("Logo"))
    }
}



struct StartWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        StartWorkoutView()
    }
}
