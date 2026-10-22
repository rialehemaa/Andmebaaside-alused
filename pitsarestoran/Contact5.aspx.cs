using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pitsarestoran
{
    public partial class Contact5 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelViga.Text = "";
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void SqlLisaTellimus_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                LabelViga.Text = "Seda klienti ei saa sel ajal teise laua taha panna: eelmine tellimus pole veel valmis.";
                e.ExceptionHandled = true;
            }
        }

        protected void SqlTellimused_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                LabelViga.Text = "Seda klienti ei saa sel ajal teise laua taha panna: eelmine tellimus pole veel valmis.";
                e.ExceptionHandled = true;
            }
        }
    }
}