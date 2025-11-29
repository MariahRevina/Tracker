import UIKit

// MARK: - Model for onboarding pages
struct OnboardingPage {
    let image: UIImage
    let text: String
}

extension OnboardingPage {
    static let aboutTracking = OnboardingPage(
        image: UIImage(resource: .firstOnboardingScreen),
        text: "Отслеживайте только то, что хотите"
    )
    
    static let aboutWaterAndYoga = OnboardingPage(
        image: UIImage(resource: .secondImageSсreen),
        text: "Даже если это\nне литры воды и йога"
    )
}

// MARK: - Page View Controller
final class OnboardingPageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    // MARK: - Properties
    private var pages = [UIViewController]()
    private var initialPage = 0
    var onFinishOnboarding: (() -> Void)?
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        pageControl.currentPageIndicatorTintColor = .yBlackDay
        pageControl.pageIndicatorTintColor = .yBlackDay.withAlphaComponent(0.3)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPages()
        setupPageControl()
        
        dataSource = self
        delegate = self
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }
    
    // MARK: - Setup Methods
    private func setupPages() {
        let page1 = OnboardingVC(pageModel: .aboutTracking)
        
        let page2 = OnboardingVC(pageModel: .aboutWaterAndYoga)
        
        [page1, page2].forEach { vc in
            vc.onTechnologyButtonTapped = { [weak self] in
                self?.onFinishOnboarding?()
            }
        }
        
        pages = [page1, page2]
    }
    
    private func setupPageControl() {
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -134),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {return nil}
        return currentIndex > 0 ? pages[currentIndex - 1] : nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {return nil}
        return currentIndex < pages.count - 1 ? pages[currentIndex + 1] : nil
    }
    
    // MARK: - UIPageViewControllerDelegate
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers,
        let currentVC = viewControllers.first,
        let currentIndex = pages.firstIndex(of: currentVC)
        else {return}
        pageControl.currentPage = currentIndex
    }
}

