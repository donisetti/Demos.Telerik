<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Simple.aspx.cs" Inherits="Grid_Simple" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Simple RadGrid</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <h1>Simple RadGrid</h1>
        <hr />

        <h2>This is a simple example using out of the box features. No coding.</h2>

        <telerik:RadGrid ID="CustomersGrid" runat="server"
            AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True"
            CellSpacing="0" DataSourceID="CustomersDataSource" GridLines="None"
            PageSize="30" ShowGroupPanel="True" Skin="Metro" Width="1000px">
            <ClientSettings AllowDragToGroup="True">
                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="CustomersDataSource">
                <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

                <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                    <HeaderStyle Width="20px"></HeaderStyle>
                </RowIndicatorColumn>

                <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                    <HeaderStyle Width="20px"></HeaderStyle>
                </ExpandCollapseColumn>

                <Columns>
                    <telerik:GridButtonColumn CommandName="Select"
                        FilterControlAltText="Filter SelectColumn column" HeaderText="Select"
                        Text="Select" UniqueName="SelectColumn">
                    </telerik:GridButtonColumn>
                    <telerik:GridBoundColumn DataField="CompanyName"
                        FilterControlAltText="Filter CompanyName column" HeaderText="CompanyName"
                        SortExpression="CompanyName" UniqueName="CompanyName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ContactName"
                        FilterControlAltText="Filter ContactName column" HeaderText="ContactName"
                        SortExpression="ContactName" UniqueName="ContactName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="City"
                        FilterControlAltText="Filter City column" HeaderText="City"
                        SortExpression="City" UniqueName="City">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Country"
                        FilterControlAltText="Filter Country column" HeaderText="Country"
                        SortExpression="Country" UniqueName="Country">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Phone"
                        FilterControlAltText="Filter Phone column" HeaderText="Phone"
                        SortExpression="Phone" UniqueName="Phone">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn FilterControlAltText="Filter TemplateColumn column"
                        HeaderText="* Templated" UniqueName="TemplateColumn">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Phone", "{0}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Phone", "* {0}") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>

                <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                </EditFormSettings>
            </MasterTableView>

            <FilterMenu EnableImageSprites="False"></FilterMenu>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="CustomersDataSource" runat="server"
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
            SelectCommand="SELECT [CompanyName], [ContactName], [City], [Country], [Phone] FROM [Customers]">
        </asp:SqlDataSource>
    </form>
</body>
</html>
