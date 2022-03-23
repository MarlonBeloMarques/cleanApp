import Foundation
import Presentation

func makeSignUpViewModel(name: String? = "any_name", email: String? = "any_email@gmail.com", password: String? = "any_password", passwordConfirmation: String? = "any_password") -> SignUpViewModel {
    return SignUpViewModel(name: name, email: email, password: password, passwordConfirmation: passwordConfirmation)
}
