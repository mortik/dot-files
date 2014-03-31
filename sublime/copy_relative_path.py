import sublime, sublime_plugin

class CopyRelativePathCommand(sublime_plugin.WindowCommand):
  def run(self):
    view = self.window.active_view()
    current_path = view.file_name()
    for path in self.window.folders():
      current_path = current_path.replace(path + '/', '')

    sublime.set_clipboard(current_path)
