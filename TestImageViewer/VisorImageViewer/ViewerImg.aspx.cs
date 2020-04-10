using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestImageViewer.VisorImageViewer
{
    public partial class ViewerImg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            var id = Request.QueryString["id"];
            showImage(id);
        }

        private void showImage(string id) {

            try
            {
                byte[] FileBinary = null;
                DataTable dt = new DataTable();

                //dt = aqui se llena el datatable, dataset, sqldatareader
                FileBinary = File.ReadAllBytes("C:\\imgtest\\" + id + ".jpg");//(byte[])dr["imagenbinaria"];
                //using (dt)
                //{
                //    if (dt.Rows.Count > 0)
                //    {
                //        foreach (DataRow dr in dt.Rows)
                //        {

                //            FileBinary = File.ReadAllBytes("C:\\imgtest\\" + id + ".jpg");//(byte[])dr["imagenbinaria"];
                //        }
                //    }
                //}

                Response.Buffer = true;
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.ContentType = "image/jpg";
                //Response.AddHeader("content-disposition", "attachment;filename=" & Name)
                Response.BinaryWrite(FileBinary);
                Response.Flush();
                //Response.End();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                Response.End();
            }

        }

    }
}