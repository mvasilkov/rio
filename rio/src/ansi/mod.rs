pub mod charset;
pub mod control;
pub mod mode;

#[derive(Debug, Default, Eq, PartialEq, Copy, Clone, Hash)]
pub enum CursorShape {
    /// Cursor is a block like `▒`.
    Block,
    /// Cursor is an underscore like `_`.
    #[allow(unused)]
    Underline,
    /// Cursor is a vertical bar `⎸`.
    #[allow(unused)]
    Beam,
    #[default]
    Hidden,
}

#[derive(Debug)]
pub enum ClearMode {
    /// Clear below cursor.
    Below,
    /// Clear above cursor.
    Above,
    /// Clear entire terminal.
    All,
    /// Clear 'saved' lines (scrollback).
    Saved,
}

#[derive(Debug)]
pub enum TabulationClearMode {
    /// Clear stop under cursor.
    Current,
    /// Clear all stops.
    All,
}

#[derive(Debug)]
pub enum LineClearMode {
    /// Clear right of cursor.
    Right,
    /// Clear left of cursor.
    Left,
    /// Clear entire line.
    All,
}
