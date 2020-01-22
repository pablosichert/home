const grid = new GridWM();

grid.rows = 12;
grid.cols = 12;

const cmdCtrl: ModString[] = ["command", "control"];
const cmdOptCtrl: ModString[] = ["command", "option", "control"];

Hotkey.activate(cmdCtrl, "up", () => {
  grid.moveUp(Window.focusedWindow());
});

Hotkey.activate(cmdCtrl, "right", () => {
  grid.moveRight(Window.focusedWindow());
});

Hotkey.activate(cmdCtrl, "down", () => {
  grid.moveDown(Window.focusedWindow());
});

Hotkey.activate(cmdCtrl, "left", () => {
  grid.moveLeft(Window.focusedWindow());
});

Hotkey.activate(cmdOptCtrl, "up", () => {
  grid.growAbove(Window.focusedWindow());
});

Hotkey.activate(cmdOptCtrl, "right", () => {
  grid.growRight(Window.focusedWindow());
});

Hotkey.activate(cmdOptCtrl, "down", () => {
  grid.shrinkFromAbove(Window.focusedWindow());
});

Hotkey.activate(cmdOptCtrl, "left", () => {
  grid.shrinkFromRight(Window.focusedWindow());
});
