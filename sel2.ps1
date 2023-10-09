# 参考記事 https://qiita.com/t13801206/items/43b96344b6ec43bf1690

 

# 実績環境

#

# PowerShell

# > get-host

# Name             : ConsoleHost

# Version          : 5.1.19041.3031

#

# .NET

# > dotnet --version

# 7.0.203

#

# selenium.webdriver.4.5.1.zip\lib\net48

#              .\WebDriver.dll        lib→net48

#

# msedgedriver.exe バージョン 117.0.2045.47 (公式ビルド) (64 ビット)

#

 

$webDriverDllPath = ".\WebDriver.dll"

$edgeDriverDirPath = ".\"

Add-Type -Path $webDriverDllPath

 

$Options = New-Object OpenQA.Selenium.Edge.EdgeOptions

$Options.AddArgument("useAutomationExtention=false")

# 「Edgeは自動テストソフトウェアによって制御されています」を非表示にする

# $Options.AddExcludedArgument("enable-automation")

# ウィンドウサイズを最大にする

$Options.AddArgument("--start-maximized")

 

# Googleで Qiita を検索する

$edgeDriver = New-Object OpenQA.Selenium.Edge.EdgeDriver($edgeDriverDirPath, $Options)

$edgeDriver.Url = https://www.google.com/

$edgeDriver.Navigate().GoToUrl(http://www.google.com)

 

# GoogleトップのHTMLは難読化されているので、gLFyfなどという意味のわからないクラス名

$x = $edgeDriver.FindElement([OpenQA.Selenium.By]::ClassName("gLFyf"))

$x.SendKeys("Qiita")

$x.SendKeys([OpenQA.Selenium.Keys]::Enter)

 

exit

 

# 補足: Idでエレメントを検索する場合

# $x = $edgeDriver.FindElement([OpenQA.Selenium.By]::Id(""))
