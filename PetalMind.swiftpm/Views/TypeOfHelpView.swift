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
    @EnvironmentObject var pageViewModel: PageViewModel
    @State var isSaved: Bool = false
    
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
                    
                    TypeView(stressManager: stressManager, userModel: userModel, photoModel: photoModel)
                    
                        VStack {
                            Button {
                                saveThePhotoOfType()
                                isSaved = true
                            } label: {
                                Text("Save and share this photo \nwith the people who matter to you")
                                    .font(.custom("ShantellSans-Medium", size: 16))
                                    .foregroundColor(Color(hex: 0x483528))
                                    .underline()
                                }
                            }
                            .alert("The photo has been saved.", isPresented: $isSaved) {
                                Button("OK", role: .cancel) { }
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        pageViewModel.nextToSummary()
                    }
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
    
    func saveThePhotoOfType() {
        let typeViewInstance = SavePhotoView(stressManager: stressManager, userModel: userModel, photoModel: photoModel)
            .background(Image("letterPaperTexture"))

        let renderer = ImageRenderer(content: typeViewInstance)
        renderer.scale = UIScreen.main.scale

        if let image = renderer.uiImage {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
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
    let nameofUser: String
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Image("theLotus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .opacity(0.5)
                
                Image("theSunflower")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                
                Image("theOrchid")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .opacity(0.5)
            }
            Text("\(nameofUser), \nYou’re Sunflower")
                .font(.custom("ShantellSans-Extrabold", size: 22))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            Text("You have helped him perfectly. \nYour support will significantly \nimprove his well-being")
                .font(.custom("ShantellSans-Medium", size: 16))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            
            VStack(spacing: 15) {
                Text("Mental health's impact runs deep \nand persists through time")
                    .font(.custom("ShantellSans-Medium", size: 12))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                    .opacity(0.8)
                Text("Always remember to tend to your \nmental wellbeing, \nas well as that of your loved ones")
                    .font(.custom("ShantellSans-Medium", size: 12))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                    .opacity(0.8)
            }
        }
        .padding(.horizontal, 70)
    }
}

struct LotusType: View {
    let nameofUser: String
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Image("theSunflower")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .opacity(0.5)
                
                Image("theLotus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                
                Image("theOrchid")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .opacity(0.5)
            }
            Text("\(nameofUser), \nYou’re Lotus")
                .font(.custom("ShantellSans-Extrabold", size: 22))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            Text("You can help him, though it \nmight not be perfect, but it's \nstill a good thing!")
                .font(.custom("ShantellSans-Medium", size: 16))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            
            VStack(spacing: 15) {
                Text("Mental health's impact runs deep \nand persists through time")
                    .font(.custom("ShantellSans-Medium", size: 12))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                    .opacity(0.8)
                Text("Always remember to tend to your \nmental wellbeing, \nas well as that of your loved ones")
                    .font(.custom("ShantellSans-Medium", size: 12))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                    .opacity(0.8)
            }
        }
        .padding(.horizontal,70)
    }
}

struct OrchidType: View {
    let nameofUser: String
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Image("theSunflower")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .opacity(0.5)
                
                Image("theOrchid")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                
                Image("theLotus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .opacity(0.5)
            }
            Text("\(nameofUser), \nYou’re Orchid")
                .font(.custom("ShantellSans-Extrabold", size: 22))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            Text("You can help him! It might take \nmore time, but keep improving \nand making progress")
                .font(.custom("ShantellSans-Medium", size: 16))
                .foregroundColor(Color(hex: 0x483528))
                .multilineTextAlignment(.center)
            
            VStack(spacing: 15) {
                Text("Mental health's impact runs deep \nand persists through time")
                    .font(.custom("ShantellSans-Medium", size: 12))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                    .opacity(0.8)
                Text("Always remember to tend to your \nmental wellbeing, \nas well as that of your loved ones")
                    .font(.custom("ShantellSans-Medium", size: 12))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
                    .opacity(0.8)
            }
        }
        .padding(.horizontal,70)
    }
}

struct TypeView: View {
    let stressManager: StressManager
    let userModel: UserModel
    let photoModel: PhotoModel
    
    var body: some View {
            ZStack {
                Image("letterOfHelpedLong")
                    .resizable()
                    .scaledToFit()
                    .padding(15)
                
                VStack(spacing: 30) {
                    
                    switch stressManager.checkStressLevelType {
                    case "Type1":
                        SunflowerType(nameofUser: userModel.nameOfUser)
                    case "Type2":
                        LotusType(nameofUser: userModel.nameOfUser)
                    case "Type3":
                        OrchidType(nameofUser: userModel.nameOfUser)
                    default:
                        SunflowerType(nameofUser: userModel.nameOfUser)
                    }
                    
                    if let image = photoModel.image {
                        UserCradit(userImage: image, userName: userModel.nameOfUser)
                    } else {
                        PlaceholderUserCradit()
                    }
                }
            }
    }
}

struct SavePhotoView: View {
    let stressManager: StressManager
    let userModel: UserModel
    let photoModel: PhotoModel
    
    var body: some View {
        VStack(spacing: 0) {
            TypeView(stressManager: stressManager, userModel: userModel, photoModel: photoModel)
                .frame(width: 500, height: 600)
            
            Image("logoMonoChrome")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .opacity(0.8)
        }
    }
}

#Preview {
    TypeOfHelpView()
        .environmentObject(PhotoModel())
        .environmentObject(UserModel())
        .environmentObject(StressManager())
}
