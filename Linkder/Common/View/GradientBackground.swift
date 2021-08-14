//
//  Created by mgor3k on 13/08/2021.
//

import SwiftUI

struct GradientBackground: View {
    var body: some View {
        LinearGradient(
            colors: [
                .white,
                Color(.sRGB, white: 0.95, opacity: 1)
            ],
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
            .ignoresSafeArea()
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground()
    }
}
