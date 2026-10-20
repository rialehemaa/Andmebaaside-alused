using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pitsarestoran
{
    public partial class Contact3 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            Response.Redirect("~/Contact2#logi");
        }
    }
}