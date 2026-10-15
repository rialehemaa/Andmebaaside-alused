<%@ Page Title="Contact2" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact2.aspx.cs" Inherits="pitsarestoran.Contact2" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>&nbsp;AmetiMaaratus Tabel</h2>
<p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
        <Columns>
            <asp:BoundField DataField="alguskuupaev" HeaderText="alguskuupaev" SortExpression="alguskuupaev" />
            <asp:BoundField DataField="eesnimi" HeaderText="eesnimi" SortExpression="eesnimi" />
            <asp:BoundField DataField="perekonnanimi" HeaderText="perekonnanimi" SortExpression="perekonnanimi" />
            <asp:BoundField DataField="nimetus" HeaderText="nimetus" SortExpression="nimetus" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString4 %>" DeleteCommand="DELETE FROM [ametimaaratusSet] WHERE [ametimaaratusID] = @ametimaaratusID" InsertCommand="INSERT INTO [ametimaaratusSet] ([alguskuupaev], [tootaja_tootajaID], [amet_ametID]) VALUES (@alguskuupaev, @tootaja_tootajaID, @amet_ametID)" SelectCommand="SELECT ametimaaratusSet.alguskuupaev, tootajaSet.eesnimi, tootajaSet.perekonnanimi, ametSet.nimetus FROM ametimaaratusSet INNER JOIN tootajaSet ON ametimaaratusSet.tootaja_tootajaID = tootajaSet.tootajaID INNER JOIN ametSet ON ametimaaratusSet.amet_ametID = ametSet.ametID" UpdateCommand="UPDATE [ametimaaratusSet] SET [alguskuupaev] = @alguskuupaev, [tootaja_tootajaID] = @tootaja_tootajaID, [amet_ametID] = @amet_ametID WHERE [ametimaaratusID] = @ametimaaratusID">
        <DeleteParameters>
            <asp:Parameter Name="ametimaaratusID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="alguskuupaev" Type="String" />
            <asp:Parameter Name="tootaja_tootajaID" Type="Int32" />
            <asp:Parameter Name="amet_ametID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="alguskuupaev" Type="String" />
            <asp:Parameter Name="tootaja_tootajaID" Type="Int32" />
            <asp:Parameter Name="amet_ametID" Type="Int32" />
            <asp:Parameter Name="ametimaaratusID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>
    <p>
        &nbsp;</p>
</asp:Content>
