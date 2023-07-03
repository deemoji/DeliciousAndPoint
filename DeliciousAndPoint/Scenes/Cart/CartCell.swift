//
//  CartCell.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 01.07.2023.
//

import SwiftUI

struct CartCell: View {
    
    var id: Int
    var imageUrl: String
    var name: String
    var price: Int
    var weight: Int
    
    @Binding var cartItems: [Int: Int]
    
    var body: some View {
        HStack {
            ZStack {
                Color(red: 0.97, green: 0.97, blue: 0.96)
                    .cornerRadius(10)
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text(name)
                HStack(spacing: 0) {
                    Text("\(price) ₽")
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                    Text(" · \(weight)г")
                        .foregroundColor(.black.opacity(0.4))
                }

            }
            Spacer()
            HStack(spacing: 15) {
                Button {
                    cartItems[id, default: 0] -= 1
                    if cartItems[id]! == 0 {
                        cartItems.removeValue(forKey: id)
                    }
                } label: {
                    Image(systemName: "minus")
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                }
                Text("\(cartItems[id] ?? 0)").frame(width: 20)
                Button {
                    cartItems[id, default: 0] += 1
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                }
            }
            .padding()
            .background(Color(red: 0.97, green: 0.97, blue: 0.96))
            .cornerRadius(10)
        }.padding()
    }
}

struct CartCell_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
        //CartCell(imageUrl: "", name: "Some name", price: 799, weight: 500, quantity: .constant(1))
    }
}
