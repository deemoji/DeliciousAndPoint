//
//  DishesView.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 28.06.2023.
//

import SwiftUI

struct DishesView: View {
    
    @EnvironmentObject var vm: DishesViewModel
    
    @State private var selectedType: String = "Все меню"
    
    private let columns = [
        GridItem(.flexible(),spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    var body: some View {
        VStack {
            DishTypesView(selected: $selectedType)
                .padding()
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(vm.dishes) { dish in
                        if dish.tegs.contains(selectedType) {
                            Button {
                                vm.open(dish)
                            } label: {
                                DishCell(imageUrl: dish.image_url, name: dish.name)
                                    .frame(width: 100, height: 130)
                            }
                            
                            
                        }
                        
                    }.padding()
                }
            }
        }.navigationBarTitle(vm.categoryName, displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image("gigachad")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 70, height: 70, alignment: .trailing)
                }
            }
        
    }
}

struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView()
    }
}
