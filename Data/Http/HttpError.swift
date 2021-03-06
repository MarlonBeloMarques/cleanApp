import Foundation

public enum HttpError: Error {
    case noConnectivity
    case badRequest
    case serverError
    case unathorized
    case forbidden
}
