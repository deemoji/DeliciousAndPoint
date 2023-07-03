//
//  DishTypesView.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 01.07.2023.
//

import SwiftUI

struct DishTypesView: View {
    
    @Binding var selected: String
    
    private let types: [String] = ["Все меню", "Салаты", "С рисом", "С рыбой"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(types, id: \.self) { item in
                    Button {
                        selected = item
                    } label: {
                        Text("\(item)")
                            .padding()
                            .foregroundColor(selected == item ? .white : .black)
                            .background(selected == item ? Color(red: 0.2, green: 0.39, blue: 0.88) : Color(red: 0.97, green: 0.97, blue: 0.96))
                            .cornerRadius(10)
                    }

                    
                }
            }
        }
    }
}

struct DishTypesView_Previews: PreviewProvider {
    static var previews: some View {
        DishTypesView(selected: .constant("Все меню"))
    }
}
