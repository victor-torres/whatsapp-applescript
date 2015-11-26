on ExecuteJavascript(browser, jquery, whatsapp, conversation_title, message)
	using terms from application "Google Chrome"
		tell application browser
			repeat with w in windows
				repeat with t in tabs of w
					if URL of t starts with "https://web.whatsapp.com/" then
						execute t javascript ("var conversation_title = '" & conversation_title & "';")
						execute t javascript ("var message = '" & message & "';")
						execute t javascript jquery
						execute t javascript whatsapp
						return
					end if
				end repeat
			end repeat
		end tell
	end using terms from
end ExecuteJavascript

on run(arguments)
	set javascript_folder to POSIX path of ((the path to me as text) & "::")
	set jquery_file to (POSIX file (javascript_folder & "js/jquery.min.js"))
	set whatsapp_file to (POSIX file (javascript_folder & "js/whatsapp.js"))

	open for access jquery_file
	set jquery to (read jquery_file)
	close access jquery_file

	open for access whatsapp_file
	set whatsapp to (read whatsapp_file)
	close access whatsapp_file

	set conversation_title to quoted form of first item of arguments
	set message to quoted form of second item of arguments

	set browsers to {"Google Chrome", "Google Chrome Canary"}
	repeat with browser in browsers
		ExecuteJavascript(browser, jquery, whatsapp, conversation_title, message)
	end repeat
end run
