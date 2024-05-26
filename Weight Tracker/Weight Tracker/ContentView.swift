//
//  ContentView.swift
//  Weight Tracker
//
//  Created by Max Shaykin on 5/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack(){
                Color("Background").ignoresSafeArea()
                VStack() {
                    Spacer()
                    Text("Welcome to your Weight Tracker")
                        .font(.system(size: 45))
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(-60)
                        .foregroundColor(Color("TitleColor"))
                    Spacer()
                    NavigationLink(destination: EnterInfoView()) {
                        Text("Enter Info")
                            .foregroundColor(Color("TextColor"))
                            .padding(20)
                            .font(.largeTitle)
                            .background(Color.green)
                            .cornerRadius(12)
                    }
                    .padding(.bottom, 10)
                    NavigationLink(destination: InstructionsView()) {
                        Text("See Instructions")
                            .foregroundColor(Color("TextColor"))
                            .padding(20)
                            .font(.largeTitle)
                            .background(Color("ButtonColor"))
                            .cornerRadius(12)
                    }
                    .padding(.bottom, 10)
                    NavigationLink(destination: PlanView()) {
                        Text("Your Plan")
                            .foregroundColor(Color("TextColor"))
                            .padding(20)
                            .font(.largeTitle)
                            .background(Color.purple)
                            .cornerRadius(12)
                    }
                    .padding(.bottom, 10)
                    NavigationLink(destination: ListView()) {
                        Text("View Your List")
                            .foregroundColor(Color("TextColor"))
                            .padding(20)
                            .font(.largeTitle)
                            .background(Color.yellow)
                            .cornerRadius(12)
                    }
                    .padding(.bottom, 10)
                    NavigationLink(destination: LearnView()) {
                        Text("Learn")
                            .foregroundColor(Color("TextColor"))
                            .padding(20)
                            .font(.largeTitle)
                            .background(Color.orange)
                            .cornerRadius(12)
                    }
                    .padding(.bottom, 10)
                    NavigationLink(destination: CreditsView()) {
                        Text("Credits")
                            .padding(20)
                            .font(.largeTitle)
                            .background(Color.mint)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.bottom, 10)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
