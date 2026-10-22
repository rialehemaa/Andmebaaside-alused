using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pitsarestoran
{
    public partial class Contact4 : Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView1.DataBind();
        }
    }
}