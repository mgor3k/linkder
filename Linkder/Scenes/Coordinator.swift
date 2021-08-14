//
//  Created by mgor3k on 13/08/2021.
//

import SwiftUI
import FlowStacks

struct Coordinator: View {
    @State var flow = NFlow<Screen>(root: .main)
    
    var body: some View {
        NStack($flow) { screen in
            switch screen {
            case .main:
                MainView(
                    viewModel: .init(
                        provider: OfferProvider(),
                        onLiked: showSuccess
                    )
                )
            case .success(let offer):
                SuccessView(
                    offer: offer,
                    onDismiss: pop
                )
            }
        }
    }
}

extension Coordinator {
    enum Screen {
        case main
        case success(Offer)
    }
    
    func showSuccess(_ offer: Offer) {
        flow.push(.success(offer))
    }
    
    func pop() {
        flow.pop()
    }
}

struct Coordinator_Previews: PreviewProvider {
    static var previews: some View {
        Coordinator()
    }
}
