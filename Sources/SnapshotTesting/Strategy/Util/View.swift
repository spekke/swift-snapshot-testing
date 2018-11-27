#if os(iOS) || os(macOS) || os(tvOS)
#if os(macOS)
import Cocoa
#endif
import SceneKit
import SpriteKit
#if os(iOS) || os(tvOS)
import UIKit
#endif
#if os(iOS) || os(macOS)
import WebKit
#endif

#if os(iOS) || os(tvOS)
public struct ViewImageConfig {
  public enum Orientation {
    case landscape
    case portrait
  }

  public var safeArea: UIEdgeInsets
  public var size: CGSize?
  public var traits: UITraitCollection

  public init(
    safeArea: UIEdgeInsets = .zero,
    size: CGSize? = nil,
    traits: UITraitCollection = .init()
    ) {
    self.safeArea = safeArea
    self.size = size
    self.traits = traits
  }

  #if os(iOS)
  public static let iPhoneSe = ViewImageConfig.iPhoneSe(.portrait)

  public static func iPhoneSe(_ orientation: Orientation) -> ViewImageConfig {
    let safeArea: UIEdgeInsets
    let size: CGSize
    switch orientation {
    case .landscape:
      safeArea = .zero
      size = .init(width: 568, height: 320)
    case .portrait:
      safeArea = .init(top: 20, left: 0, bottom: 0, right: 0)
      size = .init(width: 320, height: 568)
    }
    return .init(safeArea: safeArea, size: size, traits: .iPhoneSe(orientation))
  }

  public static let iPhone8 = ViewImageConfig.iPhone8(.portrait)

  public static func iPhone8(_ orientation: Orientation) -> ViewImageConfig {
    let safeArea: UIEdgeInsets
    let size: CGSize
    switch orientation {
    case .landscape:
      safeArea = .zero
      size = .init(width: 667, height: 375)
    case .portrait:
      safeArea = .init(top: 20, left: 0, bottom: 0, right: 0)
      size = .init(width: 375, height: 667)
    }
    return .init(safeArea: safeArea, size: size, traits: .iPhone8(orientation))
  }

  public static let iPhone8Plus = ViewImageConfig.iPhone8Plus(.portrait)

  public static func iPhone8Plus(_ orientation: Orientation) -> ViewImageConfig {
    let safeArea: UIEdgeInsets
    let size: CGSize
    switch orientation {
    case .landscape:
      safeArea = .zero
      size = .init(width: 736, height: 414)
    case .portrait:
      safeArea = .init(top: 20, left: 0, bottom: 0, right: 0)
      size = .init(width: 414, height: 736)
    }
    return .init(safeArea: safeArea, size: size, traits: .iPhone8Plus(orientation))
  }

  public static let iPhoneX = ViewImageConfig.iPhoneX(.portrait)

  public static func iPhoneX(_ orientation: Orientation) -> ViewImageConfig {
    let safeArea: UIEdgeInsets
    let size: CGSize
    switch orientation {
    case .landscape:
      safeArea = .init(top: 0, left: 44, bottom: 24, right: 44)
      size = .init(width: 812, height: 375)
    case .portrait:
      safeArea = .init(top: 44, left: 0, bottom: 34, right: 0)
      size = .init(width: 375, height: 812)
    }
    return .init(safeArea: safeArea, size: size, traits: .iPhoneX(orientation))
  }

  public static let iPhoneXsMax = ViewImageConfig.iPhoneXsMax(.portrait)

  public static func iPhoneXsMax(_ orientation: Orientation) -> ViewImageConfig {
    let safeArea: UIEdgeInsets
    let size: CGSize
    switch orientation {
    case .landscape:
      safeArea = .init(top: 0, left: 44, bottom: 24, right: 44)
      size = .init(width: 896, height: 414)
    case .portrait:
      safeArea = .init(top: 44, left: 0, bottom: 34, right: 0)
      size = .init(width: 414, height: 896)
    }
    return .init(safeArea: safeArea, size: size, traits: .iPhoneXsMax(orientation))
  }

  @available(iOS 11.0, *)
  public static let iPhoneXr = ViewImageConfig.iPhoneXr(.portrait)

