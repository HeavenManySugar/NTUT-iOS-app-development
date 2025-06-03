//
//  AddExpenseView.swift
//  HW11
//
//  Created by GitHub Copilot on 2025/6/3.
//

import SwiftUI
import SwiftData

struct AddExpenseView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var amount: Double = 0
    @State private var date: Date = Date()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("支出資訊") {
                    TextField("名稱", text: $name)
                    
                    HStack {
                        Text("金額")
                        TextField("金額", value: $amount, format: .currency(code: "TWD"))
                            .keyboardType(.decimalPad)
                    }
                    
                    DatePicker("日期", selection: $date, displayedComponents: [.date])
                }
            }
            .navigationTitle("新增支出")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("取消") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("儲存") {
                        saveItem()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
    
    private func saveItem() {
        let newItem = Item(name: name, amount: amount, timestamp: date)
        modelContext.insert(newItem)
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Item.self, configurations: config)
        return AddExpenseView().modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
