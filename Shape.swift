import SwiftUI
//import ConfettiSwiftUI
import AVKit
import AVFoundation
import AudioToolbox


struct LearningShapes: View {

    @State private var textBox: String = "Drag a shape"
    @State private var activeShape: Int? = nil
    @GestureState private var dragOffset: CGSize = .zero
    @State private var correctShapeIndex: Int = Int.random(in: 0..<4)
    @State private var lastDraggedShapeIndex: Int? = nil
  


    @State private var playedSounds: [Bool] = [false, false, false, false]
    @State private var shapeDraggabilities: [Bool] = [true, true, true, true]
    @State private var shapeOpacities: [Double] = [1.0, 1.0, 1.0, 1.0]
    @State private var viewStartTime: Date?
    let white = Color(red: 255 / 255, green: 255 / 255, blue: 249 / 255)
    let purple = Color(red: 207 / 255, green: 191 / 255, blue: 247 / 255)
    let indigo = Color(red: 139 / 255, green: 128 / 255, blue: 249 / 255)
    let charcoal = Color(red: 55 / 255, green: 63 / 255, blue: 81 / 255)
    let pink = Color(red: 255 / 255, green: 53 / 255, blue: 98 / 255)
    let darkpink = Color(red: 235 / 255, green: 33 / 255, blue: 78 / 255)
    let yellow = Color(red:251/255, green:186/255, blue:114/255)
    let blue = Color(red:117/255, green:201/255, blue:200/255)
    let green =  Color(red: 97 / 255, green: 201 / 255, blue: 168 / 255)
    private var screenSize: CGSize = UIScreen.main.bounds.size


    var body: some View {
       
        ZStack {
            white // Background color
            VStack(spacing: screenSize.width * 0.3) {
                ZStack {
                    Text(textBox)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(charcoal)
                        
                }

                RoundedRectangle(cornerRadius: screenSize.width * 0.05)
                    .frame(width: screenSize.width * 0.75, height: screenSize.width * 0.75)
                    .foregroundColor(.clear)
                    .overlay (
                        Image(systemName: shapeSystemName(correctShapeIndex))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(shapeColor(correctShapeIndex))
                            .opacity(correctShapeIndex == lastDraggedShapeIndex ? 1.0 : 0.0)
                            .offset(y:screenSize.height * -0.05)
                    )

             
                    
 

                    Button(action: {
                        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
                        impactFeedbackgenerator.prepare()
                        impactFeedbackgenerator.impactOccurred()
                        
                        handleShape()
                      
                    }) {
                        RoundedRectangle(cornerRadius: screenSize.width * 0.025)
                            .frame(width: screenSize.width * 0.85, height: screenSize.width * 0.25)
                            .foregroundColor(indigo)
                            .opacity(correctShapeIndex == lastDraggedShapeIndex ? 1 : 0.5)
                            .overlay(
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: screenSize.width * 0.125))
                                    .fontWeight(.bold)
                            )
                    }.overlay(
                    
                        HStack(spacing: screenSize.width * 0.075) {
                            ForEach(0..<4) { index in
                                let isDragging = activeShape == index
                                let systemName = shapeSystemName(index)
                                let color = shapeColor(index)
                                let offset = isDragging ? dragOffset : CGSize(width: 0, height: 0)
                                
                                Image(systemName: systemName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 45, height: 45)
                                    .foregroundColor(color)
                                    .opacity(shapeOpacities[index])
                                    .scaleEffect(isDragging ? 4.5 : 1.4)
                                    .offset(offset)
                                    .gesture(
                                        DragGesture()
                                            .updating($dragOffset) { value, state, _ in
                                                state = value.translation
                                            }
                                            .onChanged { value in
                                                if shapeDraggabilities[index] {
                                                    withAnimation {
                                                        activeShape = index
                                                     
                                                    }
                                                }
                                            }
                                            .onEnded { value in
                                                withAnimation {
                                                  
                                                    activeShape = nil
                                                    lastDraggedShapeIndex = index
                                                    checkAnswer(index)
                                                    playedSounds = [false, false, false, false]
                                                }
                                            }
                                    )
                                    .transaction { animation in
                                        animation.animation = .spring(response: 1, dampingFraction: 1)
                                    }
                            }
                        }.offset(y:screenSize.height * -0.12)
                    
                    )
                    
                
//                .offset(y:screenSize.height * -0.01)





               
                .onAppear {
                    handleShape()
                
                }
             
            }
           
            .frame(width: screenSize.width,height: screenSize.height * 1.1)
            .ignoresSafeArea()
          
        
           
        }


    }

    func checkAnswer(_ index: Int) {
      //  GameManager.share d.Sattempts += 1
        if index == correctShapeIndex {
            shapeOpacities[index] = 0
            SoundManager.instant.playSound(sound: .Tada,volume: 1.0)
        //   handleShape()
           
        } else {
           
            shapeOpacities[index] = 0.5
            shapeDraggabilities[index] = false
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
         
        }
    }
    
    func shapeSystemName(_ index: Int) -> String {
       
        return ["triangle.fill", "square.fill", "circle.fill","rectangle.fill"][index]
    }



    func handleShape() {
        shapeOpacities = [1.0,1.0,1.0,1.0]
        shapeDraggabilities = [true, true, true, true]
        let shapes: [String] = ["triangle", "square", "circle","rectangle"]
        let availableShapes = shapes.filter { $0 != shapes[correctShapeIndex] }
        let newShapeName = availableShapes.randomElement() ?? ""
        correctShapeIndex = shapes.firstIndex(of: newShapeName) ?? 0
        
        switch newShapeName {
        case "triangle":
            textBox = "TRIANGLE"
    
        case "square":
            textBox = "SQUARE"
    
        case "circle":
            textBox = "CIRCLE"
  
        case "rectangle":
            textBox = "RECTANGLE"
        default:
            break
        }
    }

    func shapeColor(_ index: Int) -> Color {
        return [pink, yellow, blue, green][index]
    }
}

struct LearningShapes_Previews: PreviewProvider {
    static var previews: some View {
        LearningShapes()
    }
}
