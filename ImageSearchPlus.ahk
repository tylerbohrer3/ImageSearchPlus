ImageSearchPlus(ByRef FirstName, ByRef LastName, ByRef FoundX, ByRef FoundY, ImageName, XPlus = 5, YPlus = 5, XStart = 0, YStart = 0, Clicks = 1, ColorVariance = 1)
    {
    Counter = 1
    ErrorLevel = 1
    while (ErrorLevel = 1)
        {
        ImageSearch, FoundX, FoundY, XStart, YStart, A_ScreenWidth, A_ScreenHeight, *%ColorVariance% C:\Users\%FirstName%.%LastName%\Documents\AHK Images\%ImageName%
        Counter += 1
        If (Counter = 300)
	    {
            MsgBox, 5, ImageSearch Timeout, ImageSearch could not locate %ImageName%. Press "Retry" to continue searching, or "Cancel" to terminate the script.
            IfMsgBox Retry
		{
                Counter = 1
                ErrorLevel = 1
                }
            else
                exit
            }
        If (ErrorLevel = 2)
	    {            
            MsgBox, Could not conduct the search for %ImageName%.
            exit
            }
        If (ErrorLevel = 0)
	    {
	    If (Clicks = 0)
                      return
            FoundX += XPlus
            FoundY += YPlus
            click %FoundX%, %FoundY%, %Clicks%
            }
        }
    return
    }