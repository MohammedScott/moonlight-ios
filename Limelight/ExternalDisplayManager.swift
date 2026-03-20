import UIKit

class ExternalDisplayManager {
    
    static let shared = ExternalDisplayManager()
    
    private var externalWindow: UIWindow?
    
    func startMonitoring() {
        // Check if a screen is already connected at launch
        if UIScreen.screens.count > 1 {
            handleScreenConnected(UIScreen.screens[1])
        }
        
        // Listen for screen connect
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(screenDidConnect(_:)),
            name: UIScreen.didConnectNotification,
            object: nil
        )
        
        // Listen for screen disconnect
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(screenDidDisconnect(_:)),
            name: UIScreen.didDisconnectNotification,
            object: nil
        )
    }
    
    func stopMonitoring() {
        NotificationCenter.default.removeObserver(self)
        externalWindow?.isHidden = true
        externalWindow = nil
    }
    
    @objc private func screenDidConnect(_ notification: Notification) {
        guard let screen = notification.object as? UIScreen else { return }
        handleScreenConnected(screen)
    }
    
    @objc private func screenDidDisconnect(_ notification: Notification) {
        externalWindow?.isHidden = true
        externalWindow = nil
    }
    
    private func handleScreenConnected(_ screen: UIScreen) {
        // Find the current streaming view
        guard let streamVC = findStreamViewController() else { return }
        
        // Create a fullscreen window on the external display
        let window = UIWindow(frame: screen.bounds)
        window.screen = screen
        
        // Create a blank black background controller
        let mirrorVC = ExternalStreamViewController()
        mirrorVC.streamSource = streamVC
        window.rootViewController = mirrorVC
        window.isHidden = false
        
        self.externalWindow = window
    }
    
    private func findStreamViewController() -> UIViewController? {
        guard let rootVC = UIApplication.shared.windows.first?.rootViewController else {
            return nil
        }
        return findTopViewController(rootVC)
    }
    
    private func findTopViewController(_ vc: UIViewController) -> UIViewController {
        if let presented = vc.presentedViewController {
            return findTopViewController(presented)
        }
        if let nav = vc as? UINavigationController {
            return findTopViewController(nav.visibleViewController ?? nav)
        }
        return vc
    }
}

// Fullscreen view controller shown on external monitor
class ExternalStreamViewController: UIViewController {
    
    weak var streamSource: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
    // Hide status bar on external display
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // Fullscreen with no notch/safe area issues
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
}