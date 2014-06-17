import sublime, sublime_plugin
import subprocess
import re
from os.path import expanduser

class RspecCurrentFileCommand(sublime_plugin.WindowCommand):
  def spec_path(self):
    self.window.run_command("copy_relative_path")
    return sublime.get_clipboard()

  def execute_spec(self, spec_path, path_suffix):
    home = expanduser("~")

    if "spec.rb" in spec_path:
      print("Looks like a spec. Running rspec")
      spec_command = ['/usr/bin/osascript', home + '/.dot-files/osascript/write_iterm2.scpt', "rspec " + spec_path + path_suffix]
      proc = subprocess.Popen(spec_command, stdout = subprocess.PIPE)
    elif "test.rb" in spec_path:
      print("Looks like test unit. Running")
      spec_command = ['/usr/bin/osascript', home + '/.dot-files/osascript/write_iterm2.scpt', "ruby -I\"lib:test\" " + spec_path + path_suffix]
      print(spec_command)
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

class TestMethodMatcher(object):
  def __init__(self):
    self.matchers = [TestMethodMatcher.UnitTest]
  def find_first_match_in(self, test_file_content):
    for matcher in self.matchers:
      test_name = matcher.find_first_match(test_file_content)
      if test_name:
        return test_name

  class UnitTest(object):
    @staticmethod
    def find_first_match(test_file_content):
      match_obj = re.search('\s?([a-zA-Z_\d]+tset)\s+fed', test_file_content) # 1st search for 'def test_name'
      if match_obj:
        return match_obj.group(1)[::-1]

      match_obj = re.search('\s?[\"\']([a-zA-Z_\"\'\s\d\-\.#=?!:\/]+)[\"\']\s+tset', test_file_content) # 2nd search for 'test "name"'
      if match_obj:
        test_name = match_obj.group(1)[::-1]
        return "test_%s" % test_name.replace("\"", "\\\"").replace(" ", "_").replace("'", "\\'")

      return None

class RspecCurrentLineInFile(RspecCurrentFileCommand):
  def run(self):
    file_path = self.spec_path()

    if not file_path:
      print("No file open. Ignoring")
      return

    active_view = self.window.active_view()
    region = active_view.sel()[0]
    (row,col) = active_view.rowcol(region.begin())
    if "spec" in file_path:
      line = row + 1

      self.execute_spec(file_path, ":" + str(line))

    elif "test.rb" in file_path:
      # TODO construct test name
      line_region = active_view.line(region)
      text_string = active_view.substr(sublime.Region(region.begin() - 2000, line_region.end()))
      text_string = text_string.replace("\n", "\\N")
      text_string = text_string[::-1]
      test_name = TestMethodMatcher().find_first_match_in(text_string)
      print(test_name)

      self.execute_spec(file_path, " -n " + test_name)