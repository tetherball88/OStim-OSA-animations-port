# OStim OSA Animations Port

## Installation

1. **Download the repository as a ZIP** and drag & drop it into your MO2 downloads.
2. **Install via FOMOD** and select the modules you need. Each mod points to the original pack with animation `.hkx` files.
3. **Keep default folder names for requirements:**
   - `OSex`
   - `OSexPack Dual Wield`
   - `OSexPack Bad Girls of Skyrim`
   - `OSexPack Bad Boys of Skyrim`
   - `OSexPack Wizard Sex`
   - `OSexAttire AE`
4. **After installing this port mod:**
   - Open the folder and double-click `removeBehaviorFiles.bat`.
   - If you kept the default mod names, this will automatically remove the behavior folders from the original packs.
   - If you renamed any mod folders, manually remove `meshes\actors\character\behaviors` from each original pack.
   - This prevents Pandora/Nemesis from confusing these with FNIS animations.

---

## Patching Animations for OStim Events

Some Vanilla and all Attire module animations need to be patched to add OStim events to `.hkx` annotations (for undressing, climax, spank sound/event triggers).

**Due to strict copyright on original files, you must patch them locally using [hkanno64](https://www.nexusmods.com/skyrimspecialedition/mods/54244):**
- Follow hkanno64 installation and configure `Havok Content Tools`.

### To Patch HKX Files:

- **`update-vanilla-annotations.bat`**
  - Edit lines 14 and 16 to set your default path to `hkanno64.exe`. Or provide it manually each time you run this bat file
  - If your MO2 folder is named `OSex`, no path change is needed. Otherwise, provide the correct path to the original mod.
  - The script will process `.hkx` files and add annotation events.

- **`update-attire-annotations.bat`**
  - Edit lines 14 and 16 to set your default path to `hkanno64.exe`. Or provide it manually each time you run this bat file
  - Paste the command in your terminal each time.
  - If your MO2 folder is named `OSexAttire AE`, no path change is needed. Otherwise, provide the correct path to the original mod.
  - The script will process `.hkx` files and add annotation events.

> **Note:**
> - Patching Vanilla module `.hkx` files is optional (you'll miss spank/climax events if skipped).
> - Patching Attire module `.hkx` files is **required** (otherwise, animations won't remove clothes).

---

## Final Steps

1. Run Pandora.
2. Launch the game.

- For couple(MF) animations, look for the navigation item **"OSA OSex"** in OStim's default standing idle "Standing Apart [MF]".
- For threesome(MMF) animations, look for **"OSA Dual Wield"** in OStim's default standing "Standing MMF".
