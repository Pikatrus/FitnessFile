import SwiftUI
import Combine

struct LimitedText: View {

    @State var username = ""

    let textLimit = 10 //Your limit
    
    var body: some View {
        //Your TextField
        TextField("Username", text: $username)
        .onReceive(Just(username)) { _ in limitText(textLimit) }
    }

    //Function to keep text length in limits
    func limitText(_ upper: Int) {
        if username.count > upper {
            username = String(username.prefix(upper))
        }
    }
}
