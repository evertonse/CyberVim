local status_ok, colorizer = pcall(require, 'colorizer')
if not status_ok then
  return
end
-- Attach to certain Filetypes, add special configuration for `html`
-- Use `background` for everything else.
colorizer.setup {
  '*';
  'css';
  'javascript';
  'yaml';
  'yml';
  html = {
    mode = 'foreground';
  }
}
--  |:ColorizerAttachToBuffer|
--
-- Attach to the current buffer and start highlighting with the settings as
-- specified in setup (or the defaults).
--
-- If the buffer was already attached (i.e. being highlighted), the settings will
-- be reloaded with the ones from setup. This is useful for reloading settings
-- for just one buffer.
--
-- |:ColorizerDetachFromBuffer|
--
-- Stop highlighting the current buffer (detach).
--
-- |:ColorizerReloadAllBuffers|
--
-- Reload all buffers that are being highlighted with new settings from the setup
-- settings (or the defaults). Shortcut for ColorizerAttachToBuffer on every
-- buffer.
--
-- |:ColorizerToggle|
--
-- Toggle highlighting of the current buffer.