  @available(iOS 11.0, *)
  public static func iPhoneXr(_ orientation: Orientation) -> ViewImageConfig {
    let safeArea: UIEdgeInsets
    let size: CGSize
    switch orientation {
    case .landscape:
      safeArea = .init(top: 0, left: 44, bottom: 24, right: 44)
      size = .init(width: 896, height: 414)
    case .portrait:
      safeArea = .init(top: 44, left: 0, bottom: 34, right: 0)
      size = .init(width: 414, height: 896)
    }
    return .init(safeArea: safeArea, size: size, traits: .iPhoneXr(orientation))
  }

  public static let iPadMini = ViewImageConfig.iPadMini(.landscape)

  public static func iPadMini(_ orientation: Orientation) -> ViewImageConfig {
    let size: CGSize
    switch orientation {
    case .landscape:
      size = .init(width: 1024, height: 768)
    case .portrait:
      size = .init(width: 768, height: 1024)
    }
    return .init(safeArea: .init(top: 20, left: 0, bottom: 0, right: 0), size: size, traits: .iPadMini)
  }

  public static let iPadPro10_5 = ViewImageConfig.iPadPro10_5(.landscape)

  public static func iPadPro10_5(_ orientation: Orientation) -> ViewImageConfig {
    let size: CGSize
    switch orientation {
    case .landscape:
      size = .init(width: 1112, height: 834)
    case .portrait:
      size = .init(width: 834, height: 1112)
    }
    return .init(safeArea: .init(top: 20, left: 0, bottom: 0, right: 0), size: size, traits: .iPadPro10_5)
  }

  public static let iPadPro12_9 = ViewImageConfig.iPadPro12_9(.landscape)

  public static func iPadPro12_9(_ orientation: Orientation) -> ViewImageConfig {
    let size: CGSize
    switch orientation {
    case .landscape:
      size = .init(width: 1366, height: 1024)
    case .portrait:
      size = .init(width: 1024, height: 1366)
    }
    return .init(safeArea: .init(top: 20, left: 0, bottom: 0, right: 0), size: size, traits: .iPadPro12_9)
  }
  #endif
}

extension UITraitCollection {
  #if os(iOS)
  public static func iPhoneSe(_ orientation: ViewImageConfig.Orientation)
    -> UITraitCollection {
      let base: [UITraitCollection] = [
        .init(displayGamut: .SRGB),
//        .init(displayScale: 2),
        .init(forceTouchCapability: .available),
        .init(layoutDirection: .leftToRight),
        .init(preferredContentSizeCategory: .medium),
        .init(userInterfaceIdiom: .phone)
      ]
      switch orientation {
      case .landscape:
        return .init(
          traitsFrom: base + [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .compact)
          ]
        )
      case .portrait:
        return .init(
          traitsFrom: base + [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .regular),
          ]
        )
      }
  }

  public static func iPhone8(_ orientation: ViewImageConfig.Orientation)
    -> UITraitCollection {
      let base: [UITraitCollection] = [
        .init(displayGamut: .P3),
//        .init(displayScale: 2),
        .init(forceTouchCapability: .available),
        .init(layoutDirection: .leftToRight),
        .init(preferredContentSizeCategory: .medium),
        .init(userInterfaceIdiom: .phone)
      ]
      switch orientation {
      case .landscape:
        return .init(
          traitsFrom: base + [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .compact)
          ]
        )
      case .portrait:
        return .init(
          traitsFrom: base + [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .regular)
          ]
        )
      }
  }

  public static func iPhone8Plus(_ orientation: ViewImageConfig.Orientation)
    -> UITraitCollection {
      let base: [UITraitCollection] = [
        .init(displayGamut: .P3),
//        .init(displayScale: 3),
        .init(forceTouchCapability: .available),
        .init(layoutDirection: .leftToRight),
        .init(preferredContentSizeCategory: .medium),
        .init(userInterfaceIdiom: .phone)
      ]
      switch orientation {
      case .landscape:
        return .init(
          traitsFrom: base + [
            .init(horizontalSizeClass: .regular),
            .init(verticalSizeClass: .compact)
          ]
        )
      case .portrait:
        return .init(
          traitsFrom: base + [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .regular)
          ]
        )
      }
  }

  public static func iPhoneX(_ orientation: ViewImageConfig.Orientation)
    -> UITraitCollection {
      let base: [UITraitCollection] = [
        .init(displayGamut: .P3),
//        .init(displayScale: 3),
        .init(forceTouchCapability: .available),
        .init(layoutDirection: .leftToRight),
        .init(preferredContentSizeCategory: .medium),
        .init(userInterfaceIdiom: .phone)
      ]
      switch orientation {
      case .landscape:
        return .init(
          traitsFrom: base + [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .compact)
          ]
        )
      case .portrait:
        return .init(
          traitsFrom: base + [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .regular)
          ]
        )
      }
  }

  public static func iPhoneXr(_ orientation: ViewImageConfig.Orientation)
    -> UITraitCollection {
      let base: [UITraitCollection] = [
        .init(displayGamut: .P3),
//        .init(displayScale: 2),
        .init(forceTouchCapability: .unavailable),
        .init(layoutDirection: .leftToRight),
        .init(preferredContentSizeCategory: .medium),
        .init(userInterfaceIdiom: .phone)
      ]
      switch orientation {
      case .landscape:
        return .init(
          traitsFrom: base + [
            .init(horizontalSizeClass: .regular),
            .init(verticalSizeClass: .compact)
          ]
        )
      case .portrait:
        return .init(
          traitsFrom: base + [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .regular)
          ]
        )
      }
  }

  public static func iPhoneXsMax(_ orientation: ViewImageConfig.Orientation)
    -> UITraitCollection {
      let base: [UITraitCollection] = [
        .init(displayGamut: .P3),
//        .init(displayScale: 3),
        .init(forceTouchCapability: .available),
        .init(layoutDirection: .leftToRight),
        .init(preferredContentSizeCategory: .medium),
        .init(userInterfaceIdiom: .phone)
      ]
      switch orientation {
      case .landscape:
        return .init(
          traitsFrom: base + [
            .init(horizontalSizeClass: .regular),
            .init(verticalSizeClass: .compact)
          ]
        )
      case .portrait:
        return .init(
          traitsFrom: [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .regular)
          ]
        )
      }
  }

  public static let iPadMini = iPad
  public static let iPadPro10_5 = iPad
  public static let iPadPro12_9 = iPad

  private static let iPad = UITraitCollection(
    traitsFrom: [
//      .init(displayScale: 2),
      .init(horizontalSizeClass: .regular),
      .init(verticalSizeClass: .regular),
      .init(userInterfaceIdiom: .pad)
    ]
  )
  #elseif os(tvOS)
  // TODO
  #endif
}
#endif

