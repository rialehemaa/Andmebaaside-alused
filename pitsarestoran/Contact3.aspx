<%@ Page Title="Contact3" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact3.aspx.cs" Inherits="pitsarestoran.Contact3" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Lisa AmetiMaaratus veebivorm</h2>

    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"
        DataKeyNames="ametimaaratusID" DataSourceID="SqlDataSource1_AmetiMaaratus"
        DefaultMode="Insert" Height="50px" Width="300px">
        <Fields>
            <asp:BoundField DataField="alguskuupaev" HeaderText="Alguskuupäev (AAAA-KK-PP)" />
            <asp:TemplateField HeaderText="Töötaja">
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server"
                        DataSourceID="SqlDataSource1_tootaja"
                        DataTextField="nimi" DataValueField="tootajaID"
                        SelectedValue='<%# Bind("tootaja_tootajaID") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Amet">
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server"
                        DataSourceID="SqlDataSource1_amet"
                        DataTextField="nimetus" DataValueField="ametID"
                        SelectedValue='<%# Bind("amet_ametID") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" InsertText="Lisa" />
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