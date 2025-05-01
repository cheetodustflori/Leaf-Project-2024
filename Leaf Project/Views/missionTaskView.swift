//
//  mission task page.swift
//
//  This file defines the main mission/task screen
//  Displays a list of financial education tasks for users to complete

import SwiftUI
import Supabase  // Imports Supabase for backend database interactions

// Model for lesson content retrieved from Supabase
struct Lesson: Codable, Identifiable {
    let id: UUID  // Unique identifier for the lesson
    let name: String  // Title/name of the lesson
    let content: String  // Main content text of the lesson
}

// Model for each mission/task item in the list
struct MissionTask: Identifiable {
    let id = UUID()  // Auto-generated unique identifier
    let name: String  // Name/title of the task
    var isCompleted: Bool  // Completion status - mutable property
}

struct missionTaskView: View {
    
    @StateObject var viewModel = missionTaskViewViewModel()  // MVVM pattern viewModel
    
    // Predefined list of financial education tasks
    @State private var tasks =
    [MissionTask(name: "brokerage account setup", isCompleted: false),
     MissionTask(name: "roth ira vs traditional ira", isCompleted: false),
     MissionTask(name: "investment strategies", isCompleted: false),
     MissionTask(name: "money management", isCompleted: false),
     MissionTask(name: "paying taxes", isCompleted: false),
     MissionTask(name: "analyzing stocks", isCompleted: false),
     MissionTask(name: "day trading tactics", isCompleted: false),
     MissionTask(name: "long term investment", isCompleted: false),
     MissionTask(name: "smart budgeting", isCompleted: false),
     MissionTask(name: "savings account", isCompleted: false),
     MissionTask(name: "understanding a 401k", isCompleted: false)]
    
    
    var body: some View {
        NavigationView {  // Container for navigation between screens
            ZStack{  // Layered container (background + content)
                // Background color - matching app's green theme
                Color(red: 0.621, green: 0.789, blue: 0.656)
                    .ignoresSafeArea()  // Extends color beyond safe area
                VStack {  // Main vertical container
                    // Page title
                    Text("Your Missions")
                        .foregroundColor(.white)  // White text for contrast
                        .fontWeight(.bold)  // Bold text for emphasis
                        .font(.system(size:45))  // Large font size
                        .offset(x:-20)  // Shifts text left by 20 points
                    
                    // List of mission tasks
                    List($tasks) { $task in  // Using $ for two-way binding
                        // Each row is a navigation link to its lesson
                        NavigationLink(destination: LessonDetailView(name: task.name)) {
                                MissionCellView(task: $task)  // Custom cell view with binding
                            }
                    }
                    .scrollContentBackground(.hidden)  // Hides default list background
                    .padding()  // Adds space around the list
                        
                    // Footer section showing completion progress
                    HStack{
                        // Seed image (starting point visual)
                        Image("seed")
                            .resizable()  // Allows image to be resized
                            .frame(width: 75, height: 75)  // Fixed dimensions
                        
                        // Counter showing completed missions
                        Text("Completed\nmissions:\n \(tasks.filter {$0.isCompleted}.count)")
                            .fontWeight(.bold)  // Bold text
                            .foregroundColor(.white)  // White text for contrast
                            .multilineTextAlignment(.center)  // Center-aligned text
                        
                        // Tree image (growth/completion visual)
                        Image("tree")
                            .resizable()  // Allows image to be resized
                            .frame(width: 75, height: 75)  // Fixed dimensions
                    }
                        
                }
            }
        }
        .navigationBarBackButtonHidden(true)  // Prevents navigation back to onboarding
    }
}


// Preview provider for SwiftUI canvas
struct missionTaskView_Previews: PreviewProvider {
    static var previews: some View {
        missionTaskView()  // Creates preview instance
    }
}

// Custom cell view for each mission in the list
struct MissionCellView: View {
    
    @Binding var task: MissionTask  // Two-way binding to task model
    
    var body: some View {
        HStack {  // Horizontal arrangement
            // Checkbox that toggles between empty and checked
            Image(systemName: task.isCompleted ? "checkmark.square": "square")
                .onTapGesture {
                    task.isCompleted.toggle()  // Toggles completion status
                }
            // Task name text
            Text(task.name)
        }
    }
}

// View model for lesson content - handles data fetching
class LessonViewModel: ObservableObject {
    @Published var lesson: Lesson?  // Optional lesson that will update the UI when set
    @Published var errorMessage: String?  // Optional error message
    
    // Asynchronous function to fetch lesson content from Supabase
    func fetchLessonContent(lessonName: String) async {
        do {
            // Query Supabase database for lesson matching the name
            let response = try await supabaseClient
                .from("lessons")  // Table name
                .select("content")  // Field to retrieve
                .eq("name", value: lessonName)  // Where clause
                .execute()
            
            let data = response.data  // Get response data
            
            // Debug print to console
            print("Raw Supabase Response:", String(data: data, encoding: .utf8) ?? "Invalid Data")
            
            // Handle empty results
            if data.isEmpty {
                DispatchQueue.main.async {
                    self.errorMessage = "No lesson found for '\(lessonName)'."
                }
                return
            }
            
            // Define a struct to match the expected JSON structure
            struct LessonContent: Codable {
                let content: String
            }
            
            let decoder = JSONDecoder()
            let decodedLesson = try decoder.decode([LessonContent].self, from: data)
            
            // Update UI on main thread
            DispatchQueue.main.async {
                    if let lessonContent = decodedLesson.first {
                        // Create lesson with retrieved content
                        self.lesson = Lesson(id: UUID(), name: lessonName, content: lessonContent.content)
                    } else {
                        self.errorMessage = "Error: Missing content field."
                    }
                }
                
            } catch {
                // Handle and display any errors
                DispatchQueue.main.async {
                    self.errorMessage = "Error fetching lesson: \(error.localizedDescription)"
                }
            }
    }
}
    
    
// Detailed view for displaying lesson content
struct LessonDetailView: View {
    let name: String  // Lesson name passed from parent view
    @StateObject private var viewModel = LessonViewModel()  // View model for data fetching
    
    var body: some View {
        VStack {
            // Conditional content based on state
            if let lesson = viewModel.lesson {
                // Display lesson when loaded successfully
                Text(lesson.name)
                    .font(.title)
                    .bold()
                    .padding()
                
                ScrollView {
                    Text(lesson.content)
                        .padding()
                }
            } else if let errorMessage = viewModel.errorMessage {
                // Display error message if loading failed
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            } else {
                // Show loading indicator while content is being fetched
                ProgressView("Loading...")
            }
        }
        .task {
            // Start fetching content when view appears
            await viewModel.fetchLessonContent(lessonName: name)
        }
        
    }
}

