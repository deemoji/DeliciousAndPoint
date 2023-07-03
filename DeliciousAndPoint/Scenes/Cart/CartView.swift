//
//  CartView.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 29.06.2023.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var vm: CartViewModel
    private var total: Int {
        vm.dishes.map {
            $0.price * (vm.cartItems[$0.id] ?? 0)
        }.reduce(0, +)
    }
    private var totalLabel: String {
        total == 0 ? "Нет заказов" : "Оплатить " + String(total) + " ₽"
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                ForEach(vm.dishes) { dish in
                    if vm.cartItems[dish.id] != nil {
                        CartCell(id: dish.id, imageUrl: dish.image_url, name: dish.name, price: dish.price, weight: dish.weight, cartItems: $vm.cartItems)
                            .frame(height: 80)
                    }
                }
            }.padding(.vertical)
            Text(totalLabel)
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 57)
                .background(Color(red: 0.2, green: 0.39, blue: 0.88))
                .cornerRadius(10)
                .padding()
            
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
