<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="pitsarestoran.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Tabel Klient</h2>
<p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="klientID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
        <Columns>
            <asp:BoundField DataField="klientID" HeaderText="klientID" ReadOnly="True" SortExpression="klientID" />
            <asp:BoundField DataField="eesnimi" HeaderText="eesnimi" SortExpression="eesnimi" />
            <asp:BoundField DataField="perekonnanimi" HeaderText="perekonnanimi" SortExpression="perekonnanimi" />
            <asp:BoundField DataField="telefon" HeaderText="telefon" SortExpression="telefon" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString3 %>" DeleteCommand="DELETE FROM [KlientSet] WHERE [klientID] = @klientID" InsertCommand="INSERT INTO [KlientSet] ([eesnimi], [perekonnanimi], [telefon]) VALUES (@eesnimi, @perekonnanimi, @telefon)" ProviderName="<%$ ConnectionStrings:pitsarestoranConnectionString3.ProviderName %>" SelectCommand="SELECT [klientID], [eesnimi], [perekonnanimi], [telefon] FROM [KlientSet]" UpdateCommand="UPDATE [KlientSet] SET [eesnimi] = @eesnimi, [perekonnanimi] = @perekonnanimi, [telefon] = @telefon WHERE [klientID] = @klientID">
        <DeleteParameters>
            <asp:Parameter Name="klientID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="eesnimi" Type="String" />
            <asp:Parameter Name="perekonnanimi" Type="String" />
            <asp:Parameter Name="telefon" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="eesnimi" Type="String" />
            <asp:Parameter Name="perekonnanimi" Type="String" />
            <asp:Parameter Name="telefon" Type="String" />
            <asp:Parameter Name="klientID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>
<h2>
    Lisa Klient</h2>
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="klientID" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="125px">
    <Fields>
        <asp:BoundField DataField="klientID" HeaderText="klientID" InsertVisible="False" ReadOnly="True" SortExpression="klientID" />
        <asp:BoundField DataField="eesnimi" HeaderText="eesnimi" SortExpression="eesnimi" />
        <asp:BoundField DataField="perekonnanimi" HeaderText="perekonnanimi" SortExpression="perekonnanimi" />
        <asp:BoundField DataField="telefon" HeaderText="telefon" SortExpression="telefon" />
        <asp:CommandField ShowInsertButton="True" InsertText="Lisa" ShowCancelButton="True" CancelText="Loobu" NewText="Uus" />
    </Fields>
</asp:DetailsView>
<p>
    &nbsp;</p>
</asp:Content>