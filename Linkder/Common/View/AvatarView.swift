//
//  Created by mgor3k on 13/08/2021.
//

import SwiftUI

struct AvatarView: View {
    let imageName: String
    var outerPadding: CGFloat = 16
    
    var body: some View {
        Image(imageName)
            .resizable()
            .shadow(radius: 10)
            .frame(width: 32, height: 32)
            .padding(20)
            .background(Color.white.opacity(0.9))
            .clipShape(
                RoundedRectangle(cornerRadius: 28, style: .continuous)
            )
            .padding(outerPadding)
            .background(Color.white.opacity(0.4))
            .clipShape(
                RoundedRectangle(cornerRadius: 42, style: .continuous)
            )
            .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 0)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(imageName: "Google")
            .padding()
            .background(Color.blue)
    }
}
