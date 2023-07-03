//
//  CategoriesView.swift
//  DeliciousAndPoint
//
//  Created by Дмитрий Мартьянов on 27.06.2023.
//

import SwiftUI

struct CategoriesView: View {
    
    @EnvironmentObject private var viewModel: CategoriesViewModel
    
    var body: some View {
        List(viewModel.categories) { category in
            Button {
                viewModel.navigateToDishesView(categoryName: category.name)
            } label: {
                CategoryCell(imageUrl: category.image_url, categoryName: category.name)
                    
            }
            .listRowSeparator(.hidden)

            
        }
        .listStyle(.plain)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
