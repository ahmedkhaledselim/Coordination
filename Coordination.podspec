Pod::Spec.new do |spec|

spec.name          = "Coordination"
spec.version       = "0.1.0"
spec.summary       = "Swift coordinator pattern"
spec.description   = "Coordination is a swift framework that utilizes Coordinator pattern to separate navigation code from UI and business logic"
spec.homepage      = "https://github.com/ahmedkhaledselim/Coordination"
spec.license       = { :type => "MIT", :file => "LICENSE" }
spec.author        = { "Ahmed Khaled" => "ahmedkhaledselim1@gmail.com" }
spec.platform      = :ios, "11.0"
spec.framework     = "UIKit"
spec.source        = { :git => "https://github.com/ahmedkhaledselim/Coordination.git", :tag => "#{spec.version}" }
spec.source_files  = "Coordination/**/*.{swift}"
spec.swift_version = "5.0"

end
