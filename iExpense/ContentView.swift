//
//  ContentView.swift
//  iExpense
//
//  Created by Samuel Hernandez Vicera on 3/25/24.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var issueName: String = "iExpense"
//    @State private var showingAddExpense = false

    var body: some View {
        NavigationView {
            List {
                Section("Personal Expenses") {
                    ForEach(expenses.items.filter { $0.type == "Personal" }) { item in
                        ExpenseRow(item: item)
                    }
                    .onDelete { offsets in
                        removeItems(at: offsets, type: "Personal")
                    }
                }

                Section(header: Text("Business Expenses")) {
                    ForEach(expenses.items.filter { $0.type == "Business" }) { item in
                        ExpenseRow(item: item)
                    }
                    .onDelete{ offsets in
                        removeItems(at: offsets, type: "Business")
                    }
                }
            }
            .navigationTitle($issueName)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddView(expenses: expenses)){
                        Label("Add Expense", systemImage: "plus")
                    }
                    }
            }
            
//            .sheet(isPresented: $showingAddExpense) {
//                AddView(expenses: expenses) no longer needed
//            }
           

         
        }
    }

    func removeItems(at offsets: IndexSet, type: String) {
            /* due to seperating the array into a filter above and having a single remove it function, this updated logic allows for all the values in the index set that match the current type to be collected in itemsToRemove
             
             Afterwards, we iterate over the indexset collected and check where the first occurence occurs of the value we would like to remove and then removing it in the original array
             */
        
        let itemstoRemove = offsets.map { expenses.items.filter { $0.type == type}[$0] }
        for item in itemstoRemove {
            if let index = expenses.items.firstIndex(of: item) {
                expenses.items.remove(at: index)
            }
        }
    }
}

struct ExpenseRow: View {
    let item: ExpenseItem

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)

            }
            Spacer()
            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .fontWeight(item.amount >= 100 ? .bold : .none)
                .fontDesign(item.amount > 10 ? .serif : .monospaced )
        }
    }
}
#Preview {
    ContentView()
}
