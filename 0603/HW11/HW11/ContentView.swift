//
//  ContentView.swift
//  HW11
//
//  Created by 張睿恩 on 2025/6/3.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State private var searchText = ""
    @State private var showingAddExpense = false
    
    var filteredItems: [Item] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var totalAmount: Double {
        items.reduce(0) { $0 + $1.amount }
    }
    
    var currentMonthAmount: Double {
        let calendar = Calendar.current
        return items.filter {
            calendar.isDate($0.timestamp, equalTo: Date(), toGranularity: .month)
        }.reduce(0) { $0 + $1.amount }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("總支出")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text("$\(totalAmount, specifier: "%.2f")")
                            .font(.title2)
                            .bold()
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("本月支出")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text("$\(currentMonthAmount, specifier: "%.2f")")
                            .font(.title2)
                            .bold()
                    }
                }
                .padding()
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
                
                List {
                    ForEach(filteredItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.timestamp.formatted(date: .abbreviated, time: .omitted))
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            
                            Spacer()
                            
                            Text("$\(item.amount, specifier: "%.2f")")
                                .bold()
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(.plain)
            }
            .navigationTitle("記帳 App")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {
                        showingAddExpense = true
                    }) {
                        Label("新增支出", systemImage: "plus")
                    }
                }
            }
            .searchable(text: $searchText, prompt: "搜尋支出項目")
            .sheet(isPresented: $showingAddExpense) {
                AddExpenseView()
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(filteredItems[index])
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Item.self, configurations: config)
        
        // Add some sample data for preview
        let modelContext = container.mainContext
        let item1 = Item(name: "午餐", amount: 150, timestamp: Date())
        let item2 = Item(name: "交通費", amount: 30, timestamp: Date().addingTimeInterval(-86400))
        let item3 = Item(name: "咖啡", amount: 120, timestamp: Date().addingTimeInterval(-172800))
        modelContext.insert(item1)
        modelContext.insert(item2)
        modelContext.insert(item3)
        
        return ContentView().modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
