import Foundation
import Domain

func makeAccountModel() -> AccountModel {
    return AccountModel(id: "any_id", name: "any_name", email: "any_email@gmail.com", password: "any_password", accessToken: "any_acessToken")
}


func makeAddAccountModel() -> AddAccountModel {
    return AddAccountModel(name: "any_name", email: "any_email@gmail.com", password: "any_password", passwordConfirmation: "any_password")
}
