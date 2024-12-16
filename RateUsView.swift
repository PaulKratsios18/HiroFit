//
//  RateUsView.swift
//  HiroFit
//
//  Created by Paul Kratsios on 7/21/22.
//

import SwiftUI
import UIKit
import MessageUI

//struct MailView: UIViewControllerRepresentable {
//
//    @Environment(\.presentationMode) var presentation
//    @Binding var result: Result<MFMailComposeResult, Error>?
//
//    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
//
//        @Binding var presentation: PresentationMode
//        @Binding var result: Result<MFMailComposeResult, Error>?
//
//        init(presentation: Binding<PresentationMode>,
//             result: Binding<Result<MFMailComposeResult, Error>?>) {
//            _presentation = presentation
//            _result = result
//        }
//
//        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//            defer {
//                $presentation.wrappedValue.dismiss()
//            }
//            guard error == nil else {
//                self.result = .failure(error!)
//                return
//            }
//            self.result = .success(result)
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(presentation: presentation, result: $result)
//    }
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
//        let vc = MFMailComposeViewController()
//        vc.mailComposeDelegate = context.coordinator
//        return vc
//    }
//
//    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
//        context: UIViewControllerRepresentableContext<MailView>) {
//    }
//}

struct RateUsView: View {
    
    @State private var oneStar = 0
    @State private var twoStar = 0
    @State private var threeStar = 0
    @State private var fourStar = 0
    @State private var fiveStar = 0
    
    @Binding var shouldPopToRootView : Bool
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State private var contact: String = ""
    @State private var improve: String = "Tell us how we can improve"
    @FocusState var isContactActive: Bool
    @FocusState var isImproveActive: Bool
    
    var workout: Workout
    
    var body: some View {
        VStack {
            Text("How was your experience?")
                .font(.title)
                .padding()
            Text("We would love some feedack")
                .font(.callout)
            
            Spacer()
            
            // STARS
            HStack {
                Button(action: {
                    self.oneStar = 1
                    self.twoStar = 0
                    self.threeStar = 0
                    self.fourStar = 0
                    self.fiveStar = 0
                }) {
                    if oneStar == 1 {
                        Image(systemName: "star.fill")
                            .font(.largeTitle)
                    } else {
                        Image(systemName: "star")
                            .font(.largeTitle)
                    }
                }
                
                Button(action: {
                    self.oneStar = 1
                    self.twoStar = 1
                    self.threeStar = 0
                    self.fourStar = 0
                    self.fiveStar = 0
                }) {
                    if twoStar == 1 {
                        Image(systemName: "star.fill")
                            .font(.largeTitle)
                    } else {
                        Image(systemName: "star")
                            .font(.largeTitle)
                    }
                }
                
                Button(action: {
                    self.oneStar = 1
                    self.twoStar = 1
                    self.threeStar = 1
                    self.fourStar = 0
                    self.fiveStar = 0
                }) {
                    if threeStar == 1 {
                        Image(systemName: "star.fill")
                            .font(.largeTitle)
                    } else {
                        Image(systemName: "star")
                            .font(.largeTitle)
                    }
                }
                
                Button(action: {
                    self.oneStar = 1
                    self.twoStar = 1
                    self.threeStar = 1
                    self.fourStar = 1
                    self.fiveStar = 0
                }) {
                    if fourStar == 1 {
                        Image(systemName: "star.fill")
                            .font(.largeTitle)
                    } else {
                        Image(systemName: "star")
                            .font(.largeTitle)
                    }
                }
                
                Button(action: {
                    self.oneStar = 1
                    self.twoStar = 1
                    self.threeStar = 1
                    self.fourStar = 1
                    self.fiveStar = 1
                }) {
                    if fiveStar == 1 {
                        Image(systemName: "star.fill")
                            .font(.largeTitle)
                    } else {
                        Image(systemName: "star")
                            .font(.largeTitle)
                    }
                }
            }
            
            Spacer()
            
            TextField(" Email or Phone", text: $contact)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
//                .frame(width: UIScreen.main.bounds.width - 40, alignment: .center)
//                .background(.secondary)
                .padding()
//                .toolbar {
//                    ToolbarItemGroup(placement: .keyboard) {
//                        Spacer()
//                        Button("Done") {
//                            isContactActive = false
//                        }
//                    }
//                }
            
            TextEditor(text: $improve)
                .frame(width: UIScreen.main.bounds.width - 40, alignment: .center)
                .cornerRadius(16)
                .border(.gray)
                .padding()
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isImproveActive.toggle()
                        }
                    }
                }
//            TextField(" Tell us how we can improve", text: $improve)
//                .textFieldStyle(.roundedBorder)
//                .frame(width: UIScreen.main.bounds.width - 40, alignment: .center)
//                .border(.secondary)
//                .padding()
//                .frame(width: UIScreen.main.bounds.width - 40, alignment: .center)
//                .textFieldStyle(PlainTextFieldStyle())
//                .padding([.leading, .trailing], 4)
//                .cornerRadius(16)
//                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray).padding(.bottom, -150).padding(.top, 50))
//                .padding([.leading, .trailing], 24)
               
            Spacer()
            Spacer()
            
            Button (action: {
                self.shouldPopToRootView = false
                
            } ) {
                Text("Submit")
                    .foregroundColor(Color(UIColor.systemBackground))
                    .frame(width: 200)
                    .padding()
                    .background(Color("Logo"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
//            .disabled(!MFMailComposeViewController.canSendMail())f
//            .sheet(isPresented: $isShowingMailView) {
//                MailView(result: self.$result)
//
//            }
        }
        .navigationBarTitle("Submit Feedback", displayMode: .inline)
//        .navigationBarHidden(true)
    }
}

//struct RateUsView_Previews: PreviewProvider {
//    static var previews: some View {
//        RateUsView(shouldPopToRootView: false)
//    }
//}
