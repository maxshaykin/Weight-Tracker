//
//  Phone_AppApp.swift
//  Phone App
//
//  Created by William Liu on 5/25/24.
//
import SwiftUI
var foodList: [Food: Int] = [:]
var totalCalories = 0
var totalFat = 0
var totalCarbs = 0
var totalProtein = 0
let listOfFoods: [Food] = [
    Food(name: "Pizza Slice", calories: 254, fat: 9, protein: 11, carbs: 32),
    Food(name: "Burger", calories: 418, fat: 21, protein: 25, carbs: 30),
    Food(name: "Coca-Cola", calories: 155, fat: 0, protein: 0, carbs: 39),
    Food(name: "Salad", calories: 481, fat: 40, protein: 10, carbs: 23),
    Food(name: "Ice Cream", calories: 273, fat: 15, protein: 5, carbs: 31),
    Food(name: "Eggs", calories: 72, fat: 5, protein: 6, carbs: 1),
    Food(name: "Rice", calories: 205, fat: 1, protein: 4, carbs: 45),
    Food(name: "Beef", calories: 220, fat: 14, protein: 22, carbs: 0),
    Food(name: "Chicken", calories: 187, fat: 11, protein: 20, carbs: 0),
    Food(name: "Potatoes", calories: 161, fat: 1, protein: 4, carbs: 37),
    Food(name: "Apples", calories: 95, fat: 1, protein: 1, carbs: 25),
    Food(name: "Salmon", calories: 468, fat: 28, protein: 50, carbs: 0),
    Food(name: "Milk", calories: 122, fat: 5, protein: 8, carbs: 12),
    Food(name: "Yogurt", calories: 161, fat: 1, protein: 4, carbs: 37),
    Food(name: "Singular Bean", calories: 4, fat: 0, protein: 0, carbs: 1),
    Food(name: "Bean Burrito", calories: 385, fat: 11, protein: 14, carbs: 58),
    Food(name: "Can of beans", calories: 420, fat: 0, protein:28, carbs: 77),
    Food(name: "Banana", calories: 110, fat: 0, protein: 1, carbs: 28)
]
var maintenanceCalories: Int = 0
var bmi: Double = 0.0
var showTryAgain = 0
struct PlanView: View {
    @State private var selectedFood: Food?
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        Button(action: {
            resetTotals()
        }) {
            Text("Reset All Selections")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .font(.system(size: 20))
        }
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(listOfFoods) { food in
                    ForecastView(food: food) {
                        selectedFood = food
                        if (foodList[food] == nil) {
                            foodList[food] = 1;
                        }
                        else {
                            foodList[food]! += 1
                        }
                        updateTotals()
                    }
                }
            }
            .padding()
        }
    }
    
    private func updateTotals() {
        totalCalories = 0
        totalFat = 0
        totalCarbs = 0
        totalProtein = 0
        for (food, servings) in foodList {
            totalCalories += servings * food.calories
            totalFat += servings * food.fat
            totalCarbs += servings * food.carbs
            totalProtein += servings * food.protein
        }
        checkWarnings()
    }
    
    private func checkWarnings() {
        showTryAgain = 0
            if (totalCalories >= maintenanceCalories + 300 ||
                (totalCalories <= maintenanceCalories - 300 && totalCalories != 0) ||
                totalFat >= maintenanceCalories / 27 + 10 ||
                (totalFat <= maintenanceCalories / 27 - 10 && totalFat != 0) ||
                totalCarbs >= maintenanceCalories / 6 + 50 ||
                (totalCarbs <= maintenanceCalories / 6 - 50 && totalCarbs != 0)){
            showTryAgain = 1
        }
    }
    
    private func resetTotals()
    {
        totalCalories = 0
        totalFat = 0
        totalCarbs = 0
        totalProtein = 0
        foodList = [:]
        showTryAgain = 0
    }
}
struct Food: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let calories: Int
    let fat: Int
    let protein: Int
    let carbs: Int
}
struct ForecastView: View {
    let food: Food
    let onSelect: () -> Void
    var body: some View {
        VStack {
            Text("\(food.name):")
                .foregroundColor(Color.black)
            Text("Calories: \(food.calories)")
                .foregroundColor(Color.green)
            Text("Fat: \(food.fat)")
                .foregroundColor(Color.red)
            Text("Protein: \(food.protein)")
                .foregroundColor(Color.blue)
            Text("Carbs: \(food.carbs)")
                .foregroundColor(Color.orange)
            
            Button(action: onSelect) {
                Text("Select")
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 10)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
        .navigationBarTitle("Selection", displayMode: .inline)
    }
}

struct EnterInfoView: View {
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var age: String = ""
    @State private var thisMaintenanceCalories: Int = 0
    @State private var thisBmi: Double = 0.0
    var body: some View {
        VStack {
            Text("Enter Your Information")
                .font(.title)
                .padding()
            
            TextField("Weight(Ibs)", text: $weight)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Height(Inch)", text: $height)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            
            TextField("Age", text: $age)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            
            Button(action: {
                calculateBMI()
                calculateMaintenanceCalories()
                bmi = thisBmi
                maintenanceCalories = thisMaintenanceCalories
            }) {
                Text("Calculate BMI and Maintenance Calories")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            
            
            Text("BMI: \(String(format: "%.2f", thisBmi))")
            
            Text("Maintenance Calories: \(thisMaintenanceCalories)")
            
            if let numweight = Int(weight) {
                if (numweight >= 300){
                    Image("fatperson")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
            }

            
            Spacer()
        } .navigationBarTitle("Information", displayMode: .inline)
        .padding()
    }
    
    func calculateBMI() {
        guard let weightValue = Double(weight), let heightValue = Double(height) else {
            return
        }
        // BMI formula: weight (kg) / (height (m) * height (m))
        let weightKg = weightValue * 0.453592 // Convert lbs to kg
        let heightM = heightValue * 0.0254 // Convert inches to meters
        thisBmi = weightKg / (heightM * heightM)

    }
    func calculateMaintenanceCalories() {
        guard let weightValue = Double(weight),
              let heightValue = Double(height),
              let ageValue = Double(age) else {
            return
        }
       // let weightKg = weightValue * 0.453592 // Convert lbs to kg
        //let heightCm = heightValue * 2.54 // Convert inches to cm
        let maintenanceCaloriesValue = Int(10*weightValue + 6.25*heightValue - 5*ageValue + 5)
        thisMaintenanceCalories = maintenanceCaloriesValue
        
    }
}

struct InstructionsView: View {
    var body: some View {
        VStack {
            Text("Instructions")
                .font(.system(size: 45))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(Color("TitleColor"))
            ScrollView {
                Text("""
                    1. Enter your information.
                    2. Try out making your own plan.
                    3. View your plan and see what adjustments you should make.
                    4. Keep trying until you find what suits you best.
                    5. Learn about your body and how it works.
                    6. Take action and apply this to your life.
                    7. Build healthy habbits.
                    8. Ask for help if needed.
                    9. Stay motivated and reward yourself.
                    10. Keep a positive attitude and enjoy your journey!
                    """).font(.system(size: 26))
                    .padding()
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle("Instructions", displayMode: .inline)
    }
}
struct ListView: View {
    var totalBeanNum: Int {
        var count = 0
        for (food, servings) in foodList {
            if food.name == "Bean Burrito" || food.name == "Singular Bean" || food.name == "Can of beans" {
                count += servings
            }
        }
        return count
    }
    var body: some View {
        VStack {
            ScrollView()
            {
                Text("Your List:")
                    .font(.system(size: 60))
                    .padding(10)
                    .foregroundColor(.blue)
                    .bold()
                
                ForEach(foodList.sorted(by: { $0.key.name < $1.key.name }), id: \.key) { food, servings in
                    if (servings == 1) {
                        Text("\(food.name): \(servings) serving")
                            .font(.system(size: 30))
                    }
                    else {
                        Text("\(food.name): \(servings) servings")
                            .font(.system(size: 30))
                    }
                }
                Spacer()
                Text("Recommended Calories: \(maintenanceCalories)")
                    .font(.system(size: 20))
                Spacer()
                Text("Total Calories: \(totalCalories)")
                    .font(.system(size: 20))
                Spacer()
                Text("Total Fat: \(totalFat)")
                    .font(.system(size: 20))
                Spacer()
                Text("Total Carbs: \(totalCarbs)")
                    .font(.system(size: 20))
                Spacer()
                Text("Total Protein: \(totalProtein)")
                    .font(.system(size: 20))
                Spacer()
                Spacer()
                
                if (totalCalories >= maintenanceCalories + 300) {
                    Text("WARNING")
                        .font(.system(size: 30))
                        .foregroundColor(Color.red)
                        .bold()
                    Text("Your daily calories exceeds the recommended limit.")
                        .multilineTextAlignment(.center)
                }
                else if (totalCalories <= maintenanceCalories-300 && totalCalories != 0) {
                    Text("WARNING")
                        .font(.system(size: 30))
                        .foregroundColor(Color.red)
                        .bold()
                    Text("Your daily calories is less than the recommended limit.")
                        .multilineTextAlignment(.center)
                }
                if (totalFat >= maintenanceCalories/27 + 10) {
                    Text("WARNING")
                        .font(.system(size: 30))
                        .foregroundColor(Color.red)
                        .bold()
                    Text("Your daily fat exceeds the recommended limit.")
                        .multilineTextAlignment(.center)
                }
                else if (totalFat <= maintenanceCalories/27 - 10 && totalFat != 0) {
                    Text("WARNING")
                        .font(.system(size: 30))
                        .foregroundColor(Color.red)
                        .bold()
                    Text("Your daily fat is less than the recommended limit.")
                        .multilineTextAlignment(.center)
                }
                if (totalCarbs >= maintenanceCalories/6 + 50) {                    Text("WARNING")
                        .font(.system(size: 30))
                        .foregroundColor(Color.red)
                        .bold()
                    Text("Your daily carbs exceeds the recommended limit.")
                        .multilineTextAlignment(.center)
                }
                else if (totalCarbs <= maintenanceCalories/6 - 50 && totalCarbs != 0) {
                    Text("WARNING")
                        .font(.system(size: 30))
                        .foregroundColor(Color.red)
                        .bold()
                    Text("Your daily carbs is less than the recommended limit")
                        .multilineTextAlignment(.center)
                }
                if(showTryAgain > 0)
                {
                    Text("You Might Want To Go Back And Change Your Selections!")
                        .font(.system(size: 32))
                        .foregroundColor(Color.red)
                        .bold()
                        .multilineTextAlignment(.center)
                }
                
                if (totalBeanNum >= 10) {
                    Image("beansss")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                Spacer()
            }
        }
        .padding()
        .navigationBarTitle("Plan", displayMode: .inline)
    }
}

struct CreditsView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("CREDITS").font(.system(size: 40)).padding(.top, 20)
                Spacer()
                Text("""
                    William Code:
                    Hard carry
                    """)
                Spacer()
                Text("""
                    Maxim:
                    0 ProCo Problems Solved
                    """)
                Spacer()
                Text("""
                    Jiwonton:
                    Button Color Changer
                    """)
                Spacer()
                Text("""
                    Sodwi:
                    Most Useful
                    """)
                Spacer()
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .font(.system(size: 30))
        }
        .navigationBarTitle("Credits", displayMode: .inline)
    }
}

@main
struct HackathonApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
