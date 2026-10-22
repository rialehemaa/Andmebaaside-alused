<%@ Page Title="Contact3" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact3.aspx.cs" Inherits="pitsarestoran.Contact3" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<h2 style="color:#b5121b; font-weight:700; border-bottom:3px solid #b5121b; padding-bottom:8px; margin:20px 0;">Lisa ametimäärang</h2>

    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"
    DataKeyNames="ametimaaratusID" DataSourceID="SqlDataSource1_AmetiMaaratus"
    DefaultMode="Insert" OnItemInserted="DetailsView1_ItemInserted" CssClass="table table-bordered tabel-suur" Width="720px"
    GridLines="None" CellPadding="8">
    <FieldHeaderStyle BackColor="#f8f9fa" Font-Bold="True" Width="40%" />
    <Fields>
        <asp:TemplateField HeaderText="Alguskuupäev">
            <InsertItemTemplate>
               <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Date"
    Text='<%# Bind("alguskuupaev") %>'></asp:TextBox>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Töötaja">
            <InsertItemTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"
                    DataSourceID="SqlDataSource1_tootaja"
                    DataTextField="nimi" DataValueField="tootajaID"
                    SelectedValue='<%# Bind("tootaja_tootajaID") %>'>
                </asp:DropDownList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Amet">
            <InsertItemTemplate>
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control"
                    DataSourceID="SqlDataSource1_amet"
                    DataTextField="nimetus" DataValueField="ametID"
                    SelectedValue='<%# Bind("amet_ametID") %>'>
                </asp:DropDownList>
            </InsertItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowInsertButton="True" InsertText="Lisa"
            ShowCancelButton="True" CancelText="Loobu" NewText="Uus"
            ButtonType="Button" ControlStyle-CssClass="btn btn-danger" />
    </Fields>
</asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSource1_AmetiMaaratus" runat="server"
        ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString5 %>"
        SelectCommand="SELECT * FROM [ametimaaratusSet]"
        InsertCommand="INSERT INTO [ametimaaratusSet] ([alguskuupaev], [tootaja_tootajaID], [amet_ametID]) VALUES (@alguskuupaev, @tootaja_tootajaID, @amet_ametID)">
        <InsertParameters>
            <asp:Parameter Name="alguskuupaev" Type="String" />
            <asp:Parameter Name="tootaja_tootajaID" Type="Int32" />
            <asp:Parameter Name="amet_ametID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1_tootaja" runat="server"
        ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString5 %>"
        SelectCommand="SELECT tootajaID, eesnimi + ' ' + perekonnanimi AS nimi FROM [tootajaSet]" />

    <asp:SqlDataSource ID="SqlDataSource1_amet" runat="server"
        ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString5 %>"
        SelectCommand="SELECT ametID, nimetus FROM [ametSet]" />
</asp:Content>
