//
//  Created by mgor3k on 13/08/2021.
//

import SwiftUI

struct CardGroup: View {
    let offers: [Offer]
    
    @Binding var translation: CGSize
    
    let onDislike: (Offer) -> Void
    let onLike: (Offer) -> Void
    
    let opacities: [CGFloat: Double] = [
        1: 1,
        2: 0.5,
        3: 0.2
    ]
    
    let offsets: [CGFloat: CGFloat] = [
        1: 0,
        2: -50,
        3: -140
    ]
    
    let scales: [CGFloat: CGFloat] = [
        1: 1,
        2: 0.85,
        3: 0.65
    ]
    
    var body: some View {
            ZStack {
                ForEach(offers) { offer in
                    if (self.maxID - 2)...self.maxID ~= offer.id {
                        CardView(
                            offer: offer,
                            onDrag: onDrag,
                            onDislike: onDislike,
                            onLike: onLike
                        )
                            .frame(height: 400)
                            .offset(
                                y: getCardOffset(id: offer.id)
                            )
                            .opacity(
                                getCardOpacity(id: offer.id)
                            )
                            .scaleEffect(
                                getCardScale(id: offer.id)
                            )
                    }
                }
            }
            .frame(height: 410)
            .offset(y: 20)
        .padding()
    }
}

private extension CardGroup {
    func getCardScale(id: Int) -> CGFloat {
        let scale: CGFloat = CGFloat(offers.count + 1 - id)
        return scales[scale] ?? 0
    }
    
    func getCardOpacity(id: Int) -> CGFloat {
        let opacity: CGFloat = CGFloat(offers.count + 1 - id)
        return opacities[opacity] ?? 0
    }
    
    func getCardOffset(id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(offers.count + 1 - id)
        print(offset)
        return offsets[offset] ?? 0
    }
    
    func onDrag(_ translation: CGSize) {
        self.translation = translation
    }
    
    var maxID: Int {
         offers.map { $0.id }.max() ?? 0
    }
}

struct CardGroup_Previews: PreviewProvider {
    static var previews: some View {
        CardGroup(
            offers: [],
            translation: .constant(.zero),
            onDislike: { _ in },
            onLike: { _ in }
        )
            .padding()
    }
}
