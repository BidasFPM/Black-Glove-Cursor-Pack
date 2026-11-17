# 🧤 Black Glove Cursor Pack

A sleek black glove cursor theme for Windows, with 17 pointers covering every standard cursor state, including animated ones. Installs in one click, no admin rights required.

> Created by Bidas

## ✨ Features

- 17 cursors: static (`.cur`) and animated (`.ani`)
- One-click install and uninstall
- Per-user install, so no administrator privileges are needed
- Registers a **Black Glove** scheme in Windows, so you can switch to it anytime from *Mouse settings → Pointers → Scheme*
- Clean uninstall that restores the default cursors and removes every installed file

## 🖱️ Included cursors

| # | Cursor | Role |
|---|--------|------|
| 01 | Normal | Normal Select |
| 02 | Help | Help Select |
| 03 | Working in Background | Working in Background |
| 04 | Busy | Busy |
| 05 | Precision | Precision Select |
| 06 | Text | Text Select |
| 07 | Handwriting | Handwriting |
| 08 | Unavailable | Unavailable |
| 09 | Vertical | Vertical Resize |
| 10 | Horizontal | Horizontal Resize |
| 11 | Diagonal 1 | Diagonal Resize 1 |
| 12 | Diagonal 2 | Diagonal Resize 2 |
| 13 | Move | Move |
| 14 | Alternate Select | Alternate Select |
| 15 | Link | Link Select |
| 16 | Location | Location Select |
| 17 | Person | Person Select |

## 📦 Installation

1. Download and extract the pack (keep the folder structure intact).
2. Double-click **`Install.bat`**.
3. Done. The *Black Glove* scheme is applied immediately.

The cursors are copied to `%LOCALAPPDATA%\Cursors\BlackGlove` and the scheme is registered under your user account (`HKCU`).

> If Windows SmartScreen warns about the script, choose *More info → Run anyway*. You can inspect the scripts in the `scripts` folder first.

## 🗑️ Uninstallation

Double-click **`Uninstall.bat`**. This resets your pointers to the Windows default, removes the *Black Glove* scheme and deletes the installed cursor files.

## 📁 Structure

```
Black_Glove_Pack/
├── cursors/          # .cur and .ani files
├── scripts/
│   ├── Install.ps1
│   ├── Uninstall.ps1
|   └── Install.inf   # Alternative install (right-click → Install)
├── Install.bat
├── Uninstall.bat
└── README.txt
```

> Keep the `cursors` folder next to the `scripts` folder, otherwise the installer won't find the files.

## 🖥️ Requirements

- Windows 10 or 11
- PowerShell (included with Windows)

## 💬 Credits

Made by Bidas ([Github](https://github.com/BidasFPM)).

If you like the pack, consider leaving a ⭐ on the repo!
