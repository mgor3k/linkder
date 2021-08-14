//
//  Created by mgor3k on 13/08/2021.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            GradientBackground()
            
            VStack {
                MenuBar(
                    onSettings: onSettings
                )
                    .padding(.horizontal, 24)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("MAIN_TITLE")
                        .font(.system(size: 32, weight: .heavy, design: .default))
                    
                    Text("MAIN_CAPTION")
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
                
                VStack(spacing: 24) {
                    ZStack {
                        if viewModel.offers.isEmpty {
                            Text("MAIN_EMPTY")
                        }
                        CardFeature(
                            offers: viewModel.offers,
                            onDislike: onDislike,
                            onLike: onLike
                        )
                            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 0)
                    }
                    FloatingBar()
                }
                
                Spacer()
            }
            .padding(.vertical, 16)
        }
        .navigationBarHidden(true)
    }
    
    func onDislike(_ offer: Offer) {
        viewModel.onDislike(offer)
    }
    
    func onLike(_ offer: Offer) {
        viewModel.onLike(offer)
    }
    
    func onSettings() {
        withAnimation {
            viewModel.reset()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            viewModel: .init(
                provider: OfferProvider(),
                onLiked: { _ in }
            )
        )
    }
}
