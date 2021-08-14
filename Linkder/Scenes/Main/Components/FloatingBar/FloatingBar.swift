//
//  Created by mgor3k on 13/08/2021.
//

import SwiftUI

struct FloatingBar: View {
    @Namespace var namespace
    @State var selectedIndex = 0
    
    var body: some View {
        HStack(spacing: 32) {
            FloatingBarButton(
                namespace: namespace,
                systemName: "doc.on.doc.fill",
                isSelected: selectedIndex == 0,
                onTapped: {
                    selectedIndex = 0
                }
            )
            
            FloatingBarButton(
                namespace: namespace,
                systemName: "folder.fill",
                isSelected: selectedIndex == 1,
                onTapped: {
                    selectedIndex = 1
                }
            )
            
            FloatingBarButton(
                namespace: namespace,
                systemName: "person.fill",
                isSelected: selectedIndex == 2,
                onTapped: {
                    selectedIndex = 2
                }
            )
        }
        .padding(24)
        .background(
            Color.black.opacity(0.8)
        )
        .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
    }
}

struct FloatingBar_Previews: PreviewProvider {
    static var previews: some View {
        FloatingBar()
    }
}
