//
//  ExerciseView.swift
//  HiroFit
//
//  Created by Paul Kratsios on 7/17/22.
//

import SwiftUI
import DispatchIntrospection

struct StartExerciseView: View {
    var reps = 0
    let units = ["lbs","kgs"]
    @Binding var rootIsActive : Bool
    @State private var weight = 15
    @State private var unit = "lbs"
    @State private var repGoal = 1
    @State private var isShowingExerciseView = false
    @FocusState private var weightIsFocused: Bool
    var exercise: Exercise
    var workout: Workout
//    init(exercise: Exercise) {
//        self.rootIsActive = rootIsActive
//        self.exercise = exercise
//        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .title1), size: 30) ]
//    }
    
    var body: some View {
        VStack {
//            Text("Enter Weight")
//                .font(.largeTitle)
//                .padding()
            Form {
                Section(header: Text("Enter Weight")) {
                    HStack {
                        Spacer()
                        
                        Picker("Reps", selection: $weight) {
                            ForEach(0..<10001) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
        //                .compositingGroup()

                        Picker("Unit", selection: $unit) {
                            ForEach(units, id: \.self) { unit in
                                Text(unit)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
        //                .compositingGroup()
                        
                        Spacer()
                        
                    }
//                    .frame(width: UIScreen.main.bounds.width-50)
//                    .clipped()
                }
                .font(.headline)

                Section(header: Text("Enter Reps")) {
                    Picker("Reps", selection: $repGoal) {
                        ForEach(0..<501) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: UIScreen.main.bounds.width/6 * 5)
                    .clipped()
        //            .compositingGroup()
                    
                }
                .font(.headline)
            }
            NavigationLink {
                ExerciseView(rootIsActive: self.$rootIsActive, exercise: self.exercise, workout: self.workout)
            } label: {
                Text("Begin Exercise")
                    .foregroundColor(Color(UIColor.systemBackground))
                    .frame(width: 200)
                    .padding()
                    .background(Color("Logo"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }//.simultaneousGesture(TapGesture().onEnded{
//                workout.exercises.append(exercise)
//            })
        }
        .navigationBarTitle(exercise.name, displayMode: .inline)
        
//        .navigationBarHidden(true)
    }
}

extension  UITextField {
   @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
      self.resignFirstResponder()
   }
}
//
//struct StartExerciseView_Previews: PreviewProvider {
//    static var previews: some View {
//        StartExerciseView(exercise: Exercise(type: "arms", name: "Bicep Curl", JTM: "Elbow"))
//    }
//}
