# prompt-tools

## [FilesAsText.ps1](./FilesAsText.ps1)

This PowerShell script is designed to streamline the crafting of AI prompts for use with large language models (LLMs) in a chat interface. It accepts a file path, a list of paths, or a directory as input and transforms the text content of code files into a fenced markdown format. This formatted text is displayed in the terminal and simultaneously copied to the clipboard, facilitating easy pasting into your LLM-connected chat interface.

The output format is specifically designed for AI prompt crafting. It includes the file name along with its relative path. The content of the file(s) is encapsulated in fenced markdown, with an appropriate keyword indicating the file type. This tool simplifies the process of preparing code for AI chat interaction, making it an essential resource for those leveraging AI as a coding assistant.

### Prerequisites

You need to have PowerShell installed on your machine to run this script.

### Usage

1. Open a PowerShell terminal.
2. Navigate to the directory containing the [`FilesAsText.ps1`](./FilesAsText.ps1) script.
3. Run the script with a file path, a list of paths, or a directory as an argument. The paths should be relative to the current directory.

**Note:** If you run the script without any arguments, it will prompt you to enter a comma-separated list of file or directory paths.

> **Security Note:** `FilesAsText.ps1` is an unsigned script, which may require you to modify your execution policy temporarily to run it. Before doing so, understand the implications of changing the execution policy. You can adjust your execution policy for the current PowerShell session by executing the following command:
>
> ```powershell
> Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
> ```
>
> This command alters the security policy only for the duration of the current PowerShell session, enabling you to run the script without hindrance. Once you close the terminal, the policy will automatically revert to its original state.

### Examples

#### Using a single file path as an argument

```powershell
.\FilesAsText.ps1 FilesAsText.ps1
```

This will output and copy to the clipboard the content of the `FilesAsText.ps1` script.

#### Using a comma-separated list of paths

```powershell
.\FilesAsText.ps1 ./FilesAsText.ps1,./README.md
```

This will output and copy to the clipboard the content of the `FilesAsText.ps1` script and the README.

#### Using a directory as an argument

```powershell
.\FilesAsText.ps1 .
```

This will output and copy to the clipboard the content of all files in the current directory, including the `FilesAsText.ps1` script, the license, and the README.

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

If the script doesn't run because PowerShell displays a security warning, see the Security Note in the [Usage](#usage) section. If the problem persists, please open an issue in this repository.

## Credits

Created with ChatGPT by [Ben McNulty](https://github.com/benmcnulty) via [Automation](https://chat.openai.com/g/g-cII2Li1S9-automation) from [Promptfolio](https://promptfolio.dev) and [GitHub Copilot](https://copilot.github.com).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
