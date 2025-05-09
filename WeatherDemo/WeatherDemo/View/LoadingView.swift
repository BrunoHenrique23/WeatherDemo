//
//  LoadingView.swift
//  WeatherDemo
//
//  Created by Bruno Henrique Ferraz da Silva on 17/03/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(
                tint: .white
            ))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    LoadingView()
}
