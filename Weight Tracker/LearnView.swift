import SwiftUI
struct LearnView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image("Calories")
                    .resizable()
                    .imageScale(.small)
                    .aspectRatio(contentMode: .fit)
                    .frame(height:300)
                    .cornerRadius(20)
                
                Text("Learn About Nutrition")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Group {
                    Text("Macronutrients")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Macronutrients are the nutrients that provide calories or energy. Nutrients are substances needed for growth, metabolism, and for other body functions. Since 'macro' means large, macronutrients are nutrients needed in large amounts. There are three types of macronutrients: carbohydrates, proteins, and fats.")
                    
                    VStack(alignment: .leading) {
                        Text("Carbohydrates")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Carbohydrates are the body's main source of energy. They are found in foods like bread, rice, pasta, fruits, and vegetables. Carbs can be classified into simple and complex carbohydrates.")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Proteins")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Proteins are essential for growth, repairing cells, and for body maintenance. Sources of protein include meat, dairy products, nuts, and certain grains and beans.")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Fats")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Fats are a concentrated source of energy and are necessary for cell function and insulation. They are found in oils, butter, avocados, and fatty fish. Fats can be saturated or unsaturated.")
                    }
                }
                .padding([.leading, .trailing], 20)
                
                Divider()
                
                Group {
                    Text("Micronutrients")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Micronutrients are vitamins and minerals required by the body in small amounts for various functions, including growth, disease prevention, and well-being. They include vitamins such as vitamin C, and minerals such as calcium and iron.")
                    
                    VStack(alignment: .leading) {
                        Text("Vitamins")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Vitamins are organic compounds that are crucial for normal growth and nutrition. They are required in small quantities in the diet because they cannot be synthesized by the body.")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Minerals")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Minerals are inorganic elements that play a key role in maintaining proper body function. Examples include calcium, potassium, and iron.")
                    }
                }
                .padding([.leading, .trailing], 20)
                
                Divider()
                
                Group {
                    Text("Hydration")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Staying hydrated is vital for health and well-being, but many people do not consume enough fluids each day. Water is essential for digestion, nutrient absorption, and waste elimination.")
                    
                    VStack(alignment: .leading) {
                        Text("Benefits of Hydration")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Proper hydration helps to maintain body temperature, lubricate joints, and protect sensitive tissues. It also aids in detoxification and optimal physical performance.")
                    }
                }
                .padding([.leading, .trailing], 20)
                
                Spacer()
            }
        }
        .padding()
        .navigationBarTitle("Learn", displayMode: .inline)
    }
}


