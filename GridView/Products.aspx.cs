using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GridView
{
    public partial class Products : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;

       /// SqlConnection cnn = new SqlConnection(strcon);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateGridview();
            }
        }

        protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                using (SqlConnection cnn = new SqlConnection(strcon))
                {
                    cnn.Open();
                   
                    string query = "INSERT INTO Products (ProductName,Price,ShortDescription,Quantity) VALUES(@ProductName,@Price,@ShortDescription,@Quantity)";
                    
                    SqlCommand cmd = new SqlCommand(query, cnn);
                    cmd.Parameters.AddWithValue("@ProductName", (gvProducts.FooterRow.FindControl("textProductNameFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Price", (gvProducts.FooterRow.FindControl("textProductPriceFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@ShortDescription", (gvProducts.FooterRow.FindControl("textProductShortDescriptionFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Quantity", (gvProducts.FooterRow.FindControl("textQuantityFooter") as TextBox).Text.Trim());
                    
                    cmd.ExecuteNonQuery();
                    populateGridview();
                    lblSuccesMsg.Text = "New Record Added Successfully..!";
                    lblErrorMsg.Text = "";
                }
            }
        }
        void populateGridview()
        {
            string query = "";
            DataTable dt = new DataTable();
            using (SqlConnection cnn = new SqlConnection(strcon))
            {

                query = @"SELECT * FROM Products";
                cnn.Open();
                SqlDataAdapter sda = new SqlDataAdapter(query, cnn);
                sda.Fill(dt);
            }

            if (dt.Rows.Count > 0)
            {
                gvProducts.DataSource = dt;
                gvProducts.DataBind();
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                gvProducts.DataSource = dt;
                gvProducts.DataBind();
                gvProducts.Rows[0].Cells.Clear();
                gvProducts.Rows[0].Cells.Add(new TableCell());
                gvProducts.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                gvProducts.Rows[0].Cells[0].Text = "No data found";
                gvProducts.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void gvProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProducts.EditIndex = e.NewEditIndex;
            populateGridview();
        }

       

        protected void gvProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProducts.EditIndex = -1;
            populateGridview();
        }

        

        protected void gvProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(strcon))
            {
                cnn.Open();
                string query = "UPDATE Products SET ProductName=@ProductName,Price=@Price,ShortDescription=@ShortDescription WHERE ProductId = @id";
                SqlCommand cmd = new SqlCommand(query, cnn);

                cmd.Parameters.AddWithValue("@ProductName", (gvProducts.Rows[e.RowIndex].FindControl("textProductName") as TextBox).Text.Trim());
                cmd.Parameters.AddWithValue("@Price", (gvProducts.Rows[e.RowIndex].FindControl("textProductPrice") as TextBox).Text.Trim());
                cmd.Parameters.AddWithValue("@ShortDescription", (gvProducts.Rows[e.RowIndex].FindControl("textProductShortDescription") as TextBox).Text.Trim());
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value.ToString()));
                cmd.ExecuteNonQuery();
                gvProducts.EditIndex = -1;
                populateGridview();
                lblSuccesMsg.Text = "Selected record updated Successfully..!";
                lblErrorMsg.Text = "";
            }
        }

        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            using (SqlConnection cnn = new SqlConnection(strcon))
            {
                cnn.Open();
                string query = "DELETE FROM Products WHERE ProductId = @id";
                SqlCommand cmd = new SqlCommand(query, cnn);
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value.ToString()));
                cmd.ExecuteNonQuery();
                populateGridview();
                lblSuccesMsg.Text = "Record deleting Successfully..!";
                lblErrorMsg.Text = "";
            }
        }
    }
}