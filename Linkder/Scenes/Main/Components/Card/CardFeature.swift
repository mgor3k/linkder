//
//  Created by mgor3k on 13/08/2021.
//

import SwiftUI

struct CardFeature: View {
    @State var translation: CGSize = .zero
    
    let offers: [Offer]
    let onDislike: (Offer) -> Void
    let onLike: (Offer) -> Void
    
    var body: some View {
        ZStack {
            CardGroup(
                offers: offers,
                translation: $translation,
                onDislike: onDislike,
                onLike: onLike
            )
                .padding(.horizontal, 24)
            
            HStack {
                Circle()
                    .overlay(
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .offset(x: 20)
                    )
                    .offset(x: -50)
                    .frame(width: 100, height: 100)
                    .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 0)
                    .opacity(
                        translation.width < 0 ? opacity : 0
                    )
            
                Spacer()
            
                Circle()
                    .overlay(
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(.green)
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .offset(x: -20)
                    )
                    .offset(x: 50)
                    .frame(width: 100, height: 100)
                    .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 0)
                    .opacity(
                        translation.width > 0 ? opacity : 0
                    )
            }
            .foregroundColor(.white)
        }
    }
    
    var opacity: CGFloat {
        abs(translation.width) / 100
    }
}

struct CardFeature_Previews: PreviewProvider {
    static var previews: some View {
        CardFeature(
            offers: [],
            onDislike: { _ in },
            onLike: { _ in }
        )
    }
}
