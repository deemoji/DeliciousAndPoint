//
//  CoordinatorView.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 02.07.2023.
//

import SwiftUI

struct CoordinatorView: View {
    
    @ObservedObject var object = Coordinator()
    
    var body: some View {
        TabView {
            NavigationView {
                CategoriesView()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack(spacing: 0) {
                                Image("location")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .leading)
                                
                                VStack(alignment: .leading){
                                    Text("Санкт-Петербург")
                                        .font(.title2)
                                        .fontWeight(.medium)
                                    Text(Date(),style: .date).environment(\.locale, .current)
                                        .font(.body)
                                        .foregroundColor(.black.opacity(0.5))
                                }
                            }
                            
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Image("gigachad")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 70, height: 70, alignment: .trailing)
                        }
                    }
                    .navigation(item: $object.dishesViewModel) {
                        DishesView()
                            .navigationBarBackButtonHidden(true)
                            .toolbar{
                                ToolbarItem (placement: .navigation)  {
                                    Image(systemName: "arrow.left")
                                        .foregroundColor(.black)
                                        .onTapGesture {
                                            object.toCategoriesView()
                                        }
                                }
                            }
                            .environmentObject($0)
                            .fullScreenCover(item: $object.descriptionViewModel) { viewModel in
                                ZStack {
                                    Color.black.opacity(0.5).ignoresSafeArea()
                                    
                                    DescriptionView()
                                        .cornerRadius(15)
                                        .frame(width: 343, height: 446)
                                    
                                        .environmentObject(viewModel)
                                    
                                }.background(ClearBackgroundView())
                                
                            }.onAppear {
                                object.dishesViewModel?.fetchDishes()
                            }
                    }.environmentObject(object.categoriesViewModel).onAppear {
                        object.categoriesViewModel.fetchCategories()
                    }
            }.tabItem {
                Image("главная").renderingMode(.template)
                Text("Главная")
            }
            
            ZStack{
                Text("Поиск")
            }.tabItem {
                Image("поиск").renderingMode(.template)
                Text("Поиск")
            }
            
            NavigationView {
                CartView()
                    .environmentObject(object.cartViewModel)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack(spacing: 0) {
                                Image("location")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .leading)
                                
                                VStack(alignment: .leading){
                                    Text("Санкт-Петербург")
                                        .font(.title2)
                                        .fontWeight(.medium)
                                    Text(Date(),style: .date).environment(\.locale, .current)
                                        .font(.body)
                                        .foregroundColor(.black.opacity(0.5))
                                }
                            }
                            
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Image("gigachad")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 70, height: 70, alignment: .trailing)
                        }
                    }
            }.tabItem {
                Image("корзина").renderingMode(.template)
                Text("Корзина")
            }
            ZStack{
                Text("Аккаунт")
            }.tabItem {
                Image("аккаунт").renderingMode(.template)
                Text("Аккаунт")
            }
        }
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
