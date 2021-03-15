import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var sizeAnimationAmount: CGFloat = 1
    var body: some View {
        
        NavigationView {
            VStack {
                Button(action: {
                    withAnimation {
                        self.animationAmount += 360
                    }
                }, label: {
                    LinearGradient(gradient: Gradient(colors: [.green, .black]), startPoint: .trailing, endPoint: .leading)
                        .mask(Image(systemName: "applelogo"))
                })
                .font(.system(size: 60))
                .foregroundColor(.black)
                .scaleEffect(sizeAnimationAmount)
                .rotation3DEffect(
                    .degrees(animationAmount), axis: (x: 0.0, y: 1.0, z: 0.0))
            }.navigationBarTitle("Animations")
            .navigationBarItems(trailing:
            Stepper("Increase or Decrease the size of the Apple Logo", value: $sizeAnimationAmount.animation(), in: 1...5)
                .labelsHidden())
        }
        
    }
    
    func increseSize() {
        if animationAmount == 5 {}
        else {
            animationAmount += 1
        }
    }
    func decreaseSize() {
        if animationAmount == 1 {}
        else {
            animationAmount -= 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

