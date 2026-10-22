<%@ Page Title="Tellimused" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact5.aspx.cs" Inherits="pitsarestoran.Contact5" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Tellimused</h2>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        DataKeyNames="tellimusID" DataSourceID="SqlTellimused">
        <Columns>
            <asp:BoundField DataField="tellimusID" HeaderText="tellimusID" ReadOnly="True" />
            <asp:BoundField DataField="kuupaev" HeaderText="kuupaev" />
            <asp:BoundField DataField="kellaaeg" HeaderText="kellaaeg" />
            <asp:TemplateField HeaderText="staatus">
                <ItemTemplate>
                    <asp:Label ID="LabelStaatus2" runat="server" Text='<%# Eval("staatus") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList6" runat="server" SelectedValue='<%# Bind("staatus") %>'>
                        <asp:ListItem>ootel</asp:ListItem>
                        <asp:ListItem>valmistamisel</asp:ListItem>
                        <asp:ListItem>valmis</asp:ListItem>
                        <asp:ListItem>tühistatud</asp:ListItem>
                        <asp:ListItem>broneeritud</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="klient">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("klient") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlKlient"
                        DataTextField="nimi" DataValueField="klientID"
                        SelectedValue='<%# Bind("Klient_klientID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="laud">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("laud") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlLaud"
                        DataTextField="number" DataValueField="laudID"
                        SelectedValue='<%# Bind("Laud_laudID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"
                EditText="Muuda" DeleteText="Kustuta" UpdateText="Salvesta" CancelText="Loobu" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlTellimused" runat="server" OnUpdated="SqlTellimused_Updated"
        ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString2 %>"
        SelectCommand="SELECT te.tellimusID, te.kuupaev, te.kellaaeg, te.staatus, te.Klient_klientID, te.Laud_laudID, k.eesnimi + ' ' + k.perekonnanimi AS klient, l.number AS laud FROM TellimusSet te JOIN KlientSet k ON k.klientID = te.Klient_klientID JOIN LaudSet l ON l.laudID = te.Laud_laudID ORDER BY te.tellimusID"
        UpdateCommand="UPDATE TellimusSet SET kuupaev = @kuupaev, kellaaeg = @kellaaeg, staatus = @staatus, Klient_klientID = @Klient_klientID, Laud_laudID = @Laud_laudID WHERE tellimusID = @tellimusID"
        DeleteCommand="DELETE FROM TellimusSet WHERE tellimusID = @tellimusID">
        <UpdateParameters>
            <asp:Parameter Name="kuupaev" Type="String" />
            <asp:Parameter Name="kellaaeg" Type="String" />
            <asp:Parameter Name="staatus" Type="String" />
            <asp:Parameter Name="Klient_klientID" Type="Int32" />
            <asp:Parameter Name="Laud_laudID" Type="Int32" />
            <asp:Parameter Name="tellimusID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="tellimusID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <h2>Lisa uus tellimus</h2>

    <asp:Label ID="LabelViga" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>

    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"
        DataKeyNames="tellimusID" DataSourceID="SqlLisaTellimus" DefaultMode="Insert"
        OnItemInserted="DetailsView1_ItemInserted">
        <Fields>
            <asp:BoundField DataField="tellimusID" HeaderText="tellimusID" InsertVisible="False" ReadOnly="True" />
            <asp:TemplateField HeaderText="kuupaev">
                <ItemTemplate>
                    <asp:Label ID="LabelKuupaev" runat="server" Text='<%# Eval("kuupaev") %>'></asp:Label>
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Date"
                        Text='<%# Bind("kuupaev") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="kellaaeg">
                <ItemTemplate>
                    <asp:Label ID="LabelKellaaeg" runat="server" Text='<%# Eval("kellaaeg") %>'></asp:Label>
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Time"
                        Text='<%# Bind("kellaaeg") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="staatus">
                <ItemTemplate>
                    <asp:Label ID="LabelStaatus" runat="server" Text='<%# Eval("staatus") %>'></asp:Label>
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList5" runat="server" CssClass="form-control"
                        SelectedValue='<%# Bind("staatus") %>'>
                        <asp:ListItem>ootel</asp:ListItem>
                        <asp:ListItem>valmistamisel</asp:ListItem>
                        <asp:ListItem>valmis</asp:ListItem>
                        <asp:ListItem>tühistatud</asp:ListItem>
                        <asp:ListItem>broneeritud</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="klient">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Klient_klientID") %>'></asp:Label>
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control"
                        DataSourceID="SqlKlient" DataTextField="nimi" DataValueField="klientID"
                        SelectedValue='<%# Bind("Klient_klientID") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="laud">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Laud_laudID") %>'></asp:Label>
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control"
                        DataSourceID="SqlLaud" DataTextField="number" DataValueField="laudID"
                        SelectedValue='<%# Bind("Laud_laudID") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" InsertText="Lisa" ShowCancelButton="True" CancelText="Loobu" NewText="Uus" />
        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlLisaTellimus" runat="server" OnInserted="SqlLisaTellimus_Inserted"
        ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString2 %>"
        SelectCommand="SELECT * FROM TellimusSet"
        InsertCommand="INSERT INTO TellimusSet (kuupaev, kellaaeg, staatus, Klient_klientID, Laud_laudID) VALUES (@kuupaev, @kellaaeg, @staatus, @Klient_klientID, @Laud_laudID)">
        <InsertParameters>
            <asp:Parameter Name="kuupaev" Type="String" />
            <asp:Parameter Name="kellaaeg" Type="String" />
            <asp:Parameter Name="staatus" Type="String" />
            <asp:Parameter Name="Klient_klientID" Type="Int32" />
            <asp:Parameter Name="Laud_laudID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlKlient" runat="server"
        ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString2 %>"
        SelectCommand="SELECT klientID, eesnimi + ' ' + perekonnanimi AS nimi FROM KlientSet" />

    <asp:SqlDataSource ID="SqlLaud" runat="server"
        ConnectionString="<%$ ConnectionStrings:pitsarestoranConnectionString2 %>"
        SelectCommand="SELECT laudID, number FROM LaudSet" />
</asp:Content>
