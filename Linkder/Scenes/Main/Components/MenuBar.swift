//
//  Created by mgor3k on 13/08/2021.
//

import SwiftUI

struct MenuBar: View {
    let onSettings: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "magnifyingglass")
            }
            .buttonStyle(RoundedButtonStyle())
            
            Spacer()
            
            Button(action: onSettings) {
                Image(systemName: "slider.horizontal.3")
            }
            .buttonStyle(RoundedButtonStyle())
        }
    }
}

struct MenuBar_Previews: PreviewProvider {
    static var previews: some View {
        MenuBar(onSettings: {})
    }
}
