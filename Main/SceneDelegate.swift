import UIKit
import UI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let nav = NavigationController()
        let httpClient = makeAlamofireAdapter()
        let remoteAddAccount = makeRemoteAddAccount(httpClient: httpClient)
        let signUpController = makeSignUpController(addAccount: remoteAddAccount)
        nav.setRootViewController(signUpController)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }

}

