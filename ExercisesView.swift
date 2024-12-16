//
//  ExercisesView.swift
//  HiroFit
//
//  Created by Paul Kratsios on 7/17/22.
//

import SwiftUI

extension AnyTransition {
    static var slideBack: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading)
        )
    }
}


struct Exercise {
    let id = UUID()
    let type: String
    let name: String
    let JTM: String
//    var startTime: Date
//    var endTime: Date
//    var duration: DateInterval
//    var reps: Int
//    var weight: Int
}

struct ExercisesView: View {
    
    var exercises = [
        Exercise(type: "Arms", name: "Bicep Curls (Right)", JTM: "Right Elbow"),
        Exercise(type: "Arms", name: "Bicep Curls (Left)", JTM: "Left Elbow"),
        Exercise(type: "Arms", name: "Bicep Curls", JTM: "Elbows (& relative)"),
        Exercise(type: "Arms", name: "Tricep press", JTM: "Elbows (& relative)"),
        Exercise(type: "Arms", name: "Dips", JTM: "Elbows"),
        Exercise(type: "Arms", name: "Overhead/Shoulder Press", JTM: "Shoulders (& relative), Elbows (& relative)"),
        Exercise(type: "Arms", name: "Lateral raises (Delts)", JTM: "Shoulders (& relative)"),
        Exercise(type: "Chest", name: "Cable crossovers (Pecs)", JTM: "Shoulder (& relative, & 3D)"),
        Exercise(type: "Chest", name: "Bench press (& variants)", JTM: "Shoulders (& relative), Elbows (& relative)"),
        Exercise(type: "Chest", name: "Fly (Dumbbell)", JTM: "Shoulders (& relative), Elbows (& relative)"),
        Exercise(type: "Chest", name: "Push ups", JTM: "Shoulders (& relative), Elbows (& relative), Hips (static)"),
        Exercise(type: "Back", name: "Pulldowns", JTM: "Shoulders, Elbows"),
        Exercise(type: "Back", name: "Pull Ups", JTM: "Shoulders, Elbows"),
        Exercise(type: "Back", name: "Reverse Push Ups", JTM: "Shoulders, Elbows, Hips (static)"),
        Exercise(type: "Back", name: "Bent-Over Rows (Bar)", JTM: "Shoulders (& relative), Elbows (& relative), Hips (static)"),
        Exercise(type: "Back", name: "Bent-Over Rows (Right)", JTM: "Shoulder (Right), Elbow (Right), Hips (static)"),
        Exercise(type: "Back", name: "Bent-Over Rows (Left)", JTM: "Shoulder (Left), Elbow (Left), Hips (static)"),
        Exercise(type: "Back", name: "Reverse cable crossovers (Traps)", JTM: "Shoulders (& 3D)"),
        Exercise(type: "Back", name: "(Upright) Rows", JTM: "Shoulders (& relative), Elbows (& relative)"),
        Exercise(type: "Back", name: "Back extension", JTM: "Hips"),
        Exercise(type: "Compound", name: "Squats", JTM: "Hips, Knees, Ankles, Shoulders (& relative (twisting))"),
        Exercise(type: "Compound", name: "Squat with bench", JTM: "Hips, Knees, Ankles, Shoulders (& relative (twisting))"),
        Exercise(type: "Compound", name: "Deadlift", JTM: "Hips, Knees, Ankles, Shoulders (& relative (twisting))"),
        Exercise(type: "Compound", name: "Romanian deadlift (RDL)", JTM: "Hips, Knees"),
        Exercise(type: "Compound", name: "Snatch (kettlebell)", JTM: "Hips, Knees, Shoulders"),
        Exercise(type: "Legs", name: "Lunge", JTM: "Hips, Knees (separate)"),
        Exercise(type: "Legs", name: "Leg press", JTM: "Hips, Knees"),
        Exercise(type: "Legs", name: "Calf raises", JTM: "Ankles"),
        Exercise(type: "Legs", name: "Glute extensions", JTM: "Hips"),
        Exercise(type: "Abs", name: "Sit ups", JTM: "Hips, Shoulders (Absolute Pts)"),
        Exercise(type: "Abs", name: "Crunches", JTM: "Hips, Shoulders (Absolute Pts)"),
        Exercise(type: "Abs", name: "Leg raises", JTM: "Hips"),
        Exercise(type: "Abs", name: "Russian twists", JTM: "Hips, Shoulders (Absolute Pts)")
    ]
    