func addImagesForRenderedViews(_ view: View) -> [Async<View>] {
  return view.snapshot
    .map { async in
      [
        Async { callback in
          async.run { image in
            let imageView = ImageView()
            imageView.image = image
            imageView.frame = view.frame
            #if os(macOS)
            view.superview?.addSubview(imageView, positioned: .above, relativeTo: view)
            #elseif os(iOS) || os(tvOS)
            view.superview?.insertSubview(imageView, aboveSubview: view)
            #endif
            callback(imageView)
          }
        }
      ]
    }
    ?? view.subviews.flatMap(addImagesForRenderedViews)
}

func snapshotView(
  config: ViewImageConfig,
  traits: UITraitCollection = .init(),
  view: UIView,
  viewController: UIViewController)
  -> Async<UIImage> {
    let size = config.size ?? viewController.view.frame.size
    guard size.width > 0, size.height > 0 else {
      fatalError("View not renderable to image at size \(size)")
    }
    let initialFrame = view.frame
    view.frame.size = size
    if view != viewController.view {
      viewController.view.bounds = view.bounds
      viewController.view.addSubview(view)
    }
    let traits = UITraitCollection(traitsFrom: [config.traits, traits])
    _ = Window(
      config: .init(safeArea: config.safeArea, size: config.size ?? size, traits: traits),
      viewController: viewController
    )
    return view.snapshot ?? Async { callback in
      addImagesForRenderedViews(view).sequence().run { views in
        callback(view.layer.image(for: traits))
        views.forEach { $0.removeFromSuperview() }
        view.frame = initialFrame
      }
    }
}

class Window: UIWindow {
  var config: ViewImageConfig

