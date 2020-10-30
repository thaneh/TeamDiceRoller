//
//  HistoryView.swift
//  TeamDiceRoller
//
//  Created by Clinton Perry on 10/30/20.
//

import SwiftUI
import CoreData

struct HistoryRow:View {
    let roll:DiceRoll
    var body: some View {
        Text("\(roll.diceValues?.debugDescription ?? "NIL")")
    }
}

struct HistoryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \DiceRoll.timestamp, ascending: true)],
        animation: .default)
    private var rolls: FetchedResults<DiceRoll>
    
    func deleteRoll(offsets:IndexSet) {
        withAnimation {
            offsets.map { rolls[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func eraseEverything() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "DiceRoll")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        batchDeleteRequest.resultType = .resultTypeObjectIDs
        
        do {
            let result = try viewContext.execute(batchDeleteRequest) as? NSBatchDeleteResult
            guard let objectIDArray = result?.result as? [NSManagedObjectID] else {
                return
            }
            
            let changes: [AnyHashable: Any] = [NSDeletedObjectsKey: objectIDArray]
            NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [viewContext])
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        VStack{
            Button("Erase all the things") {
                eraseEverything()
            }
            List {
                ForEach(rolls) {
                    HistoryRow(roll: $0)
                }.onDelete(perform:deleteRoll)
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
