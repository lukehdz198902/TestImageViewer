using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestImageViewer.Pages
{
    public partial class ViewerPage : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            fillrpt();

        }
        private void fillrpt()
        {
            //http://localhost:5278/VisorImageViewer/ViewerImg.aspx
            var dt = new DataTable();
            dt.Columns.Add("url");
            dt.Columns.Add("nombre");

            var dr1 = dt.NewRow();
            dr1["url"] = "http://localhost:5278/VisorImageViewer/ViewerImg.aspx?id=1";
            dr1["nombre"] = "nombre1";
            dt.Rows.Add(dr1);

            var dr2 = dt.NewRow();
            dr2["url"] = "http://localhost:5278/VisorImageViewer/ViewerImg.aspx?id=2";
            dr2["nombre"] = "nombre2";
            dt.Rows.Add(dr2);

            var dr3 = dt.NewRow();
            dr3["url"] = "http://localhost:5278/VisorImageViewer/ViewerImg.aspx?id=3";
            dr3["nombre"] = "nombre3";
            dt.Rows.Add(dr3);

            var dr4 = dt.NewRow();
            dr4["url"] = "http://localhost:5278/VisorImageViewer/ViewerImg.aspx?id=3";
            dr4["nombre"] = "nombre4";
            dt.Rows.Add(dr4);

            rptimgs.DataSource = dt;
            rptimgs.DataBind();


        }

    }
}