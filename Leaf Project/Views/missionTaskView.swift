//
//  mission task page.swift
//  practice 2
//
//  Created by Quynh Tram on 11/4/23.
//

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isCompleted: Bool
}

struct missionTaskView: View {
    
    @StateObject var viewModel = missionTaskViewViewModel()
    @State private var tasks =
    [Task(name: "brokerage account setup", isCompleted: false),
     Task(name: "roth ira vs traditional ira", isCompleted: false),
     Task(name: "investment strategies", isCompleted: false),
     Task(name: "money management", isCompleted: false),
     Task(name: "paying taxes", isCompleted: false),
     Task(name: "analyzing stocks", isCompleted: false),
     Task(name: "day trading tactics", isCompleted: false),
     Task(name: "long term investment", isCompleted: false),
     Task(name: "smart budgeting", isCompleted: false),
     Task(name: "savings account", isCompleted: false),
     Task(name: "understanding a 401k", isCompleted: false)]
    
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 0.621, green: 0.789, blue: 0.656)
                    .ignoresSafeArea()
                VStack {
                    Text("Your Missions")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size:45))
                        .offset(x:-20)
                    
                    List($tasks) { $task in
                        MissionCellView(task: $task)
                    }
                    .scrollContentBackground(.hidden)
                    .padding()
                        
                    HStack{
                        Image("seed")
                            .resizable()
                            .frame(width: 75, height: 75)
                        
                        Text("Completed\nmissions:\n \(tasks.filter {$0.isCompleted}.count)")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Image("tree")
                            .resizable()
                            .frame(width: 75, height: 75)
                    }
                        
                }
            }
        }
    }
}

struct missionTaskView_Previews: PreviewProvider {
    static var previews: some View {
        missionTaskView()
    }
}

struct MissionCellView: View {
    
    @Binding var task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.square": "square")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            Text(task.name)
        }
    }
}
