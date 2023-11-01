import SwiftUI
import AVKit
import AVFoundation
import AudioToolbox

struct ShapeQuestions: View {
    // Define colors
    let white = Color(red: 255 / 255, green: 255 / 255, blue: 249 / 255)
    let purple = Color(red: 207 / 255, green: 191 / 255, blue: 247 / 255)
    let indigo = Color(red: 139 / 255, green: 128 / 255, blue: 249 / 255)
    let charcoal = Color(red: 55 / 255, green: 63 / 255, blue: 81 / 255)
    let pink = Color(red: 255 / 255, green: 53 / 255, blue: 98 / 255)
    let darkpink = Color(red: 235 / 255, green: 33 / 255, blue: 78 / 255)
    let yellow = Color(red: 251 / 255, green: 186 / 255, blue: 114 / 255)
    let blue = Color(red: 117 / 255, green: 201 / 255, blue: 200 / 255)
    let green =  Color(red: 97 / 255, green: 201 / 255, blue: 168 / 255)
    // Get the screen size
    private var screenSize: CGSize = UIScreen.main.bounds.size

    // State variables
  
    @State private var textBackgroundOpacity: Double = 0.0
    @State private var index: Int = 0
    @State private var Cindex: Int = 0
    @State private var Question:String = ""
    



    // Define the UI
    var body: some View {
        ZStack {
            white // Background color

            VStack(spacing: screenSize.width * 0.3) {

                // Display the shape name with a background
                ZStack {
                    Text(Question)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(charcoal)
                        .background(
                            RoundedRectangle(cornerRadius: screenSize.width * 0.025)
                                .frame(width: screenSize.width * 0.4, height: screenSize.width * 0.15)
                                .foregroundColor(pink)
                                .opacity(textBackgroundOpacity) // Use opacity here
                        )
                }

                RoundedRectangle(cornerRadius: screenSize.width * 0.05)
                    .frame(width:screenSize.width * 0.75, height:screenSize.width * 0.75)
                    .foregroundColor(.clear)
                    .overlay(
                        VStack{
                                              HStack{
                                                  VStack {
                                                      HStack {
                                                          Button(action: {
                                                              let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
                                                              impactFeedbackgenerator.prepare()
                                                              impactFeedbackgenerator.impactOccurred()
                                                              Cindex = 0
                                                              checkAnswer()
                                                          }) {
                                                              RoundedRectangle(cornerRadius: screenSize.width * 0.05)
                                                                  .frame(width: screenSize.width * 0.4, height: screenSize.width * 0.4)
                                                                  .foregroundColor(.gray)
                                                                  .opacity(0.25)
                                                                  .overlay(
                                                                      Image(systemName: "triangle.fill")
                                                                          .font(.system(size: screenSize.width * 0.25))
                                                                          .fontWeight(.bold)
                                                                          .foregroundColor(pink)
                                                                  )
                                                          }
                                                          
                                                          Button(action: {
                                                              let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
                                                              impactFeedbackgenerator.prepare()
                                                              impactFeedbackgenerator.impactOccurred()
                                                              Cindex = 1
                                                              checkAnswer()
                                                          }) {
                                                              RoundedRectangle(cornerRadius: screenSize.width * 0.05)
                                                                  .frame(width: screenSize.width * 0.4, height: screenSize.width * 0.4)
                                                                  .foregroundColor(.gray)
                                                                  .opacity(0.25)
                                                                  .overlay(
                                                                      Image(systemName: "square.fill")
                                                                          .font(.system(size: screenSize.width * 0.25))
                                                                          .fontWeight(.bold)
                                                                          .foregroundColor(yellow)
                                                                  )
                                                          }
                                                      }
                                                      
                                                      HStack {
                                                          Button(action: {
                                                              let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
                                                              impactFeedbackgenerator.prepare()
                                                              impactFeedbackgenerator.impactOccurred()
                                                              Cindex = 2
                                                              checkAnswer()
                                                          }) {
                                                              RoundedRectangle(cornerRadius: screenSize.width * 0.05)
                                                                  .frame(width: screenSize.width * 0.4, height: screenSize.width * 0.4)
                                                                  .foregroundColor(.gray)
                                                                  .opacity(0.25)
                                                                  .overlay(
                                                                      Image(systemName: "circle.fill")
                                                                          .font(.system(size: screenSize.width * 0.25))
                                                                          .fontWeight(.bold)
                                                                          .foregroundColor(blue)
                                                                  )
                                                          }
                                                          
                                                          Button(action: {
                                                              let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
                                                              impactFeedbackgenerator.prepare()
                                                              impactFeedbackgenerator.impactOccurred()
                                                              Cindex = 3
                                                              checkAnswer()
                                                          }) {
                                                              RoundedRectangle(cornerRadius: screenSize.width * 0.05)
                                                                  .frame(width: screenSize.width * 0.4, height: screenSize.width * 0.4)
                                                                  .foregroundColor(.gray)
                                                                  .opacity(0.25)
                                                                  .overlay(
                                                                      Image(systemName: "rectangle.fill")
                                                                          .font(.system(size: screenSize.width * 0.225))
                                                                          .fontWeight(.bold)
                                                                          .foregroundColor(green)
                                                                  )
                                                          }
                                                      }
                                                  }
                                              }
                                          }
                                      
                    
                    )
                
   
                .onAppear{
                    randomizeShapeAndQuestion()
                }

                Button(action: {
                    randomizeShapeAndQuestion()
                    Cindex = -1
                }) {
                    RoundedRectangle(cornerRadius: screenSize.width * 0.025)
                        .frame(width: screenSize.width * 0.85, height: screenSize.width * 0.25)
                        .foregroundColor(indigo)
                        .opacity(Cindex == index ? 1.0 : 0.5) // Disable the button if Cindex is not equal to index

                        .overlay(
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                                .font(.system(size: screenSize.width * 0.125))
                                .fontWeight(.bold)
                        )
                }
                .disabled(Cindex != index) // Disable the button if Cindex is not equal to index

            }
            .frame(width: screenSize.width * 0.8)
            .navigationBarTitle("")
           .navigationBarBackButtonHidden(true)
           .navigationBarHidden(true)
        }
        .frame(width: screenSize.width, height: screenSize.height)
        .ignoresSafeArea()
    }

    func randomizeShapeAndQuestion() {
        var newRandomIndex = Int.random(in: 0..<4)
        
        // Ensure the new random index is different from the old one
        while newRandomIndex == index {
            newRandomIndex = Int.random(in: 0..<4)
        }
        
        index = newRandomIndex

        switch newRandomIndex {
        case 0:
            Question = "TRIANGLE"
        case 1:
            Question = "SQUARE"
        case 2:
            Question = "CIRCLE"
        case 3:
            Question = "RECTANGLE"
        default:
            break
        }
    }

    
    
    func checkAnswer(){
        
        if Cindex == index{
            SoundManager.instant.playSound(sound: .Tada,volume: 1.0)
        }else{
            
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        }
    }
 
}


struct ShapeQuestions_Previews: PreviewProvider {
    static var previews: some View {
        ShapeQuestions()
    }
}
