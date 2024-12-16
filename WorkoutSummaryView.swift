//
//  WorkoutSummaryView.swift
//  HiroFit
//
//  Created by Paul Kratsios on 7/21/22.
//

import SwiftUI

struct WorkoutSummaryView: View {
    @Binding var rootIsActive : Bool
    var workout: Workout
    
    var body: some View {
        Form {
            
            Section(header: Text("Workout Stats")) {
                Text("\(workout.startTime)")
                Text("\(workout.endTime)")
                
//                ForEach(0..<10) {
//                    Text("\($0)")
//                }
            }
            .font(.headline)
            
            Section(header: Text("Exercises Completed")) {
                ForEach(0..<10) {
                    Text("\($0)")
                }
            }
            .font(.headline)
        }
        .toolbar {
            NavigationLink(destination: RateUsView(shouldPopToRootView: self.$rootIsActive, workout: self.workout)) {
                Text("Done")
                    .foregroundColor(Color("Logo"))
            }
            .isDetailLink(false)
        }
    }
}

//struct WorkoutSummaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutSummaryView()//date: <#T##Date#>, time: <#T##Date#>, totalDuration: <#T##Int#>, totalReps: <#T##Int#>, weight: <#T##Int#>, form: <#T##Int#>)
//    }
//}

