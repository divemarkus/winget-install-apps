<#
.SYNOPSIS
  Bulk-installs common apps via Winget, converted from a Chocolatey script.

.DESCRIPTION
  - Defines a list of applications with their Winget IDs and friendly names.
  - Loops through each entry, installing with --exact and auto-accept flags.
  - Bind Tools Only has no Winget package; install ISC BIND manually if needed.
#>

[CmdletBinding()]
param(
  [string]$LogFile = "$PSScriptRoot\winget-install.log"
)

function Ensure-Administrator {
  if (-not ([Security.Principal.WindowsPrincipal] `
      [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
      [Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Please run this script as Administrator."
    exit 1
  }
}

function Install-Apps {
  $apps = @(
    @{ Id = "7zip.7zip";                         Name = "7-Zip"                    }
    @{ Id = "Adobe.Acrobat.Reader.64-bit";       Name = "Adobe Acrobat Reader"     }
    @{ Id = "Amazon.Music";                      Name = "Amazon Music"             }
    @{ Id = "Bitwarden.Bitwarden";               Name = "Bitwarden"                }
    @{ Id = "Brave.Brave";                       Name = "Brave Browser"            }
    @{ Id = "CrystalDewWorld.CrystalDiskMark";   Name = "CrystalDiskMark"          }
    @{ Id = "CPUID.CPU-Z";                       Name = "CPU-Z"                    }
    @{ Id = "CPUID.HWMonitor";                   Name = "HWMonitor"                }
    @{ Id = "curl.curl";                         Name = "curl"                     }
    @{ Id = "Discord.Discord";                   Name = "Discord"                  }
    @{ Id = "JGraph.draw";                       Name = "draw.io Desktop"          }
    @{ Id = "ar51an.iPerf3";                     Name = "iPerf3"                   }
    @{ Id = "IrfanSkiljan.IrfanView";            Name = "IrfanView"                }
    @{ Id = "IrfanSkiljan.IrfanView.Plugins";    Name = "IrfanView Plugins"        }
    @{ Id = "KeePassXCTeam.KeePassXC";           Name = "KeePassXC"                }
    @{ Id = "voidtools.Everything";              Name = "Everything"               }
    @{ Id = "Mozilla.Firefox";                   Name = "Firefox"                  }
    @{ Id = "PeterPawlowski.foobar2000";         Name = "foobar2000"               }
    @{ Id = "Google.Chrome";                     Name = "Google Chrome"            }
    @{ Id = "Google.EarthPro";                   Name = "Google Earth"             }
    @{ Id = "TechPowerUp.GPU-Z";                 Name = "GPU-Z"                    }
    @{ Id = "XBMCFoundation.Kodi";               Name = "Kodi"                     }
    @{ Id = "MullvadVPN.MullvadVPN";             Name = "Mullvad VPN"              }
    @{ Id = "Insecure.Nmap";                     Name = "Nmap"                     }
    @{ Id = "Notepad++.Notepad++";               Name = "Notepad++"                }
    @{ Id = "osquery.osquery";                   Name = "osquery"                  }
    @{ Id = "OpenRGB.OpenRGB";                   Name = "OpenRGB"                  }
    @{ Id = "dotPDN.PaintDotNet";                Name = "Paint.NET"                }
    @{ Id = "Microsoft.PowerToys";               Name = "PowerToys"                }
    @{ Id = "Microsoft.Sysinternals.Suite";      Name = "Sysinternals Suite"       }
    @{ Id = "ShareX.ShareX";                     Name = "ShareX"                   }
    @{ Id = "WhirlwindFX.SignalRgb";             Name = "SignalRGB"                }
    @{ Id = "Ookla.Speedtest.CLI";               Name = "Speedtest CLI"            }
    @{ Id = "Valve.Steam";                       Name = "Steam"                    }
    @{ Id = "IDRIX.Veracrypt";                   Name = "VeraCrypt"                }
    @{ Id = "Microsoft.VisualStudioCode";        Name = "Visual Studio Code"       }
    @{ Id = "JernejSimoncic.Wget";               Name = "Wget"                     }
    @{ Id = "WinDirStat.WinDirStat";             Name = "WinDirStat"               }
    @{ Id = "WiresharkFoundation.Wireshark";     Name = "Wireshark"                }
    @{ Id = "yt-dlp.yt-dlp";                     Name = "yt-dlp"                   }
    @{ Id = "yt-dlp.FFmpeg";                     Name = "FFmpeg"                   }
  )

  foreach ($app in $apps) {
    Write-Host "Installing $($app.Name)..." -ForegroundColor Cyan
    winget install `
      --id $($app.Id) `
      --exact `
      --accept-package-agreements `
      --accept-source-agreements `
      --silent | Tee-Object -Append -FilePath $LogFile
  }
}

# Main
Ensure-Administrator
Write-Host "Starting bulk install via Winget..." -ForegroundColor Green
Install-Apps
Write-Host "Done! Logs saved to $LogFile" -ForegroundColor Green
