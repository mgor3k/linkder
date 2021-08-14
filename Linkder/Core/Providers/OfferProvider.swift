//
//  Created by mgor3k on 13/08/2021.
//

import Foundation

protocol OfferProviding {
    func getOffers() -> [Offer]
}

struct OfferProvider: OfferProviding {
    func getOffers() -> [Offer] {
        [
            .init(
                id: 1,
                imageName: "Google",
                companyName: "Google Inc.",
                companyAddress: "Mountain View, CA",
                rank: "Senior",
                position: "Product Designer",
                salary: "140k"
            ),
            .init(
                id: 2,
                imageName: "Facebook",
                companyName: "Facebook Inc.",
                companyAddress: "Mountain View, CA",
                rank: "Senior",
                position: "Product Designer",
                salary: "140k"
            ),
            .init(
                id: 3,
                imageName: "Google",
                companyName: "Google Inc.",
                companyAddress: "Mountain View, CA",
                rank: "Senior",
                position: "Product Designer",
                salary: "140k"
            ),
            .init(
                id: 4,
                imageName: "Facebook",
                companyName: "Facebook Inc.",
                companyAddress: "Menlo Park, CA",
                rank: "Senior",
                position: "iOS Developer",
                salary: "250k",
                isLiked: true
            ),
            .init(
                id: 5,
                imageName: "Google",
                companyName: "Google Inc.",
                companyAddress: "Mountain View, CA",
                rank: "Senior",
                position: "Product Designer",
                salary: "140k",
                isLiked: true
            )
        ]
    }
}
