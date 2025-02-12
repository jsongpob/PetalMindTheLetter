//
//  ReceiveView.swift
//  PetalMind
//
//  Created by Songpob Hamthanan on 12/2/2568 BE.
//

import SwiftUI
import PhotosUI

struct ReceiveView: View {
    
    @EnvironmentObject var pageViewModel: PageViewModel
    @EnvironmentObject var photoModel: PhotoModel
    
    var body: some View {
        
        ZStack {
            //Background
            Image("letterPaperTexture")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                if let image = photoModel.image {
                    TakeAPhoto(image: image)
                } else {
                    PlaceholderPhoto()
                }
                
                VStack(spacing: 0) {
                    if (photoModel.image != nil) {
                        Button {
                            photoModel.isConfirming = true
                        } label: {
                            Text("Change the photo")
                                .font(.custom("ShantellSans-SemiBold", size: 16))
                                .foregroundColor(Color(hex: 0x483528))
                                .multilineTextAlignment(.center)
                        }
                    }
                    Button {
                        if (photoModel.image == nil) {
                            photoModel.isConfirming = true
                        } else {
                            print("Continue")
                        }
                    } label: {
                        ZStack {
                            Image("MainButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 290, alignment: .center)
                            Text(photoModel.image == nil ? "Take a photo" : "Continue")
                                .font(.custom("ShantellSans-Extrabold", size: 22))
                                .foregroundColor(Color(hex: 0x483528))
                                .multilineTextAlignment(.center)
                        }
                    }
                    .confirmationDialog("Choose an option", isPresented: $photoModel.isConfirming) {
                        Button("Camera"){
                            photoModel.sourceType = .camera
                            photoModel.isImagePickerPresented = true
                        }
                        Button("Photo Library"){
                            photoModel.sourceType = .photoLibrary
                            photoModel.isImagePickerPresented = true
                        }
                    }
                    .sheet(isPresented: $photoModel.isImagePickerPresented) {
                        if photoModel.sourceType == .camera {
                            ImagePicker(isPresented: $photoModel.isImagePickerPresented, image: $photoModel.image, sourceType: .camera)
                        } else {
                            PhotoPicker(selectedImage: $photoModel.image)
                        }
                    }
                }
            }
        }
    }
}

struct TakeAPhoto: View {
    let image: UIImage
    
    var body: some View {
        VStack {

            Spacer()
            
            VStack(spacing: 20) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
                
                Text("Take a photo of you \nto receive the letters")
                    .font(.custom("ShantellSans-SemiBold", size: 22))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .padding(.bottom, 40)
    }
}

struct PlaceholderPhoto: View {
    var body: some View {
        VStack {

            Spacer()
        
            VStack(spacing: 20) {
                Circle()
                    .opacity(0.3)
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
                Text("Take a photo of you \nto receive the letters")
                    .font(.custom("ShantellSans-SemiBold", size: 22))
                    .foregroundColor(Color(hex: 0x483528))
                    .multilineTextAlignment(.center)
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .padding(.bottom, 40)
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var image: UIImage?
    var sourceType: UIImagePickerController.SourceType
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.isPresented = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isPresented = false
        }
    }
}

struct PhotoPicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: PhotoPicker

        init(parent: PhotoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            if let result = results.first {
                result.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                    if let uiImage = object as? UIImage {
                        DispatchQueue.main.async {
                            self.parent.selectedImage = uiImage
                        }
                    }
                }
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }

    @Binding var selectedImage: UIImage?

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
}

#Preview {
    ReceiveView()
}
