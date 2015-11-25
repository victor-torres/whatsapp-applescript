set javascript_folder to POSIX path of ((the path to me as text) & "::")
set jquery_file to (POSIX file (javascript_folder & "js/jquery.min.js"))
set whatsapp_file to (POSIX file (javascript_folder & "js/whatsapp.js"))

open for access jquery_file
set jquery to (read jquery_file)
close access jquery_file

open for access whatsapp_file
set whatsapp to (read whatsapp_file)
close access whatsapp_file

tell application "Google Chrome"
	repeat with w in windows
		repeat with t in tabs of w
			if URL of t starts with "https://web.whatsapp.com/" then
				execute t javascript jquery
				execute t javascript whatsapp
				return
			end if
		end repeat
	end repeat
end tell
