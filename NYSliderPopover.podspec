Pod::Spec.new do |s|
  s.name     = 'NYSliderPopover'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'A UISlider Category to display a popover above slider'
  s.homepage = 'http://nyvra.net'
  s.author   = { 'Nyvra Software' => 'nyvra@nyvra.net' }
  s.source   = { :git => 'https://github.com/Nyvra/NYSliderpopover', :commit => '0390361ca626c984d5b55df348f75135bc16a36b' }

  s.source_files = 'NYSliderPopover/*.{h,m}'
  s.requires_arc = true
end
