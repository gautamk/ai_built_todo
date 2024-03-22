import SwiftUI

/// A view that displays a list of tasks.
struct TaskListView: View {
    @StateObject private var viewModel = TaskListViewModel()
    @State private var newTaskName = ""

    
    /// The body of the view.
    var body: some View {
        VStack {
            Text("Todo")
                .font(.largeTitle)
                .padding(.bottom)
            HStack {
                TextField("New task", text: $newTaskName, onCommit: {
                     if !newTaskName.isEmpty {
                        viewModel.addTask(name: newTaskName)
                        newTaskName = ""
                    }
                })
                .bold()
                Button(action: {
                    viewModel.addTask(name: newTaskName)
                    newTaskName = ""
                }) {
                    Image(systemName: "plus")
                }.disabled(newTaskName.isEmpty)
            }.padding(.horizontal)
            List {
                ForEach(viewModel.tasks.indices, id: \.self) { index in
                    HStack {
                        TextField("Task name", text: Binding(
                            get: { viewModel.tasks[index].name },
                            set: { newName in viewModel.updateTaskName(at: index, to: newName) }
                        ))
                        .strikethrough(viewModel.tasks[index].isCompleted, color: .gray)
                        Spacer()
                        Button(action: {
                            viewModel.toggleTaskCompletion(at: index)
                        }) {
                            Image(systemName: viewModel.tasks[index].isCompleted ? "checkmark.circle.fill" : "circle")
                        }
                    }
                }
                .onDelete(perform: viewModel.deleteTask)
            }
        }.padding(.horizontal)
        .padding(.horizontal)
        .navigationTitle("To-Do List")
    }
}

#Preview {
    TaskListView();
}
