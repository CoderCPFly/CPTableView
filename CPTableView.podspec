Pod::Spec.new do |s|
s.name         = 'CPTableView'
s.version      = '0.0.2'
s.summary      = 'An easy way to use some tableview example (set)'
s.homepage     = 'https://github.com/CoderCPFly/CPTableView'
s.license      = 'MIT'
s.authors      = {'Peng Chen' => '524662245@qq.com'}
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/CoderCPFly/CPTableView.git', :tag => s.version}
s.source_files = 'CPTableView/**/*.{h,m}'
s.resource     = 'CPTableView/CPTableView.bundle'
s.requires_arc = true
end
