//
//  Created by mgor3k on 13/08/2021.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    var foregroundColor: Color = .black
    var backgroundColor: Color = .white
    var radius: CGFloat = 20
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(foregroundColor.opacity(configuration.isPressed ? 0.5 : 1))
            .font(.system(size: 18, weight: .bold, design: .default))
            .padding()
            .background(backgroundColor.opacity(configuration.isPressed ? 0.4 : 1))
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
            .shadow(color: Color.gray.opacity(configuration.isPressed ? 0.5 : 0.3), radius: 20, x: 0, y: 0)
    }
}
