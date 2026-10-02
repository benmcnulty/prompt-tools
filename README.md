# prompt-tools

## [FilesAsText.ps1](./FilesAsText.ps1)

This PowerShell script is designed to streamline the crafting of AI prompts for use with large language models (LLMs) in a chat interface. It accepts a file path, a list of paths, or a directory as input and transforms the text content of code files into a fenced markdown format. This formatted text is displayed in the terminal and simultaneously copied to the clipboard, facilitating easy pasting into your LLM-connected chat interface.

The output format is specifically designed for AI prompt crafting. It includes the file name along with its relative path. The content of the file(s) is encapsulated in fenced markdown, with an appropriate keyword indicating the file type. This tool simplifies the process of preparing code for AI chat interaction, providing a small file-to-prompt preparation utility.

### Prerequisites

You need to have PowerShell installed on your machine to run this script.

### Usage

1. Open a PowerShell terminal.
2. Navigate to the directory containing the [`FilesAsText.ps1`](./FilesAsText.ps1) script.
3. Run the script with a file path, a list of paths, or a directory as an argument. The paths should be relative to the current directory.

**Note:** If you run the script without any arguments, it will prompt you to enter a comma-separated list of file or directory paths.

The script overwrites the clipboard on every run and also prints the full text
to the terminal. Review its source and use your organization's existing script
execution policy; a policy bypass is not a prerequisite of this tool.

Directories include only their immediate files, without recursion. Selection does
not apply `.gitignore`, a credential filter or a binary-file filter. Prefer
explicit text-file paths, inspect the output before sharing it, and keep secrets,
personal data and generated/binary assets out of the selection. The script does
not itself contact an LLM or send network requests.

### Examples

#### Using a single file path as an argument

```powershell
.\FilesAsText.ps1 FilesAsText.ps1
```

This will output and copy to the clipboard the content of the `FilesAsText.ps1` script.

#### Passing multiple paths

```powershell
.\FilesAsText.ps1 .\FilesAsText.ps1 .\README.md
```

This will output and copy to the clipboard the content of the `FilesAsText.ps1` script and the README.

#### Using a directory as an argument

```powershell
.\FilesAsText.ps1 .
```

This will output and copy to the clipboard the content of all files in the current directory, including the `FilesAsText.ps1` script, the license, and the README. Subdirectories are not traversed; use this form only after reviewing all immediate files.

#### Using No Arguments

When you run the script without any arguments, it will prompt you to enter a comma-separated list of file or directory paths.

```powershell
.\FilesAsText.ps1
```

When prompted, enter the paths:

```plaintext
FilesAsText.ps1,README.md
```

This will output and copy to the clipboard the content of the `FilesAsText.ps1` script and the README.

## Troubleshooting

If you encounter any issues while using this script, make sure that the paths you're providing are correct and that the files exist.

The host must support `Set-Clipboard`; clipboard availability depends on the
PowerShell installation and operating system. No automated test suite or build
step is committed. If execution is blocked by policy, review the script with your
administrator rather than changing system-wide policy. Contributions should
include the PowerShell version and explicit, non-sensitive input paths needed to
reproduce the issue.

## Credits

Created with ChatGPT by [Ben McNulty](https://github.com/benmcnulty) via [Automation](https://chat.openai.com/g/g-cII2Li1S9-automation) from [Promptfolio](https://promptfolio.dev) and [GitHub Copilot](https://copilot.github.com).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
