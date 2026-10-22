<%@ Page Title="Tooted" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact4.aspx.cs" Inherits="pitsarestoran.Contact4" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Toodete nimekiri</h2>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        DataKeyNames="tooteID" DataSourceID="SqlTooted">
        <Columns>
            <asp:BoundField DataField="tooteID" HeaderText="tooteID" ReadOnly="True" />
            <asp:BoundField DataField="nimetus" HeaderText="nimetus" />
            <asp:BoundField DataField="kirjeldus" HeaderText="kirjeldus" />
            <asp:BoundField DataField="hind" HeaderText="hind" />
            <asp:TemplateField HeaderText="kategooria">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("kategooria") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlKategooria"
                        DataTextField="nimetus" DataValueField="kategooriaID"
                        SelectedValue='<%# Bind("Kategooria_kategooriaID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlTooted" runat="server"
        ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString2 %>"
        SelectCommand="SELECT t.tooteID, t.nimetus, t.kirjeldus, t.hind, t.Kategooria_kategooriaID, k.nimetus AS kategooria FROM ToodeSet t JOIN KategooriaSet k ON k.kategooriaID = t.Kategooria_kategooriaID ORDER BY t.tooteID"
        UpdateCommand="UPDATE ToodeSet SET nimetus = @nimetus, kirjeldus = @kirjeldus, hind = @hind, Kategooria_kategooriaID = @Kategooria_kategooriaID WHERE tooteID = @tooteID"
        DeleteCommand="DELETE FROM ToodeSet WHERE tooteID = @tooteID">
        <UpdateParameters>
            <asp:Parameter Name="nimetus" Type="String" />
            <asp:Parameter Name="kirjeldus" Type="String" />
            <asp:Parameter Name="hind" Type="String" />
            <asp:Parameter Name="Kategooria_kategooriaID" Type="Int32" />
            <asp:Parameter Name="tooteID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="tooteID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <h2>Lisa uus toode</h2>

    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"
        DataKeyNames="tooteID" DataSourceID="SqlLisaToode" DefaultMode="Insert"
        OnItemInserted="DetailsView1_ItemInserted">
        <Fields>
            <asp:BoundField DataField="tooteID" HeaderText="tooteID" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="nimetus" HeaderText="nimetus" />
            <asp:BoundField DataField="kirjeldus" HeaderText="kirjeldus" />
            <asp:BoundField DataField="hind" HeaderText="hind" />
            <asp:TemplateField HeaderText="kategooria">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Kategooria_kategooriaID") %>'></asp:Label>
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server"
                        DataSourceID="SqlKategooria" DataTextField="nimetus" DataValueField="kategooriaID"
                        SelectedValue='<%# Bind("Kategooria_kategooriaID") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" InsertText="Lisa" ShowCancelButton="True" CancelText="Loobu" NewText="Uus" />

        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlLisaToode" runat="server"
        ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString2 %>"
        SelectCommand="SELECT * FROM ToodeSet"
        InsertCommand="INSERT INTO ToodeSet (nimetus, kirjeldus, hind, Kategooria_kategooriaID) VALUES (@nimetus, @kirjeldus, @hind, @Kategooria_kategooriaID)">
        <InsertParameters>
            <asp:Parameter Name="nimetus" Type="String" />
            <asp:Parameter Name="kirjeldus" Type="String" />
            <asp:Parameter Name="hind" Type="String" />
            <asp:Parameter Name="Kategooria_kategooriaID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlKategooria" runat="server"
        ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString2 %>"
        SelectCommand="SELECT kategooriaID, nimetus FROM KategooriaSet" />
</asp:Content>
