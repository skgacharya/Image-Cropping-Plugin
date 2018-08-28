<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Image Croping</title>
    <%-- Now I Will add some js & css file Here. This is required for select crop area --%>
    <%-- you can download this Jcrop.css & jquery.Jcrop.js file from Here : https://github.com/tapmodo/Jcrop --%>
    <link href="Style/jquery.Jcrop.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.7.1.js"></script>
    <script src="Scripts/jquery.Jcrop.js"></script>
    <script lang="javascript">
        $(document).ready(function () {
            $('#<%=imgUpload.ClientID%>').Jcrop({
                onSelect: SelectCropArea
            });
        });
        function SelectCropArea(c) {
            $('#<%=X.ClientID%>').val(parseInt(c.x));
            $('#<%=Y.ClientID%>').val(parseInt(c.y));
            $('#<%=W.ClientID%>').val(parseInt(c.w));
            $('#<%=H.ClientID%>').val(parseInt(c.h));
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>Image Upload, Crop & Save using ASP.NET & Jquery</h3>
            <table>
                <tr>
                    <td>Select Image File : 
                    </td>
                    <td>
                        <asp:FileUpload ID="FU1" runat="server" />
                    </td>
                    <td>
                        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="lblMsg" runat="server" ForeColor="Red" />
                    </td>
                </tr>
            </table>
            <asp:Panel ID="panCrop" runat="server" Visible="false">
                <div id="ImageArea">
                    <asp:Image ID="imgUpload" runat="server" />
                </div>
                <asp:Button ID="btnCrop" runat="server" Text="Crop & Save" OnClick="btnCrop_Click" />
                
                <div id="hiddenValues">
                    <asp:HiddenField ID="X" runat="server" />
                    <asp:HiddenField ID="Y" runat="server" />
                    <asp:HiddenField ID="W" runat="server" />
                    <asp:HiddenField ID="H" runat="server" />
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
