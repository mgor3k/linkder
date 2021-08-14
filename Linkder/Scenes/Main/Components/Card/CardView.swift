//
//  Created by mgor3k on 13/08/2021.
//

import SwiftUI

struct CardView: View {
    @State private var translation: CGSize = .zero
    
    let offer: Offer
    let onDrag: (CGSize) -> Void
    
    let onDislike: (Offer) -> Void
    let onLike: (Offer) -> Void
    
    let swipeEdge: CGFloat = 50
    let swipeFinishing: CGFloat = 400
    
    var body: some View {
        content
            .offset(translation)
            .rotationEffect(.degrees(translation.width / 30))
            .animation(
                .interactiveSpring(),
                value: translation
            )
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        translation = gesture.translation
                        onDrag(translation)
                    }
                    .onEnded { gesture in
                        withAnimation {
                            finishGesture(gesture)
                        }
                        onDrag(.zero)
                    }
            )
    }
}

extension CardView {
    var content: some View {
        ZStack {
            background
            
            VStack(spacing: 16) {
                AvatarView(imageName: offer.imageName)
                
                VStack(spacing: 32) {
                    VStack(spacing: 4) {
                        Text(offer.companyName)
                            .font(.callout)
                            .bold()
                        Text(offer.companyAddress)
                            .font(.callout)
                    }
                    
                    VStack(spacing: 8) {
                        Text(offer.rank)
                            .bold()
                            .font(.title3)
                        Text(offer.position)
                            .bold()
                            .font(.title2)
                    }
                }
                
                (Text("$ \(offer.salary) ").fontWeight(.heavy) + Text("CARD_YEAR"))
                    .padding(12)
                    .background(Color.white.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .padding(.top, 10)

            }
            .padding(32)
        }
        .foregroundColor(.white)
    }
    
    var background: some View {
        LinearGradient(colors: [Color("Card1"), Color("Card2")], startPoint: .bottomLeading, endPoint: .topTrailing)
            .clipShape(RoundedRectangle(cornerRadius: 48, style: .continuous))
    }
    
    func finishGesture(_ gesture: DragGesture.Value) {
        if translation.width < -swipeEdge {
            translation = .init(
                width: translation.width - swipeFinishing,
                height: translation.height
            )
            onDislike(offer)
        } else if translation.width > swipeEdge {
            translation = .init(
                width: translation.width + swipeFinishing,
                height: translation.height
            )
            onLike(offer)
        } else {
            translation = .zero
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            offer: OfferProvider().getOffers()[0],
            onDrag: { _ in },
            onDislike: { _ in },
            onLike: { _ in }
        )
            .frame(height: 400)
            .padding(32)
    }
}
