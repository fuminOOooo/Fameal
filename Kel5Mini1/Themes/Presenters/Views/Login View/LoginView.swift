//
//  LoginView.swift
//  Kel5Mini1
//
//  Created by yuri wardana on 04/05/23.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage ("email") var email: String = ""//cahce property wrapper
    @AppStorage ("firstName") var firstName: String = ""//cahce property wrapper
    @AppStorage ("lastName") var lastName: String = ""//cahce property wrapper
    @AppStorage ("userId") var userId: String = ""//cahce property wrapper
    
    var body: some View {
        
        NavigationView {
            if(email != ""){
                Homepage()
            } else{
                
                    VStack{
                        Button("tes"){
                            print("Asd")
                        }
                        SignInWithAppleButton(.signIn) { request in
                            
                            request.requestedScopes = [.email , .fullName]
                            
                        } onCompletion: { result in
                            
                            switch result{
                            case .success(let auth):
                                print("masuk1")
                                switch auth.credential {
                                case let credentialData as ASAuthorizationAppleIDCredential:
                                    
                                    let userId = credentialData.user//user id
                                    
                                    let email = credentialData.email//user info
                                    let firstName = credentialData.fullName?.givenName
                                    let lastName = credentialData.fullName?.familyName
                                    
                                    self.email = email ?? ""
                                    self.userId = userId
                                    self.firstName = firstName ?? ""
                                    self.lastName = lastName ?? ""
                                    print(self.firstName)
                                default:
                                    break
                                }
                                
                            case .failure(let error):
                                print(error)
                            }
                            
                        }
                        
                        .signInWithAppleButtonStyle(
                            colorScheme == .dark ? .white : .black
                        )
                    }
                    .navigationTitle("Sign In")
                    .frame(height: 50)
                    .padding()
                    .cornerRadius(10)
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
