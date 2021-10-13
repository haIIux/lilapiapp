//
//  ErrorView.swift
//  LilWeather
//
//  Created by Rob Maltese on 10/12/21.
//

import SwiftUI

struct ErrorView: View {
    typealias ErrorViewActionHandler = () -> Void

    let error: Error
    let handler: ErrorViewActionHandler
    
    internal init(error: Error, handler: @escaping ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.handler = handler
    }
    
    var body: some View {
        VStack {
            Text("Error :(")
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError) {}
    }
}

/*
 Image(systemName: "exclamationmark.icloud.fill")
     .foregroundColor(.gray)
     .font(.system(size: 50, weight: .heavy))
     .padding(.bottom, 4)
 Text("Awe Snap!")
     .foregroundColor(.black)
     .font(.system(size: 24, weight: .heavy))
 Text(error.localizedDescription)
     .foregroundColor(.gray)
     .font(.system(size: 15))
     .multilineTextAlignment(.center)
     .padding(.vertical, 4)
 Button {
     handler()
 } label: {
     Text("Retry!")
         .foregroundColor(.white)
         .font(.system(size: 15, weight: .bold))
 }
 .padding(.vertical, 12)
 .padding(.horizontal, 30)
 .background(Color(.systemBlue))
 .cornerRadius(10)

 */
