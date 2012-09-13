using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class Grid_Hierarchial : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void CustomersOrdersGrid_DetailTableDataBind(object sender, Telerik.Web.UI.GridDetailTableDataBindEventArgs e)
    {
        if (e.DetailTableView.DataSourceID == "")
        {
            var dataItem = (GridDataItem)e.DetailTableView.ParentItem;
            var orderID = dataItem.GetDataKeyValue("OrderID").ToString();
            e.DetailTableView.DataSource = GetDataTable("SELECT * FROM [Order Details] WHERE OrderID = " + orderID + "");
        }
    }

    public DataTable GetDataTable(string query)
    {
        var connString = ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString;
        var adapter = new SqlDataAdapter();
        var myDataTable = new DataTable();

        using (SqlConnection conn = new SqlConnection(connString))
        {
            adapter.SelectCommand = new SqlCommand(query, conn);
            adapter.Fill(myDataTable);
        }

        return myDataTable;
    }
}