//
//  Created by mgor3k on 13/08/2021.
//

import Foundation

struct Offer: Identifiable, Equatable {
    let id: Int
    
    let imageName: String
    let companyName: String
    let companyAddress: String
    
    let rank: String
    let position: String
    let salary: String
    
    var isLiked = false
}
