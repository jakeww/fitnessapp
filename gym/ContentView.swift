//
//  ContentView.swift
//  gym
//
//  Created by Jake Watembach on 3/12/23.
//



import SwiftUI

struct ContentView: View {
    
    @AppStorage("isFirstTime") var isFirstTime = true
    
    @State private var gender: String = ""
    @State private var heightFeet: Int = 0
    @State private var heightInches: Int = 0
    @State private var weight: String = ""
    @State private var fitnessGoal: String = ""
    @State private var fitnessLevel: String = ""
    
    let genders = ["Man", "Woman", "Other"]
    let fitnessGoals = ["Bulk up", "Get toned", "Lose weight"]
    let fitnessLevels = ["Beginner", "Intermediate", "Advanced"]
    
    var body: some View {
        if isFirstTime {
            VStack {
                Text("Welcome to My Fitness App!")
                    .font(.largeTitle)
                    .padding()
                
                Text("Please answer the following questions:")
                    .font(.headline)
                    .padding()
                
                Picker("Gender", selection: $gender) {
                    ForEach(genders, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                                    Text("Height:")
                                        .font(.headline)
                                    HStack {
                                        Picker("Feet", selection: $heightFeet) {
                                            ForEach(0..<10) { feet in
                                                Text("\(feet) ft")
                                            }
                                        }
                                        .frame(width: 100)
                                        
                                        Picker("Inches", selection: $heightInches) {
                                            ForEach(0..<12) { inches in
                                                Text("\(inches) in")
                                            }
                                        }
                                        .frame(width: 100)
                                    }
                                }
                                .padding()
                
                HStack {
                    Text("Weight (lbs): ")
                    TextField("Enter your weight", text: $weight)
                        .keyboardType(.numberPad)
                }
                .padding()
                
                Picker("Fitness Goal", selection: $fitnessGoal) {
                    ForEach(fitnessGoals, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Picker("Fitness Level", selection: $fitnessLevel) {
                    ForEach(fitnessLevels, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Button(action: {
                    saveUserPreferences()
                    isFirstTime = false
                }) {
                    Text("Save Preferences")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
        } else {
            Text("Welcome back to My Fitness App!")
                .font(.largeTitle)
                .padding()
            
            //for testing use only
            Button(action: {
                isFirstTime = true
            }) {
                Text("Reset First Time")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding()

            
            // Display saved user preferences here
        }
    }
    
    func saveUserPreferences() {
        // Save user preferences using UserDefaults or another persistence method
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