  init(config: ViewImageConfig, viewController: UIViewController) {
    let size = config.size ?? viewController.view.bounds.size
    self.config = config
    super.init(frame: .init(origin: .zero, size: size))

    if viewController is UINavigationController
      || (viewController as? UITabBarController)?.selectedViewController is UINavigationController {
      self.frame.size.height -= self.config.safeArea.top
      self.config.safeArea.top = 0
    }

    let rootViewController = UIViewController()
    rootViewController.view.backgroundColor = .clear
    rootViewController.view.frame = self.frame
    rootViewController.preferredContentSize = rootViewController.view.frame.size
    viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    viewController.view.frame = rootViewController.view.frame
    rootViewController.view.addSubview(viewController.view)
    rootViewController.addChild(viewController)
    rootViewController.setOverrideTraitCollection(config.traits, forChild: viewController)
    viewController.didMove(toParent: rootViewController)
    rootViewController.beginAppearanceTransition(true, animated: false)
    rootViewController.endAppearanceTransition()
    self.rootViewController = rootViewController
//    rootViewController.view.bounds.size = self.bounds.size
    rootViewController.view.setNeedsLayout()
    rootViewController.view.layoutIfNeeded()
    self.isHidden = false
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @available(iOS 11.0, *)
  override var safeAreaInsets: UIEdgeInsets {
    let removeTopInset: Bool
    #if os(iOS)
    removeTopInset = self.config.safeArea == .init(top: 20, left: 0, bottom: 0, right: 0)
      && self.rootViewController?.prefersStatusBarHidden ?? false
    #elseif os(tvOS)
    removeTopInset = false // FIXME
    #endif
    if removeTopInset { return .zero }
    return self.config.safeArea
  }
}

extension View {
  var snapshot: Async<Image>? {
    func inWindow<T>(_ perform: () -> T) -> T {
      #if os(macOS)
      let superview = self.superview
      defer { superview?.addSubview(self) }
      let window = ScaledWindow()
      window.contentView = NSView()
      window.contentView?.addSubview(self)
      window.makeKey()
      #endif
      return perform()
    }
    #if os(iOS) || os(tvOS)
    if let glkView = self as? GLKView {
      return Async(value: inWindow { glkView.snapshot })
    }
    #endif
    if let scnView = self as? SCNView {
      return Async(value: inWindow { scnView.snapshot() })
    } else if let skView = self as? SKView {
      if #available(macOS 10.11, *) {
        let cgImage = inWindow { skView.texture(from: skView.scene!)!.cgImage() }
        #if os(macOS)
        let image = Image(cgImage: cgImage, size: skView.bounds.size)
        #elseif os(iOS) || os(tvOS)
        let image = Image(cgImage: cgImage)
        #endif
        return Async(value: image)
      } else {
        fatalError("Taking SKView snapshots requires macOS 10.11 or greater")
      }
    }
    #if os(iOS) || os(macOS)
    if let wkWebView = self as? WKWebView {
      return Async<Image> { callback in
        let delegate = NavigationDelegate()
        let work = {
          if #available(iOS 11.0, macOS 10.13, *) {
            inWindow {
              wkWebView.takeSnapshot(with: nil) { image, _ in
                _ = delegate
                callback(image!)
              }
            }
          } else {
            #if os(iOS)
            fatalError("Taking WKWebView snapshots requires iOS 11.0 or greater")
            #elseif os(macOS)
            fatalError("Taking WKWebView snapshots requires macOS 10.13 or greater")
            #endif
          }
        }

        if wkWebView.isLoading {
          delegate.didFinish = work
          wkWebView.navigationDelegate = delegate
        } else {
          work()
        }
      }
    }
    #endif
    return nil
  }
}

#if os(iOS) || os(macOS)
private final class NavigationDelegate: NSObject, WKNavigationDelegate {
  var didFinish: () -> Void

  init(didFinish: @escaping () -> Void = {}) {
    self.didFinish = didFinish
  }

  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    webView.evaluateJavaScript("document.readyState") { _, _ in
      self.didFinish()
    }
  }
}
#endif

#if os(macOS)
import Cocoa

fileprivate final class ScaledWindow: NSWindow {
  override var backingScaleFactor: CGFloat {
    return 2
  }
}
#endif

extension Array {
  func sequence<A>() -> Async<[A]> where Element == Async<A> {
    guard !self.isEmpty else { return Async(value: []) }
    return Async<[A]> { callback in
      var result = [A?](repeating: nil, count: self.count)
      result.reserveCapacity(self.count)
      var count = 0
      zip(self.indices, self).forEach { idx, async in
        async.run {
          result[idx] = $0
          count += 1
          if count == self.count {
            callback(result as! [A])
          }
        }
      }
    }
  }
}
#endif