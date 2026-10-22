<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="pitsarestoran.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Tabel Tootajad</h2>
    <p>
               <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="tootajaID" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display.">
                   <Columns>
                <asp:BoundField DataField="tootajaID" HeaderText="tootajaID" ReadOnly="True" SortExpression="tootajaID" />
                <asp:BoundField DataField="eesnimi" HeaderText="eesnimi" SortExpression="eesnimi" />
                <asp:BoundField DataField="perekonnanimi" HeaderText="perekonnanimi" SortExpression="perekonnanimi" />
                <asp:BoundField DataField="telefon" HeaderText="telefon" SortExpression="telefon" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString2 %>" DeleteCommand="DELETE FROM [tootajaSet] WHERE [tootajaID] = @tootajaID" InsertCommand="INSERT INTO [tootajaSet] ([eesnimi], [perekonnanimi], [telefon]) VALUES (@eesnimi, @perekonnanimi, @telefon)" ProviderName="<%$ ConnectionStrings:pitsarestoranConnectionString2.ProviderName %>" SelectCommand="SELECT [tootajaID], [eesnimi], [perekonnanimi], [telefon] FROM [tootajaSet]" UpdateCommand="UPDATE [tootajaSet] SET [eesnimi] = @eesnimi, [perekonnanimi] = @perekonnanimi, [telefon] = @telefon WHERE [tootajaID] = @tootajaID">
            <DeleteParameters>
                <asp:Parameter Name="tootajaID" Type="Int32" />
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
                <asp:Parameter Name="tootajaID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</p>
    <h2>
        Lisa töötaja</h2>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="tootajaID" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="tootajaID" HeaderText="tootajaID" InsertVisible="False" ReadOnly="True" SortExpression="tootajaID" />
                <asp:BoundField DataField="eesnimi" HeaderText="eesnimi" SortExpression="eesnimi" />
                <asp:BoundField DataField="perekonnanimi" HeaderText="perekonnanimi" SortExpression="perekonnanimi" />
                <asp:BoundField DataField="telefon" HeaderText="telefon" SortExpression="telefon" />
                <asp:CommandField ShowInsertButton="True" NewText="Uus" CancelText="Loobu" />
            </Fields>
        </asp:DetailsView>
</p>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString2 %>" DeleteCommand="DELETE FROM [tootajaSet] WHERE [tootajaID] = @tootajaID" InsertCommand="INSERT INTO [tootajaSet] ([eesnimi], [perekonnanimi], [telefon]) VALUES (@eesnimi, @perekonnanimi, @telefon)" ProviderName="<%$ ConnectionStrings:pitsarestoranConnectionString2.ProviderName %>" SelectCommand="SELECT [tootajaID], [eesnimi], [perekonnanimi], [telefon] FROM [tootajaSet]" UpdateCommand="UPDATE [tootajaSet] SET [eesnimi] = @eesnimi, [perekonnanimi] = @perekonnanimi, [telefon] = @telefon WHERE [tootajaID] = @tootajaID">
        <DeleteParameters>
            <asp:Parameter Name="tootajaID" Type="Int32" />
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
            <asp:Parameter Name="tootajaID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <p>
    <br />
</p>
</asp:Content>
