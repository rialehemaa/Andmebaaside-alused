<%@ Page Title="Contact2" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact2.aspx.cs" Inherits="pitsarestoran.Contact2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <style>
    .tabel-suur td, .tabel-suur th { padding: 14px 18px !important; font-size: 1.1rem; vertical-align: middle; }
    .tabel-suur th { background-color: #212529 !important; color: #ffffff !important; }
</style>
<h2 style="color:#b5121b; font-weight:700; border-bottom:3px solid #b5121b; padding-bottom:8px; margin:20px 0;">Ametimäärangud</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        DataKeyNames="ametimaaratusID" DataSourceID="SqlDataSource1"
        CssClass="table table-striped table-bordered tabel-suur" Width="100%">
        <Columns>
            <asp:BoundField DataField="alguskuupaev" HeaderText="Alguskuupäev" />
            <asp:TemplateField HeaderText="Töötaja">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("tootaja") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlTootaja"
                        DataTextField="nimi" DataValueField="tootajaID"
                        SelectedValue='<%# Bind("tootaja_tootajaID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Amet">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("nimetus") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlAmet"
                        DataTextField="nimetus" DataValueField="ametID"
                        SelectedValue='<%# Bind("amet_ametID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"
                EditText="Muuda" DeleteText="Kustuta" UpdateText="Salvesta" CancelText="Loobu"
                ButtonType="Button" ControlStyle-CssClass="btn btn-danger btn-sm"/>
        </Columns>
    </asp:GridView>

        <h3 id="logi" style="margin-top:40px;">Muudatuste logi</h3>
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
    DataSourceID="SqlLogi" CssClass="table table-striped table-bordered tabel-suur" Width="100%">
    <Columns>
        <asp:BoundField DataField="aeg" HeaderText="Aeg" DataFormatString="{0:dd.MM.yyyy HH:mm}" />
        <asp:BoundField DataField="tegevus" HeaderText="Tegevus" />
        <asp:BoundField DataField="kirjeldus" HeaderText="Kirjeldus" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlLogi" runat="server"
    ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString2 %>"
    SelectCommand="SELECT TOP 20 aeg, tegevus, kirjeldus FROM ametimaaratusLogi ORDER BY logiID DESC" />


    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString2 %>"
        SelectCommand="SELECT am.ametimaaratusID, am.alguskuupaev, am.tootaja_tootajaID, am.amet_ametID, t.eesnimi + ' ' + t.perekonnanimi AS tootaja, a.nimetus FROM ametimaaratusSet am JOIN tootajaSet t ON t.tootajaID = am.tootaja_tootajaID JOIN ametSet a ON a.ametID = am.amet_ametID ORDER BY am.ametimaaratusID"
        UpdateCommand="UPDATE ametimaaratusSet SET alguskuupaev = @alguskuupaev, tootaja_tootajaID = @tootaja_tootajaID, amet_ametID = @amet_ametID WHERE ametimaaratusID = @ametimaaratusID"
        DeleteCommand="DELETE FROM ametimaaratusSet WHERE ametimaaratusID = @ametimaaratusID">
        <UpdateParameters>
            <asp:Parameter Name="alguskuupaev" Type="String" />
            <asp:Parameter Name="tootaja_tootajaID" Type="Int32" />
            <asp:Parameter Name="amet_ametID" Type="Int32" />
            <asp:Parameter Name="ametimaaratusID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="ametimaaratusID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlTootaja" runat="server"
        ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString2 %>"
        SelectCommand="SELECT tootajaID, eesnimi + ' ' + perekonnanimi AS nimi FROM tootajaSet" />

    <asp:SqlDataSource ID="SqlAmet" runat="server"
        ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString2 %>"
        SelectCommand="SELECT ametID, nimetus FROM ametSet" />
</asp:Content>