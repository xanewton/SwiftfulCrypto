//
//  HomeView.swift
//  SwiftfulCrypto
//
//  Created by newtan on 2022-06-25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortolio: Bool = false
    
    var body: some View {
        ZStack{
            // Background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // Content layer
            VStack {
                homeHeader
                
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        // Make the preview as your actual UI.
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
    }
}

extension HomeView {
    
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortolio ? "plus" : "info")
                .animation(.none)
                .background(
                    CircleButtonAnimationView(animate: $showPortolio)
                )
            Spacer()
            Text(showPortolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}
