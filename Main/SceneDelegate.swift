import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let httpClient = makeAlamofireAdapter()
        let remoteAddAccount = makeRemoteAddAccount(httpClient: httpClient)
        window?.rootViewController = makeSignUpController(addAccount: remoteAddAccount)
        window?.makeKeyAndVisible()
    }

}

