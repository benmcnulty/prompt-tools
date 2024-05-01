# Check if any file or directory paths were provided as arguments
if ($args.Length -eq 0) {
    # Prompt the user to enter a file path
    $input = Read-Host -Prompt 'Enter a comma-separated list of file or directory paths'
    # Split the input by commas and trim any leading or trailing whitespace
    $paths = $input.Split(',') | ForEach-Object { $_.Trim() }
} else {
    # Use the provided arguments as file or directory paths
    $paths = $args
}

# Initialize an array to hold the full paths of files to process
$fileList = @()

# Process each path
foreach ($path in $paths) {
    # Check if the provided path is a directory
    if (Test-Path $path -PathType Container) {
        # Get all the files in the directory and store their full paths
        $files = Get-ChildItem $path -File | ForEach-Object { $_.FullName }
        # Add the files to the file list
        $fileList += $files
    } else {
        # Treat the provided path as a single file path
        $fileList += $path
    }
}

# Initialize a variable to hold the formatted content for all files
$finalContent = ""

$languageMap = @{
    'ts' = 'typescript'
    'tsx' = 'tsx'
    'js' = 'javascript'
    'jsx' = 'jsx'
    'java' = 'java'
    'c' = 'c'
    'cpp' = 'cpp'
    'cs' = 'csharp'
    'go' = 'go'
    'rb' = 'ruby'
    'php' = 'php'
    'pl' = 'perl'
    'py' = 'python'
    'r' = 'r'
    'swift' = 'swift'
    'kotlin' = 'kotlin'
    'scala' = 'scala'
    'sql' = 'sql'
    'sh' = 'bash'
    'bat' = 'bat'
    'ps1' = 'powershell'
    'md' = 'markdown'
    'mdx' = 'mdx'
    'txt' = 'plaintext'
    'html' = 'html'
    'css' = 'css'
    'scss' = 'scss'
    'sass' = 'sass'
    'less' = 'less'
    'json' = 'json'
    'xml' = 'xml'
    'yml' = 'yaml'
    'yaml' = 'yaml'
    'csv' = 'csv'
    'ini' = 'ini'
    'toml' = 'toml'
    'dockerfile' = 'dockerfile'
    'lua' = 'lua'
    'erlang' = 'erlang'
    'groovy' = 'groovy'
}

# Process each file path in the list
foreach ($file in $fileList) {
    # Check if the file at the given path exists
    if (Test-Path $file) {
        # Extract the filename and file extension from the file path
        $fileName = [System.IO.Path]::GetFileNameWithoutExtension($file)
        $fileExtension = [System.IO.Path]::GetExtension($file).TrimStart('.')
        
        # Read the contents of the file
        $content = Get-Content $file -Raw
        
        # Retrieve the language identifier for the file extension from the map
        # If the file extension doesn't exist in the map, default to 'plaintext'
        $language = if ($languageMap.ContainsKey($fileExtension)) {
            $languageMap[$fileExtension]
        } else {
            'plaintext'
        }
        
        # Calculate the relative path of the file
        $relativePath = Resolve-Path -Path $file -Relative
        
        # Format the file content as a fenced code block, using the language identifier
        $formattedContent = "`n$relativePath`n``````$language`n$content`n```````n"
        
        # Add the formatted content of the current file to the final output
        $finalContent += $formattedContent
    }
    else {
        Write-Warning "File not found: $file"
    }
}

# Copy the final formatted content of all files to the clipboard
Set-Clipboard -Value $finalContent

# Print the final formatted content of all files to the console
Write-Output $finalContent