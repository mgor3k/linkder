//
//  Created by mgor3k on 13/08/2021.
//

import SwiftUI
import ConfettiSwiftUI

struct SuccessView: View {
    @State var counter = 1
    
    let offer: Offer
    let onDismiss: () -> Void
    
    var body: some View {
        ZStack {
            GradientBackground()
            
            ConfettiCannon(counter: $counter)
            
            VStack(spacing: 48) {
                HStack {
                    Button(action: onDismiss) {
                        Image(systemName: "arrow.backward")
                    }
                    .buttonStyle(RoundedButtonStyle())
                    
                    Spacer()
                }
                
                GeometryReader { proxy in
                    Circle()
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.1), radius: 50, x: 0, y: 0)
                        .frame(
                            width: proxy.size.width / 2,
                            height: proxy.size.width / 2
                        )
                        .frame(maxWidth: .infinity, alignment: .center)
                        .overlay(
                            Image(systemName: "suit.heart.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.green)
                                .shadow(color: .green.opacity(0.2), radius: 20, x: 0, y: 0)
                                .frame(width: proxy.size.width / 5)
                        )
                        .onTapGesture {
                            counter += 1
                        }
                }
                
                Spacer()
                
                ZStack {
                    AvatarView(
                        imageName: offer.imageName,
                        outerPadding: 8
                    )
                        .offset(x: -15, y: -30)
                    AvatarView(
                        imageName: "Avatar",
                        outerPadding: 8
                    )
                        .offset(x: 15, y: 15)
                }
                
                VStack(spacing: 12) {
                    Text("SUCCESS_TITLE")
                        .bold()
                        .font(.title)
                    
                    Text("SUCCESS_CAPTION")
                }
                
                HStack(spacing: 32) {
                    Button(action: {}) {
                        Text("SUCCESS_SAVE")
                            .padding()
                            .padding(.horizontal, 8)
                    }
                    .buttonStyle(RoundedButtonStyle(radius: 30))
                    
                    Button(action: {}) {
                        Text("SUCCESS_APPLY")
                            .padding()
                            .padding(.horizontal, 8)
                    }
                    .buttonStyle(RoundedButtonStyle(foregroundColor: .white, backgroundColor: .black, radius: 30))
                }
            }
            .padding(24)
        }
        .navigationBarHidden(true)
        .onAppear(perform: start)
    }
    
    func start() {
        counter += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            start()
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(
            offer: OfferProvider().getOffers()[0],
            onDismiss: {}
        )
    }
}
