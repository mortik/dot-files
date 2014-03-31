import sublime, sublime_plugin
import subprocess
from os.path import expanduser

class RspecCurrentFileCommand(sublime_plugin.WindowCommand):
  def spec_path(self):
    self.window.run_command("copy_relative_path")
    return sublime.get_clipboard()

  def execute_spec(self, spec_path, path_suffix):
    home = expanduser("~")
    print(spec_path)
    if "_test.rb" in spec_path:
      print("Looks like a test unit test. Running test unit")
      spec_command = ['/usr/bin/osascript', home + '/.dot-files/osascript/write_iterm2.scpt', 'ruby -Itest ' + spec_path + ' -n "/' + path_suffix + '/"']
      proc = subprocess.Popen(spec_command, stdout = subprocess.PIPE)
    elif "spec" in spec_path:
      print("Looks like a spec. Running rspec")
      spec_command = ['/usr/bin/osascript', home + '/.dot-files/osascript/write_iterm2.scpt', "rspec " + spec_path + path_suffix]
      proc = subprocess.Popen(spec_command, stdout = subprocess.PIPE)
    elif "_test.go" in spec_path:
      print("Looks like a go test. Running go test")
      spec_command = ['/usr/bin/osascript', home + '/.dot-files/osascript/write_iterm2.scpt', "go test"]
      proc = subprocess.Popen(spec_command, stdout = subprocess.PIPE)
    else:
      print("No spec file. Ignoring.")

  def run(self):
    spec_path = self.spec_path()
    if not spec_path:
      print("No file open. Ignoring")
      return
    self.execute_spec(spec_path, "")

class RspecCurrentLineInFile(RspecCurrentFileCommand):
  def run(self):
    spec_path = self.spec_path()
    print(spec_path)
    if not spec_path:
      print("No file open. Ignoring")
      return

    active_view = self.window.active_view()
    first_selection = active_view.sel()[0]
    (row,col) = active_view.rowcol(first_selection.begin())
    line = row + 1

    self.execute_spec(spec_path, ":" + str(line))
