import sublime
import sublime_plugin
import subprocess
import re

class SqlFormatCommand(sublime_plugin.TextCommand):
  def run(self, edit):
    file_size = self.view.size()
    region = sublime.Region(0, file_size)
    content = self.view.substr(region)

    # brew install sqlfmt
    command = ["sqlfmt"]
    command.extend(["--print-width", "120"])
    command.extend(["--tab-width", "2"])
    command.extend(["--use-spaces"])
    command.extend(["--no-simplify"])

    # brew install pgformatter
    # command = ["pg_format"]
    # command.extend(["--comma-break"])
    # command.extend(["--comma-end"])
    # command.extend(["--spaces=2"])
    # command.extend(["--wrap-limit=120"])
    # command.extend(["-"])

    print("Formatting SQL:", ' '.join(command))

    result = subprocess.run(command, text=True, input=content, capture_output=True)
    if result.returncode != 0:
      raise Exception(result.stderr or result.stdout)

    formatted = result.stdout
    formatted = re.sub(r',\)', ')', formatted, flags=re.IGNORECASE)
    formatted = re.sub(r'::string', '::text', formatted, flags=re.IGNORECASE)
    formatted = re.sub(r'::bytes', '::bytea', formatted, flags=re.IGNORECASE)
    formatted = re.sub(r'::int8', '::int', formatted, flags=re.IGNORECASE)
    formatted = re.sub(r'::float8', '::float', formatted, flags=re.IGNORECASE)
    formatted = formatted.replace('e\'\\\\x', '\'\\x')
    formatted = formatted.replace('current_timestamp()', 'current_timestamp')

    self.view.replace(edit, region, formatted)
