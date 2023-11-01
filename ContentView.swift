import SwiftUI

struct ContentView: View {
    @State var gameViewController: Int = 0



    var body: some View {
        
        if gameViewController == 0 {
            MainView()
        } else if gameViewController == 1 {
            BasicShapes()
        } else if gameViewController == 2 {
            ShapeQuestions()
        } else {
            LearningShapes()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
