TCPStartup()
Func _HTTPRead($socket)
	Local $timer = TimerInit();Dim $performancetimer = TimerInit() ;Local $downloadtime = 0
	Local $headers[1][2] ; An Array of the headers found
	Local $numheaders = 0 ; The number of headers found
	Local $body = '' ; The body of the message
	Local $HTTPVersion ; The HTTP version of the server (almost always 1.1)
	Local $HTTPResponseCode ; The HTTP response code like 200, or 404
	Local $HTTPResponseReason ; The human-readable response reason, like "OK" or "Not Found"
	Local $bytesreceived = 0 ; The total number of bytes received
	Local $data = '' ; The entire raw message gets put in here.
	Local $chunked = 0 ; Set to 1 if we get the "Transfer-Encoding: chunked" header.
	Local $chunksize = 0 ; The size of the current chunk we are processing.
	Local $chunkprocessed = 0 ; The amount of data we have processed on the current chunk.
	Local $contentlength ; The size of the body, if NOT using chunked transfer mode.
	Local $part = 0 ; Refers to what part of the data we're currently parsing:
	While 1
		Local $recv = TCPRecv($socket, 16)
		If $recv <> "" Then
			$bytesreceived += StringLen($recv)
			$timer = TimerInit()
			$data &= $recv;ConsoleWrite("Bytes downloaded: "&$bytesreceived&@CRLF)
		EndIf
		Local $split = StringSplit($data,@CRLF,1)
		$data = ""
		For $i=1 To $split[0]
			If $i=$split[0] Then
				If $part < 2 OR $chunked = 1 Then
					; This is tricky. The last line we've received might be truncated, so we only want to process it under special cases.
					; Non chunked data doesn't always send a CRLF at the end so there's no way to tell if this is truly the last line without parsing it.
					; However, we don't want to parse it if it's only a partial header or something.
					; The solution: We will only process this last line if we're at the body section and the transfer-encoding is NOT chunked.
					$data = $split[$i]
					ExitLoop
				EndIf
			EndIf
			Local $newpart = $part
			Switch $part
				Case 0 ; Nothing parsed, so HTTP response should come next
					If $split[$i] <> "" Then
						Local $regex = StringRegExp($split[$i],"^HTTP/([0-9.]+) ([0-9]+) ([a-zA-Z0-9 ]+)$",3)
						If @error <> 0 Then
							SetError(5)
							Return $split[$i]
						Else
							$HTTPVersion = $regex[0]
							$HTTPResponseCode = $regex[1]
							$HTTPResponseReason = $regex[2]
							If $HTTPResponseCode <> 100 Then $newpart = 1
						EndIf
					EndIf
				Case 1, 4 ; Currently parsing headers or footers
					;If the line is blank, then we're done with headers and the body is next
					If $split[$i] == "" Then
						If $part = 1 Then
							If $chunked Then
								$newpart = 2
							Else
								$newpart = 3
							EndIf
						ElseIf $part = 4 Then; If $part is 4 then we're processing footers, so we're all done now.
							ExitLoop 2
						EndIf
					Else ;The line wasn't blank
						;Check to see if the line begins with whitespace. If it does, it's actually
						;a continuation of the previous header
						Local $regex = StringRegExp($split[$i], "^[ \t]+([^ \t].*)$", 3)
						If @error <> 1 Then
							If $numheaders == 0 Then
								SetError(6)
								Return $split[$i]
							EndIf
							$headers[$numheaders-1][1] &= $regex[0]
						Else;The line didn't start with a space
							Local $regex = StringRegExp($split[$i],"^([^ :]+):[ \t]*(.*)$",3)
							If @error <> 1 Then;This is a new header, so add it to the array
								$numheaders = $numheaders + 1
								ReDim $headers[$numheaders][2]
								$headers[$numheaders-1][0] = $regex[0]
								$headers[$numheaders-1][1] = $regex[1]
								; There are a couple headers we need to know about. We'll process them here.
								If $regex[0] = "Transfer-Encoding" AND $regex[1] = "chunked" Then
									$chunked = 1
								ElseIf $regex[0] = "Content-Length" Then
									$contentlength = Int($regex[1])
								EndIf
							Else
								SetError(6)
								Return $split[$i]
							EndIf
						EndIf
					EndIf
				Case 2 ; Awaiting chunk size
					$regex = StringRegExp($split[$i],"^([0-9a-f]+);?.*$",3)
					If @error <> 0 Then
						SetError(8)
						Return $split[$i]
					EndIf
					$chunksize = $regex[0]
					$chunksize = Dec($chunksize)
					$chunkprocessed = 0
					If $chunksize == 0 Then
						$newpart = 4
					Else
						$newpart = 3
					EndIf
				Case 3 ; Awaiting body data
					$body &= $split[$i]
					$chunkprocessed = $chunkprocessed + StringLen($split[$i])
					If $chunked Then
						If $chunkprocessed >= $chunksize Then
							$newpart = 2
						Else
							$body &= @CRLF
							$chunkprocessed = $chunkprocessed + 2; We add 2 for the CRLF we stipped off.
						EndIf
					Else
						If $chunkprocessed >= $contentlength Then
							ExitLoop 2
						Else
							If $i < $split[0] Then; Only add a CRLF if this is not the last line received.
								$body &= @CRLF
								$chunkprocessed = $chunkprocessed + 2; We add 2 for the CRLF we stipped off.
							EndIf
						EndIf
					EndIf
			EndSwitch
			$part = $newpart
		Next
		If $bytesreceived == 0 AND TimerDiff($timer) > 5000 Then;Global $_HTTPRecvTimeout = 5000
			SetError(3)
			Return 0
		ElseIf $bytesreceived > 0 AND TimerDiff($timer) > 5000 Then
			SetError(4)
			Return $bytesreceived
		EndIf
	WEnd
	SetError(0)
	Return $body
EndFunc