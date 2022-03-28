import Foundation
import Domain

func makeAccountModel() -> AccountModel {
    return AccountModel(accessToken: "any_acessToken")
}


func makeAddAccountModel() -> AddAccountModel {
    return AddAccountModel(name: "any_name", email: "any_email@gmail.com", password: "any_password", passwordConfirmation: "any_password")
}

func makeAuthenticationModel() -> AuthenticationModel {
    return AuthenticationModel(email: "any_email@gmail.com", password: "any_password")
}