    @State private var searchText = "".lowercased()
    @Binding var rootIsActive : Bool
    @State private var backButton = false
    var filterType = false
    var workout: Workout
//    var searchResults: [Exercise] {
//        if searchText.isEmpty {
//            return exercises
//        } else {
//            return exercises.filter { $0.name.contains(searchText) }
//        }
//    }
    
//    init(rootIsActive: Binding<Bool>) {
//        self.rootIsActive = $rootIsActive
//        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .title1), size: 30) ]
//    }
    
    var body: some View {
//        NavigationView {
            VStack {
                List {
                    Section(header: Text("Arms")) {
                        ForEach(exercises, id: \.id) { e in
                            if e.type.contains("Arms") {
                                if searchText.isEmpty ? true : e.name.lowercased().contains(searchText.lowercased()) {
                                    NavigationLink {
                                        StartExerciseView(rootIsActive: self.$rootIsActive, exercise: e, workout: self.workout)
                                    } label: {
                                        Text(e.name)
                                    }
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("Chest")) {
                        ForEach(exercises, id: \.id) { e in
                            if e.type.contains("Chest") {
                                if searchText.isEmpty ? true : e.name.lowercased().contains(searchText.lowercased()) {
                                    NavigationLink {
                                        StartExerciseView(rootIsActive: self.$rootIsActive, exercise: e, workout: self.workout)
                                    } label: {
                                        Text(e.name)
                                    }
                                }
                            }
                        }
                    }
                    Section(header: Text("Back")) {
                        ForEach(exercises, id: \.id) { e in
                            if e.type.contains("Back") {
                                if searchText.isEmpty ? true : e.name.lowercased().contains(searchText.lowercased()) {
                                    NavigationLink {
                                        StartExerciseView(rootIsActive: self.$rootIsActive, exercise: e, workout: self.workout)
                                    } label: {
                                        Text(e.name)
                                    }
                                }
                            }
                        }
                    }
                    Section(header: Text("Legs")) {
                        ForEach(exercises, id: \.id) { e in
                            if e.type.contains("Legs") {
                                if searchText.isEmpty ? true : e.name.lowercased().contains(searchText.lowercased()) {
                                    NavigationLink {
                                        StartExerciseView(rootIsActive: self.$rootIsActive, exercise: e, workout: self.workout)
                                    } label: {
                                        Text(e.name)
                                    }
                                }
                            }
                        }
                    }
                    Section(header: Text("Abs")) {
                        ForEach(exercises, id: \.id) { e in
                            if e.type.contains("Abs") {
                                if searchText.isEmpty ? true : e.name.lowercased().contains(searchText.lowercased()) {
                                    NavigationLink {
                                        StartExerciseView(rootIsActive: self.$rootIsActive, exercise: e, workout: self.workout)
                                    } label: {
                                        Text(e.name)
                                    }
                                }
                            }
                        }
                    }
                    Section(header: Text("Compound")) {
                        ForEach(exercises, id: \.id) { e in
                            if e.type.contains("Compound") {
                                if searchText.isEmpty ? true : e.name.lowercased().contains(searchText.lowercased()) {
                                    NavigationLink {
                                        StartExerciseView(rootIsActive: self.$rootIsActive, exercise: e, workout: self.workout)
                                    } label: {
                                        Text(e.name)
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle("Exercises", displayMode: .inline)
                .background(Color.secondary)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic ) )
        }
        .toolbar {
            NavigationLink(destination: WorkoutSummaryView(rootIsActive: self.$rootIsActive, workout: self.workout)) {//RateUsView(shouldPopToRootView: self.$rootIsActive, workout: self.workout)) {
                Text("Finish Workout")
                    .foregroundColor(Color("Logo"))
            }.isDetailLink(false)
            .simultaneousGesture(
                TapGesture().onEnded {
                    workout.endTime = Date.now
                }
            )
        }
//        .navigationTitle("Exercises")
    }
}

//struct ExercisesView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExercisesView(rootIsActive: false)
//    }
//}
