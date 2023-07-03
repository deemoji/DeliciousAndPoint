//
//  DescriptionView.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 27.06.2023.
//

import SwiftUI

struct DescriptionView: View {
    
    @EnvironmentObject var vm: DescriptionViewModel
    @State var addedToCart: Bool = false
    var body: some View {
        VStack() {
            ZStack(alignment: .topTrailing) {
                ZStack(alignment: .center) {
                    Color(red: 0.97, green: 0.97, blue: 0.96)
                        .cornerRadius(10)
                        .scaledToFill()
                    AsyncImage(url: URL(string: vm.dish.image_url)) { image in
                        image.resizable()
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .scaledToFit()
                }
                
                HStack {
                    Image("favorite")
                        .padding(10)
                        .scaledToFit()
                        .background(.white)
                        .cornerRadius(8)
                    Button {
                        vm.closeDescription()
                    } label: {
                        Image("cancel")
                            .padding(10)
                            .scaledToFit()
                            .background(.white)
                            .cornerRadius(8)
                    }

                    
                }
                .padding()
                
            }
            
            Text(vm.dish.name)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            
            HStack(spacing: 0) {
                Text("\(vm.dish.price) ₽")
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                Text(" · \(vm.dish.weight)г")
                    .foregroundColor(.black.opacity(0.4))
            }
            .minimumScaleFactor(0.5)
            .frame(maxWidth: .infinity, alignment: .leading)
            Text(vm.dish.description)
                .foregroundColor(.black.opacity(0.65))
                .frame(maxWidth: .infinity, alignment: .leading)
                .minimumScaleFactor(0.5)
            Button {
                if !addedToCart{
                    vm.sendDishToCart(vm.dish)
                    addedToCart = true
                }
                
            } label: {
                Text(addedToCart ? "Добавлено" : "Добавить")
                    .bold()
                    .padding()
                    .foregroundColor(addedToCart ? .black : .white)
                    .frame(maxWidth: .infinity)
                    .background(addedToCart ? Color(red: 0.97, green: 0.97, blue: 0.96) : Color(red: 0.2, green: 0.39, blue: 0.88))
                    .cornerRadius(10)
                
            }
        }
        .padding()
        .background(Color.white)
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView().frame(width: 343, height: 446)
    }
}
