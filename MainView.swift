import SwiftUI

struct MainView: View {
    let white = Color(red: 255 / 255, green: 255 / 255, blue: 249 / 255)
    let purple = Color(red: 207 / 255, green: 191 / 255, blue: 247 / 255)
    let indigo = Color(red: 139 / 255, green: 128 / 255, blue: 249 / 255)
    let charcoal = Color(red: 55 / 255, green: 63 / 255, blue: 81 / 255)
    let pink = Color(red: 255 / 255, green: 53 / 255, blue: 98 / 255)
    let darkpink = Color(red: 235 / 255, green: 33 / 255, blue: 78 / 255)
    let yellow = Color(red:251/255, green:186/255, blue:114/255)
    let blue = Color(red:117/255, green:201/255, blue:200/255)
    private var screenSize: CGSize = UIScreen.main.bounds.size
    var body: some View {
        
        ZStack {
            white
            
            VStack(spacing: screenSize.width * 0.1) {
                HStack{ // Align contents to the left
                    VStack(alignment: .leading) { // Align contents to the left
                        Text("Hello")
                            .font(.title)
                            .foregroundColor(charcoal)
                        
                        Text("Samay")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(charcoal)
                    }
                    Spacer() // Takes up remaining space
                    
                    Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(indigo)
                    
                    
                }
               
                
                
             
                
                HStack(spacing: screenSize.width * 0.1) {
                    VStack() {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(pink)
                            .opacity(0.8)
                            .frame(width: screenSize.width * 0.375, height: screenSize.width * 0.215)
                            .overlay(
                                VStack(spacing:3){
                                    
                                    HStack{
                                       Image(systemName: "clock.fill")
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                        Text("62")
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                        
                                    }
                                  
                                    
                                    Text("Minutes")
                                        .fontWeight(.medium)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                            )
                    }
                    
                    VStack() {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(yellow)
                            .opacity(0.8)
                            .frame(width: screenSize.width * 0.375, height: screenSize.width * 0.215)
                            .overlay(
                                VStack (spacing:3){
                                    HStack{
                                       Image(systemName: "target")
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                        Text("71%")
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                        
                                    }
                                    
                                    Text("Accuracy")
                                        .fontWeight(.medium)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                            )
                    }
                    

                }

                
                VStack(alignment: .leading, spacing: screenSize.height * 0.0225){

                //    NavigationLink(destination: BasicShapes()){
                        Button(action: {
                            // Add haptic feedback when the button is pressed
                            let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
                            impactFeedbackgenerator.prepare()
                            impactFeedbackgenerator.impactOccurred()

                            // Add any action or code you want to perform when the button is pressed
                        }) {
                            HStack {
                                RoundedRectangle(cornerRadius: screenSize.width * 0.025)
                                    .frame(width: screenSize.width * 0.9, height: screenSize.width * 0.25)
                                    .foregroundColor(purple)
                                    .overlay(
                                        ZStack(alignment: .leading) {
                                            RoundedRectangle(cornerRadius: screenSize.width * 0.025)
                                                .frame(width: screenSize.width * 0.175, height: screenSize.width * 0.175)
                                                .foregroundColor(indigo)
                                                .opacity(0.6)
                                                .offset(x: screenSize.width * -0.2)
                                            
                                            Image(systemName: "triangle.fill")
                                                .font(.system(size: screenSize.width * 0.1))
                                                .shadow(color: yellow, radius: 0, x: 4, y: -4)
                                                .foregroundColor(.yellow)
                                                .offset(x: screenSize.width * -0.18)
                                            
                                            Text("Basic Shapes")
                                                .font(.system(size: screenSize.width * 0.07))
                                                .foregroundColor(.white)
                                                .fontWeight(.medium)
                                                .shadow(color: white, radius: 0.5)
                                                .offset(x: screenSize.width * 0.035)
                                        }
                                    )
                            }
                       // }
                    }

                    HStack{
                       
                        RoundedRectangle(cornerRadius: screenSize.width * 0.025)
                            .frame(width: screenSize.width * 0.9, height: screenSize.width * 0.25)
                            .foregroundColor(purple)
                            .overlay(
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: screenSize.width * 0.025)
                                        .frame(width: screenSize.width * 0.175, height: screenSize.width * 0.175)
                                        .foregroundColor(indigo)
                                        .opacity(0.6)
                                        .offset(x: screenSize.width * -0.175)
                                    
                                    Text("123")
                                        .font(.system(size: screenSize.width * 0.085))
                                        .shadow(color: darkpink, radius: 0, x: 0, y: -2)
                                        .foregroundColor(pink)
                                        .offset(x: screenSize.width * -0.1575)
                                    Text("Basic Numbers")
                                        .font(.system(size: screenSize.width * 0.07))
                                        .shadow(color: white, radius: 0.5)
                                        .foregroundColor(.white)
                                        .fontWeight(.medium)
                                        .offset(x: screenSize.width * 0.06) // Adjust the offset as needed
                                }
                            )


                           
                        

                            
                      
                    }
                    HStack{
                       
                        RoundedRectangle(cornerRadius: screenSize.width * 0.025)
                            .frame(width: screenSize.width * 0.9, height: screenSize.width * 0.25)
                            .foregroundColor(purple)
                            .overlay(
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: screenSize.width * 0.025)
                                        .frame(width: screenSize.width * 0.175, height: screenSize.width * 0.175)
                                        .foregroundColor(indigo)
                                        .opacity(0.6)
                                        .offset(x: screenSize.width * -0.22)
                                    
                                    Image(systemName: "scribble") // Replace with your desired SF Symbol name
                                        .font(.system(size: screenSize.width * 0.1))
                                        .shadow(color: blue, radius: 0, x: 0, y: -3)
                                        .foregroundColor(.blue)
                                        .offset(x: screenSize.width * -0.2)
                                    
                                    Text("Basic Colors")
                                        .font(.system(size: screenSize.width * 0.07))
                                        .shadow(color: white, radius: 0.5)
                                        .foregroundColor(.white)
                                        .fontWeight(.medium)
                                        .offset(x: screenSize.width * 0.025) // Adjust the offset as needed
                                }
                            )

                      
                    }
                    HStack{
                       
                        RoundedRectangle(cornerRadius: screenSize.width * 0.025)
                            .frame(width: screenSize.width * 0.9, height: screenSize.width * 0.25)
                            .foregroundColor(purple)
                            .overlay(
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: screenSize.width * 0.025)
                                        .frame(width: screenSize.width * 0.175, height: screenSize.width * 0.175)
                                        .foregroundColor(indigo)
                                        .opacity(0.6)
                                        .offset(x: screenSize.width * -0.21)
                                        .overlay(
                                            Text("ABC")
                                                .font(.system(size: screenSize.width * 0.075))
                                                .shadow(color: yellow, radius: 0, x: 0, y: -2)
                                                .foregroundColor(.yellow)
                                                .offset(x: screenSize.width * -0.21)
                                        )
                                    
                                    Text("Basic Letters")
                                        .font(.system(size: screenSize.width * 0.07))
                                        .shadow(color: white, radius: 0.5)
                                        .foregroundColor(.white)
                                        .fontWeight(.medium)
                                        .offset(x: screenSize.width * 0.025) // Adjust the offset as needed
                                }
                            )

                        
                        

                            
                      
                    }

        
                }
              
             
               
            }
            .frame(width: screenSize.width * 0.8)
            
          
          
        }
        .frame(width:screenSize.width, height: screenSize.height)
        .ignoresSafeArea()
     
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
