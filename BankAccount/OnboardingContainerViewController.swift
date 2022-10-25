//
//  OnboardingContainerViewController.swift
//  BankAccount
//
//  Created by Beltrami Dias Batista, Thiago on 24/10/22.
//

import UIKit

class OnboardingContainerViewController: UIViewController {
  
    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    var currentViewController: UIViewController
    lazy var closeButton = UIButton()
    
    let onboardingContainerViewModel = OnboardingContainerViewModel()
    
    
    override init(nibName: String?, bundle: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let onboardingContent = onboardingContainerViewModel.onboardingContent
        let page1 = OnboardingViewController(withMessage: onboardingContent[0].0,
                                             imageName: onboardingContent[0].1,
                                             imageWidth: onboardingContent[0].2,
                                             imageHeight: onboardingContent[0].3)
        let page2 = OnboardingViewController(withMessage: onboardingContent[1].0,
                                             imageName: onboardingContent[1].1,
                                             imageWidth: onboardingContent[1].2,
                                             imageHeight: onboardingContent[1].3)
        let page3 = OnboardingViewController(withMessage: onboardingContent[2].0,
                                             imageName: onboardingContent[2].1,
                                             imageWidth: onboardingContent[2].2,
                                             imageHeight: onboardingContent[2].3)
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentViewController = pages.first!
        
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupPageViewController()
        self.setupSelfView()
        self.setupCloseButton()
        
    }
    
    private func setupSelfView() {
        self.view.backgroundColor = .primaryGreen
        self.view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor)
        ])
        
        self.view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func setupPageViewController() {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true, completion: nil)
        currentViewController = pages.first!
    }
    
    private func setupCloseButton() {
        self.closeButton.setTitle("Close", for: .normal)
        self.closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        self.closeButton.setTitleColor(.primaryGreen, for: .normal)

    }

    //MARK: - Actions
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}


//MARK: - Extension - UIPageViewControllerDataSource
extension OnboardingContainerViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }
    
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), (pages.firstIndex(of: viewController)! - 1) >= 0 else {
            return nil
        }
        return pages[index - 1]
    }
    
    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), (pages.firstIndex(of: viewController)! + 1) < pages.count else {
            return nil
        }
        return pages[index + 1]
    }
    
    //MARK: - Bottom index page indicator
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentViewController) ?? 0
    }
}
