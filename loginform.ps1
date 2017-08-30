# https://blogs.technet.microsoft.com/stephap/2012/04/23/building-forms-with-powershell-part-1-the-form/
Add-Type -AssemblyName System.Windows.Forms

$frmLogin = New-Object system.Windows.Forms.Form
$frmLogin.Text = "Login"
$frmLogin.TopMost = $true
$frmLogin.Width = 200
$frmLogin.Height = 200

$lbUser = New-Object system.windows.Forms.Label
$lbUser.Text = "User:"
$lbUser.AutoSize = $true
$lbUser.Width = 25
$lbUser.Height = 10
$lbUser.location = new-object system.drawing.point(13,1)
$lbUser.Font = "Garamond,10"
$frmLogin.controls.Add($lbUser)

$txtUser = New-Object system.windows.Forms.TextBox
$txtUser.Width = 100
$txtUser.Height = 20
$txtUser.location = new-object system.drawing.point(11,22)
$txtUser.Font = "Microsoft Sans Serif,10"
$frmLogin.controls.Add($txtUser)

$lbPwd = New-Object system.windows.Forms.Label
$lbPwd.Text = "Password:"
$lbPwd.AutoSize = $true
$lbPwd.Width = 25
$lbPwd.Height = 10
$lbPwd.location = new-object system.drawing.point(13,51)
$lbPwd.Font = "Garamond,10"
$frmLogin.controls.Add($lbPwd)

$txtPwd = New-Object system.windows.Forms.TextBox
$txtPwd.Width = 100
$txtPwd.Height = 20
$txtPwd.location = new-object system.drawing.point(13,83)
$txtPwd.Font = "Microsoft Sans Serif,10"
$frmLogin.controls.Add($txtPwd)

$btnEnter = New-Object system.windows.Forms.Button
$btnEnter.Text = "Enter"
$btnEnter.Width = 60
$btnEnter.Height = 30

$btnEnter.Add_MouseClick({
	#add here code triggered by the event
	if ( $txtUser.Text -eq "" )
	{				
		$Error = "True"
	}

	if ( $Error -eq "True" )
	{
		# TODO Label con error en rojo???? 
		#"Error!"
	}
	
	$frmLogin.Close()
})

$btnEnter.location = new-object system.drawing.point(14,121)
$btnEnter.Font = "Microsoft Sans Serif,10"
$frmLogin.controls.Add($btnEnter)

$Error = "False"

[void]$frmLogin.ShowDialog()
$frmLogin.Dispose()

"User: "+$txtUser.Text
"Password: "+$txtPwd.Text
"Error: "+$Error	
$key = Read-Host "Press key to exit..."