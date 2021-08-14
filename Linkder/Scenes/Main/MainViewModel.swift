//
//  Created by mgor3k on 13/08/2021.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var offers: [Offer]
    
    private let provider: OfferProviding
    private let onLiked: (Offer) -> Void
    
    init(
        provider: OfferProviding,
        onLiked: @escaping (Offer) -> Void
    ) {
        self.provider = provider
        self.onLiked = onLiked
        
        offers = provider.getOffers()
    }
    
    func onDislike(_ offer: Offer) {
        removeOffer(offer)
    }

    func onLike(_ offer: Offer) {
        removeOffer(offer)
        
        if offer.isLiked {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.onLiked(offer)
            }
        }
    }

    func removeOffer(_ offer: Offer) {
        offers.removeAll(where: { offer.id == $0.id })
    }
    
    func reset() {
        offers = provider.getOffers()
    }
}
