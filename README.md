# Winget install scripts
The Windows Package Manager, or winget, is an open-source project developed by Microsoft. 
It is maintained by Microsoft employees and community contributors on GitHub. 
The apps available through winget are updated by their respective developers.


See [github repo](https://github.com/microsoft/winget-cli/releases)

### Getting Started (paste the code below)
**Open PowerShell as Administrator**

**Check version of winget (W11 default install)**

```
winget --version
```

**Save the script above as winget-install-apps.ps1**

**(If needed) allow script execution for this session:**

```
Set-ExecutionPolicy Bypass -Scope Process -Force
```

**Run the installer:**

```
.\winget-install-apps.ps1
```

### Install and post-install
* This will loop through each Winget ID, install the application silently, and log progress to winget-install.log. 
* Adjust or comment out entries for any rare apps that aren’t yet available in the Winget repository.

### Usage

```
# Show every installed package (all sources)
winget list

# Show only apps installed via the winget repository
winget list --source winget

# Filter by name (e.g., only Microsoft apps)
winget list Microsoft

# Search for packages containing “chrome”
winget search chrome

# Show only exact matches by ID
winget search --id Google.Chrome --exact

# Limit results to a specific source (e.g., msstore)
winget search --source msstore “visual studio”

# Install by package ID
winget install --id Google.Chrome --exact

# Install by name (falls back to best match)
winget install “Firefox”

# Accept all licensing and source terms
winget install --id Steam.Steam --accept-package-agreements --accept-source-agreements

# Example: batch install from a list
Get-Content apps.txt | ForEach-Object {
  winget install --id $_ --exact --accept-package-agreements --accept-source-agreements
}

# List upgradeable apps
winget upgrade

# Upgrade a specific app by ID
winget upgrade --id Microsoft.VisualStudioCode --exact

# Upgrade all upgradable apps in one go
winget upgrade --all --accept-package-agreements --accept-source-agreements

# Uninstall by package ID
winget uninstall --id SlackTechnologies.Slack --exact

# Uninstall by name (best match)
winget uninstall “7-Zip”

# Force-yes on prompts
winget uninstall --id VLC.VLC --silent --accept-package-agreements
```

### Requirements
* .NET Framework 4.0
* PowerShell 5.0+

### More information
* [Check it out...](https://learn.microsoft.com/en-us/windows/package-manager/winget/)

