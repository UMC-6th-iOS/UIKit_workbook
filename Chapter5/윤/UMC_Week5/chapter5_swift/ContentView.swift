//
//  ContentView.swift
//  chapter5_swift
//
//  Created by 윤성 on 5/15/24.
//

import SwiftUI

struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
}

class CartViewModel: ObservableObject {
    @Published var cartItems: [MenuItem] = []
    
    func addToCart(item: MenuItem) {
        cartItems.append(item)
    }
}

struct ContentView: View {
    @StateObject var cartViewModel = CartViewModel()
    
    var body: some View {
        TabView {
            MenuView(cartViewModel: cartViewModel)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Menu")
                }
            
            CartView(cartViewModel: cartViewModel)
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
                .badge(cartViewModel.cartItems.count)
        }
    }
}

struct MenuView: View {
    @ObservedObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            Text("Menu")
                .font(.title)
            
            // 메뉴 아이템 목록
            List(menuItems) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text("$\(item.price)")
                    Button(action: {
                        self.addToCart(item: item)
                    }) {
                        Text("담기")
                    }
                }
            }
        }
    }
    
    func addToCart(item: MenuItem) {
        cartViewModel.addToCart(item: item)
    }
}

struct CartView: View {
    @ObservedObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            Text("장바구니")
                .font(.title)
            
            // 장바구니 아이템 목록
            List(cartViewModel.cartItems) { item in
                Text("\(item.name) - $\(item.price)")
            }
        }
    }
}

// 메뉴 아이템 데이터
let menuItems: [MenuItem] = [
    MenuItem(name: "아이템 1", price: 10.0),
    MenuItem(name: "아이템 2", price: 15.0),
    MenuItem(name: "아이템 3", price: 8.0),
]


#Preview {
    ContentView()
}
