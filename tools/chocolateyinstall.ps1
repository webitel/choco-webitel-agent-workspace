$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://releases.webitel.com/wp/Webitel%20Agent%20Workspace%201.2.5.msi' # download url, HTTPS preferred
$url64      = $url # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi' #only one of these: exe, msi, msu
  url           = $url
  url64bit      = $url64

  softwareName  = 'webitel-agent-workspace*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum      = 'eb63afa79b782ad0b46d628a1fd2f15227bbd69c9ca6bf89d5bed7f5bf23e8f0'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = $checksum
  checksumType64= $checksumType #default is checksumType

  silentArgs   = '/qn'   # InstallShield with MSI
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs # https://docs.chocolatey.org/en-us/create/functions/install-chocolateypackage
