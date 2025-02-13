//
//  PetalsParticle.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 13/2/2568 BE.
//

import SwiftUI

struct PetalsView: View {
    @EnvironmentObject var pageViewModel: PageViewModel
    @State private var bursts: [PetalsBurst] = []
    @State private var frameSize: CGSize = .zero

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(bursts) { burst in
                    PetalBurstView(burst: burst)
                }
            }
            .onAppear {
                frameSize = geometry.size
            }
            .onChange(of: pageViewModel.showPetalParticle) { _ in
                if (pageViewModel.showPetalParticle == true) {
                    startPetalsParticle(isPositive: pageViewModel.isPetalPositive)
                }
            }
        }
    }

    public func startPetalsParticle(isPositive: Bool) {
//        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let centerPoint = CGPoint(x: frameSize.width / 2, y: frameSize.height / 2) // Center of screen
                let newBurst = PetalsBurst(center: centerPoint, isPositive: isPositive)
                bursts.append(newBurst)

                // Remove burst after animation completes
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    bursts.removeAll(where: { $0.id == newBurst.id })
                }
            }
//        }
    }
}

struct PetalBurstView: View {
    let burst: PetalsBurst

    var body: some View {
        ZStack {
            ForEach(burst.particles) { particle in
                PetalParticleView(particle: particle, center: burst.center)
            }
        }
    }
}

struct PetalParticleView: View {
    let particle: PetalsParticle
    let center: CGPoint

    @State private var offset: CGSize = .zero
    @State private var opacity: Double = 1.0

    var body: some View {
        Image(particle.imageName) // Use custom image
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80) // Adjust size
            .position(center)
            .offset(offset)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeOut(duration: 1.5)) {
                    offset = CGSize(width: particle.endPoint.x, height: particle.endPoint.y)
                    opacity = 0
                }
            }
    }
}

struct PetalsBurst: Identifiable {
    let id = UUID()
    let center: CGPoint
    let particles: [PetalsParticle]

    init(center: CGPoint, isPositive: Bool) {
        self.center = center
        let particleCount: Int = Int.random(in: 12...24)
        self.particles = (0..<particleCount).map { _ in PetalsParticle(isPositive: isPositive) }
    }
}

struct PetalsParticle: Identifiable {
    let id = UUID()
    let imageName: String
    let endPoint: CGPoint

    init(isPositive: Bool) {
        imageName = isPositive ? "flowersPositive" : "flowersNegative"
        let angle = Double.random(in: 0...(2 * Double.pi))
        let distance = CGFloat.random(in: 200...300)
        let dx = distance * CGFloat(cos(angle))
        let dy = distance * CGFloat(sin(angle))

        endPoint = CGPoint(x: dx, y: dy)
    }
}

struct PetalTest: View {
    @State private var isPositive: Bool = false
    
    var body: some View {
        PetalsView()
    }
}

#Preview {
    PetalTest()
        .environmentObject(PageViewModel())
}

