import SwiftUI


struct BasicShapes: View {
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
    @State private var currentShape: ShapeType = .triangle
    @State private var textBackgroundOpacity: Double = 0.0

    // Enum to represent different shapes
    enum ShapeType {
        case triangle
        case square
        case circle
        case rectangle // Add a new case for rectangle
    }
  //  @Binding var gameViewController: Int

    // Define the UI
    var body: some View {
    
            ZStack {
                white // Background color

                VStack(spacing: screenSize.width * 0.300) {
                    // Display the shape name with a background
                    ZStack { // Align contents to the left
                        Text(shapeName())
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
                    RoundedRectangle(cornerRadius: screenSize.width * 0.055)
                        .foregroundColor(.clear)
                        .frame(width: screenSize.width * 0.75, height: screenSize.width * 0.75)
                        .overlay {
                            switch currentShape {
                            case .triangle:
                                Image(systemName: "triangle.fill")
                                    .foregroundColor(pink)
                                    .font(.system(size: screenSize.width * 0.705))
                            case .square:
                                RoundedRectangle(cornerRadius: screenSize.width * 0.055)
                                    .frame(width: screenSize.width * 0.75, height: screenSize.width * 0.75)
                                    .foregroundColor(yellow)
                            case .circle:
                                Circle()
                                    .frame(width: screenSize.width * 0.75, height: screenSize.width * 0.75)
                                    .foregroundColor(blue)
                            case .rectangle: // Render the rectangle
                                RoundedRectangle(cornerRadius: screenSize.width * 0.055)
                                    .frame(width: screenSize.width * 0.75, height: screenSize.width * 0.55)
                                    .foregroundColor(green)
                            }
                        }

                
                        Button(action: {
                            if currentShape == .rectangle {
                              
                            }
                            
                            let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
                            impactFeedbackgenerator.prepare()
                            impactFeedbackgenerator.impactOccurred()
                            self.nextShape()
                        }) {
                            RoundedRectangle(cornerRadius: screenSize.width * 0.025)
                                .frame(width: screenSize.width * 0.85, height: screenSize.width * 0.25)
                                .foregroundColor(indigo)
                                .overlay(
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(.white)
                                        .font(.system(size: screenSize.width * 0.125))
                                        .fontWeight(.bold)
                                )
                        }
                    
                }
                .frame(width: screenSize.width * 0.8)
            }
            .frame(width: screenSize.width,height: screenSize.height)
            .ignoresSafeArea()
           
        }
       
    

    // Function to get the name of the current shape
    func shapeName() -> String {
        switch currentShape {
        case .triangle:
            return "TRIANGLE"
        case .square:
            return "SQUARE"
        case .circle:
            return "CIRCLE"
        case .rectangle:
            return "RECTANGLE" // Return "Rectangle" for the new shape
        }
    }

    // Function to switch to the next shape
    func nextShape() {
        switch currentShape {
        case .triangle:
            currentShape = .square
        case .square:
            currentShape = .circle
        case .circle:
            currentShape = .rectangle // Cycle to the new shape (rectangle)
        case .rectangle: // Add case for rectangle to cycle back to triangle
            currentShape = .triangle
        }
    }
}


struct BasicShapes_Previews: PreviewProvider {
    static var previews: some View {
        BasicShapes()
    }
}
