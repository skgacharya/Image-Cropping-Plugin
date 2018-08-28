<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.7.1.js" type="text/javascript"></script>

    <script src="Scripts/jquery.Jcrop.js" type="text/javascript"></script>

    <link href="Style/jquery.Jcrop.css" rel="stylesheet" type="text/css" />

   

    <script type="text/javascript">

        $(function() {                   

            $('#ImFullImage').Jcrop({

                onSelect: updateCoords,

                onChange: updateCoords

            });

        });

        function updateCoords(c) {

            $('#hfX').val(c.x);

            $('#hfY').val(c.y);

            $('#hfHeight').val(c.h);

            $('#hfWidth').val(c.w);

        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
 
    <asp:HiddenField ID="hfX" runat="server" />

    <asp:HiddenField ID="hfY" runat="server" />

    <asp:HiddenField ID="hfHeight" runat="server" />

    <asp:HiddenField ID="hfWidth" runat="server" />

    <div>   

     Original Image: <br />

       <asp:Image ID="ImFullImage" ImageUrl="~/Images/Cartoons.jpg" runat="server" /><br />

        <asp:Button ID="btnCrop" runat="server" Text="Crop Image" onclick="btnCrop_Click" /><br />

    </div>

    <br />

    <div>

      Cropped Image:<br />

        <asp:Image ID="imCropped" runat="server" />

    </div>


    </form>
</body>
</html>
