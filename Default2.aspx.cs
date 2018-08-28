using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void CropImage(string path, int X, int Y, int Width, int Height)
    {
        using (System.Drawing.Image img = System.Drawing.Image.FromFile(path))
        {
            string ImgName = System.IO.Path.GetFileName(path);
            using (Bitmap bmpCropped = new Bitmap(Width, Height))
            {
                using (Graphics g = Graphics.FromImage(bmpCropped))
                {
                    Rectangle rectDestination = new Rectangle(0, 0, bmpCropped.Width, bmpCropped.Height);
                    Rectangle rectCropArea = new Rectangle(X, Y, Width, Height);
                    g.DrawImage(img, rectDestination, rectCropArea, GraphicsUnit.Pixel);
                    string SaveTo = Server.MapPath(".") + @"\CroppedImages\" + ImgName;
                    bmpCropped.Save(SaveTo);
                    string CroppedImg = Request.ApplicationPath + "/CroppedImages/" + ImgName;
                    imCropped.ImageUrl = CroppedImg;
                }
            }
        }
    }
    protected void btnCrop_Click(object sender, EventArgs e)
    {
        int x, y, w, h;
        if (!int.TryParse(hfX.Value, out x))
        {
            //Set default x value
            x = 0;
        }
        if (!int.TryParse(hfY.Value, out y))
        {
            //Set default y value
            y = 0;
        }
        if (!int.TryParse(hfHeight.Value, out h))
        {
            //Set default height value
            h = 0;
        }
        if (!int.TryParse(hfWidth.Value, out w))
        {
            //Set default width value
            w = 0;
        }
        CropImage(Server.MapPath(".") + @"/Images/Cartoons.jpg", x, y, w, h);
    }
}