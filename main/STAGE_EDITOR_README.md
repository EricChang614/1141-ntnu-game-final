# Stage Editor Usage Guide

## Overview
The Stage Editor allows developers to visually create and edit platform layouts for the game. Access it from the main title screen by clicking "Stage Editor".

## Features

### Platform Management
- **Add Platform**: Click the "Add Platform" button to create a new platform at the center of the screen
- **Remove Platform**: Select a platform, then click "Remove" button or press DELETE/BACKSPACE
- **Select Platform**: Click on any platform to select it (highlighted in blue)
- **Drag Platform**: Click and drag a selected platform to move it around

### Grid System
- **Toggle Grid**: Click "Grid: ON/OFF" button to toggle grid snapping
- **Grid Size**: 10 pixels by default
- When grid is ON, platforms snap to grid positions for precise alignment

### Keyboard Controls
When a platform is selected:
- **Arrow Keys**: Move platform (snaps to grid if enabled)
- **W/S Keys**: Increase/decrease platform height
- **A/D Keys**: Decrease/increase platform width
- **SHIFT + Arrow**: Fine movement (1 pixel at a time)
- **DELETE/BACKSPACE**: Remove selected platform

### Export Functionality
1. Click the "Export" button
2. The code will be printed to the Processing console
3. Copy the generated `createPlatformsCustom()` function
4. Paste it into `Game.pde`
5. Update the Game constructor to call your new function

## Example Export Output
```processing
// ===== EXPORTED STAGE CODE =====
void createPlatformsCustom() {
  platforms.add(new Platform(100, 200, 150, 20));
  platforms.add(new Platform(300, 350, 200, 30));
  platforms.add(new Platform(0, 500, 960, 40));
}
// ===== END EXPORTED CODE =====
```

## Tips
- Use the grid for consistent platform spacing
- Test your platforms by exporting and running them in the game
- The selected platform shows its dimensions in the center
- Platform count is displayed in the top-left corner

## Navigation
- Click "Back" button to return to the title screen
