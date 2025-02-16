//
//  TypeOfHelpView.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 16/2/2568 BE.
//

import SwiftUI

struct TypeOfHelpView: View {
    @EnvironmentObject var photoModel: PhotoModel
    @EnvironmentObject var userModel: UserModel
    @EnvironmentObject var stressManager: StressManager
    
    var body: some View {
        ZStack {
            Image("letterPaperTexture")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .edgesIgnoringSafeArea(.all)
                .opacity(1.0)
            
            VStack {
                VStack(spacing: 0) {
                    ZStack {
                        Image("letterOfHelped")
                            .resizable()
                            .scaledToFit()
                            .padding(30)
                        
                        VStack(spacing: 40) {
                            
                            switch stressManager.checkStressLevelType {
                            case "Type1":
                                SunflowerType()
                            case "Type2":
                                LotusType()
                            case "Type3":
                                OrchidType()
                            default:
                                SunflowerType()
                            }
                            
                            if let image = photoModel.image {
                                UserCradit(userImage: image, userName: userModel.nameOfUser)
                            } else {
                                PlaceholderUserCradit()
                            }
                        }
                    }
                    
                    Button {
                        print("ddd")
                    } label: {
                        Text("Save this photo")
                            .font(.custom("ShantellSans-Medium", size: 16))
                            .foregroundColor(Color(hex: 0x483528))
                            .underline()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Button {
                    print("ddd")
                } label: {
                    ZStack {
                        Image("MainButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, alignment: .center)
                        Text("Next")
                            .font(.custom("ShantellSans-Extrabold", size: 22))
                            .foregroundColor(Color(hex: 0x483528))
                            .multilineTextAlignment(.center)
                    }
                }
                
            }
            .padding(.bottom, 30)
        }
        .background(.black)
    }
}

struct UserCradit: View {
    let userImage: UIImage
    let userName: String
    
    var body: some View {
        HStack {
            Image(uiImage: userImage)
                .resizable()
                .scaledToFill()
                .background(.red)
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            VStack {
                Text("Thank you, \(userName) \nfor your help")
                    .font(.custom("ShantellSans-Medium", size: 12))
                    .foregroundColor(Color(hex: 0x483528))
            }
        }
    }
}

struct PlaceholderUserCradit: View {
    var body: some View {
        HStack {
            Circle()
                .opacity(0.3)
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 40, height: 40)
            VStack {
                Text("Thank yo, John Doe \nfor your help")
                    .font(.custom("ShantellSans-Medium", size: 10))
                    .foregroundColor(Color(hex: 0x483528))
            }
        }
    }
}

struct SunflowerType: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("theSunflower")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            Text("You’re Sunflower")
                .font(.custom("ShantellSans-Extrabold", size: 24))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            Text("You have helped him perfectly. \nYour support will significantly \nimprove his well-being")
                .font(.custom("ShantellSans-Medium", size: 16))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal,70)
    }
}

struct LotusType: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("theLotus")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            Text("You’re Lotus")
                .font(.custom("ShantellSans-Extrabold", size: 24))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            Text("You can help him, though it \nmight not be perfect, but it's \nstill a good thing!")
                .font(.custom("ShantellSans-Medium", size: 16))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal,70)
    }
}

struct OrchidType: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("theOrchid")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            Text("You’re Orchid")
                .font(.custom("ShantellSans-Extrabold", size: 24))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            Text("You can help him! It might take \nmore time, but keep improving \nand making progress")
                .font(.custom("ShantellSans-Medium", size: 16))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal,70)
    }
}

#Preview {
    TypeOfHelpView()
        .environmentObject(PhotoModel())
}
