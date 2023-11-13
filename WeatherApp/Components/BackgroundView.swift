//
//  BackgroundView.swift
//  WeatherApp
//
//  Created by Eren Berkay Dinç on 13.11.2023.
//

import SwiftUI

struct BackgroundView: View {

    var topColor : Color
    var bottomColor : Color

    var body: some View {


        LinearGradient(gradient: Gradient(colors: [topColor,bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BackgroundView(topColor: .blue, bottomColor: Color("skyBlue"))
}
