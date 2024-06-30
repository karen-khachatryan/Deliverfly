//
//  FoodPreview.swift
//  Deliverfly-Karen-Khachatryan
//
//  Created by user on 6/16/24.
//

import SwiftUI

struct FoodPreview: View {
    let food: Food
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .shadow(color: .black.opacity(0.15), radius: 20, x: 10, y: 10)
            .foregroundStyle(.white)
            .frame(width: 150, height: 130)
            .offset(y: 30)
            .overlay {
                VStack(alignment: .center) {
                    image
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            name
                            hasExtracts
                            price
                        }
                        .padding(.leading)
                        Spacer()
                    }
                }
            }
    }
    
    var image: some View {
        Image(food.image)
            .resizable()
            .scaledToFill()
            .frame(width: 110, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    var name: some View {
        Text(food.name)
            .font(.subheadline)
            .foregroundStyle(.black)
            .bold()
    }
    
    var hasExtracts: some View {
        Text(food.ingredients.isEmpty ? "Standard" : "Extras Available")
            .font(.footnote)
            .foregroundStyle(.gray)
    }
    
    var price: some View {
        Text(food.price, format: .currency(code: "USD"))
            .foregroundStyle(.black)
            .font(.subheadline)
            .bold()
    }
}

#Preview {
    FoodPreview(food: .doubleDouble)
}
