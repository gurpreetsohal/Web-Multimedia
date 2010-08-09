<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string mySourceUrl = this.TextBox1.Text;
            bool isFullSize = false;
            this.Literal1.Text = this.GetWmaObject(mySourceUrl, isFullSize);
        }
        catch (Exception ex)
        {
            this.Response.Write(ex.ToString());
        }
    }

    private string GetWmaObject(string sourceUrl, bool isFullSize)
    {
        string myObjectTag = "";
        sourceUrl = sourceUrl + "";
        sourceUrl = sourceUrl.Trim();

        if (sourceUrl.Length > 0)
        {   //Continue.  
        }
        else
        {
            throw new System.ArgumentNullException("sourceUrl");
        }
        string myWidthAndHeight = "";

        if (isFullSize)
        {
            myWidthAndHeight = "";
        }
        else
        {
            myWidthAndHeight = "width='640' height='480'";
        }

        myObjectTag = myObjectTag + "<object classid='CLSID:22D6F312-B0F6-11D0-94AB-0080C74C7E95' id='player' "
            + myWidthAndHeight + " standby='Please wait while the object is loaded...'>";

        myObjectTag = myObjectTag + "<param name='url' value='" + sourceUrl + "' />";
        myObjectTag = myObjectTag + "<param name='src' value='" + sourceUrl + "' />";
        myObjectTag = myObjectTag + "<param name='AutoStart' value='true' />";
        myObjectTag = myObjectTag + "<param name='Balance' value='0' />"; //-100 is fully left, 100 is fully right.  
        myObjectTag = myObjectTag + "<param name='CurrentPosition' value='0' />"; //Position in seconds when starting.  
        myObjectTag = myObjectTag + "<param name='showcontrols' value='true' />"; //Show play/stop/pause controls.  
        myObjectTag = myObjectTag + "<param name='enablecontextmenu' value='true' />"; //Allow right-click.  
        myObjectTag = myObjectTag + "<param name='fullscreen' value='" + isFullSize.ToString() + "' />"; //Start in full screen or not.  
        myObjectTag = myObjectTag + "<param name='mute' value='false' />";
        myObjectTag = myObjectTag + "<param name='PlayCount' value='1' />"; //Number of times the content will play.  
        myObjectTag = myObjectTag + "<param name='rate' value='1.0' />"; //0.5=Slow, 1.0=Normal, 2.0=Fast  
        myObjectTag = myObjectTag + "<param name='uimode' value='full' />"; // full, mini, custom, none, invisible  
        myObjectTag = myObjectTag + "<param name='showdisplay' value='true' />"; //Show or hide the name of the file.  
        myObjectTag = myObjectTag + "<param name='volume' value='50' />"; // 0=lowest, 100=highest  
        myObjectTag = myObjectTag + "</object>";

        return myObjectTag;
    } 

</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Width="500px" Height="50px" Wrap="true"
            TextMode="multiLine" ReadOnly="false">http://download.microsoft.com/download/8/3/6/836dd5f8-fa92-499f-8219-0d326f13bf18/hilo_data_final.wmv</asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Load Video" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
