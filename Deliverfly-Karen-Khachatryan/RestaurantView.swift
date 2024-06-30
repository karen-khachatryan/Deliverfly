//
//  RestaurantView.swift
//  Deliverfly-Karen-Khachatryan
//
//  Created by user on 6/23/24.
//

import SwiftUI

struct RestaurantView: View {
    @EnvironmentObject private var navigation: Navigation
    @State private var selectedFood: Food?
    let restaurant: Restaurant
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    backButton
                    Text("Restaurant")
                    Spacer()
                }
                restaurantImage
                nameText
                descriptionText
                menuText
                foodsGrid
            }
            .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
        .sheet(item: $selectedFood) { item in
            FoodView(food: item)
                .presentationDetents(item.ingredients.isEmpty ? [.fraction(0.63)] : [.fraction(0.93)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(30)
        }
    }
    
    var backButton: some View {
        Button(action: {
            navigation.goBack()
        }, label: {
            Image(.backArrow)
                .frame(width: 50, height: 50)
                .background(.lightGray)
                .clipShape(Circle())
                .padding(.trailing)
        })
    }
    
    var restaurantImage: some View {
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.vertical)
            .allowsHitTesting(false)
    }
    
    var nameText: some View {
        Text(restaurant.name)
            .font(.title2)
            .bold()
            .foregroundStyle(.darkBlue)
            .padding(.vertical, 5)
    }
    
    var descriptionText: some View {
        Text(restaurant.description)
            .font(.subheadline)
            .lineSpacing(10)
            .foregroundStyle(.gray)
    }
    var menuText: some View {
        Text("Menu")
            .font(.title3)
            .padding()
    }
    
    var foodsGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], content: {
            ForEach(restaurant.foods, id: \.self) { food in
                Button(action: {
                    selectedFood = food
                }, label: {
                    FoodPreview(food: food)
                        .frame(height: 200)
                })
            }
        })
    }
}

#Preview {
    RestaurantView(restaurant: .inNOut)
}
