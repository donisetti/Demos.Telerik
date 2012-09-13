<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hierarchial.aspx.cs" Inherits="Grid_Hierarchial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <h1>Hierarchial RadGrid</h1>
        <hr />

        <h2>This is a hierarchial example using out of the box features. No coding.</h2>

        <telerik:RadGrid ID="CustomersOrdersGrid" runat="server" CellSpacing="0"
            DataSourceID="CustomersDataSource" GridLines="None"
            OnDetailTableDataBind="CustomersOrdersGrid_DetailTableDataBind" Skin="Metro">
            <MasterTableView AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="CustomerID"
                DataSourceID="CustomersDataSource" PageSize="5">
                <DetailTables>
                    <telerik:GridTableView runat="server" DataKeyNames="OrderID"
                        DataSourceID="OrdersDataSource">
                        <DetailTables>
                            <telerik:GridTableView runat="server">
                                <CommandItemSettings ExportToPdfText="Export to PDF" />
                                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column"
                                    Visible="True">
                                    <HeaderStyle Width="20px" />
                                </RowIndicatorColumn>
                                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column"
                                    Visible="True">
                                    <HeaderStyle Width="20px" />
                                </ExpandCollapseColumn>
                                <EditFormSettings>
                                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                    </EditColumn>
                                </EditFormSettings>
                            </telerik:GridTableView>
                        </DetailTables>
                        <ParentTableRelation>
                            <telerik:GridRelationFields DetailKeyField="CustomerID"
                                MasterKeyField="CustomerID" />
                        </ParentTableRelation>
                        <CommandItemSettings ExportToPdfText="Export to PDF" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column"
                            Visible="True">
                            <HeaderStyle Width="20px" />
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column"
                            Visible="True">
                            <HeaderStyle Width="20px" />
                        </ExpandCollapseColumn>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                            </EditColumn>
                        </EditFormSettings>
                    </telerik:GridTableView>
                </DetailTables>
                <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

                <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                </RowIndicatorColumn>

                <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                </ExpandCollapseColumn>

                <Columns>
                    <telerik:GridBoundColumn DataField="CustomerID"
                        FilterControlAltText="Filter CustomerID column" HeaderText="CustomerID"
                        ReadOnly="True" SortExpression="CustomerID" UniqueName="CustomerID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CompanyName"
                        FilterControlAltText="Filter CompanyName column" HeaderText="CompanyName"
                        SortExpression="CompanyName" UniqueName="CompanyName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ContactName"
                        FilterControlAltText="Filter ContactName column" HeaderText="ContactName"
                        SortExpression="ContactName" UniqueName="ContactName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ContactTitle"
                        FilterControlAltText="Filter ContactTitle column" HeaderText="ContactTitle"
                        SortExpression="ContactTitle" UniqueName="ContactTitle">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Address"
                        FilterControlAltText="Filter Address column" HeaderText="Address"
                        SortExpression="Address" UniqueName="Address">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="City"
                        FilterControlAltText="Filter City column" HeaderText="City"
                        SortExpression="City" UniqueName="City">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Region"
                        FilterControlAltText="Filter Region column" HeaderText="Region"
                        SortExpression="Region" UniqueName="Region">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PostalCode"
                        FilterControlAltText="Filter PostalCode column" HeaderText="PostalCode"
                        SortExpression="PostalCode" UniqueName="PostalCode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Country"
                        FilterControlAltText="Filter Country column" HeaderText="Country"
                        SortExpression="Country" UniqueName="Country">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Phone"
                        FilterControlAltText="Filter Phone column" HeaderText="Phone"
                        SortExpression="Phone" UniqueName="Phone">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Fax"
                        FilterControlAltText="Filter Fax column" HeaderText="Fax" SortExpression="Fax"
                        UniqueName="Fax">
                    </telerik:GridBoundColumn>
                </Columns>

                <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                </EditFormSettings>
            </MasterTableView>

            <FilterMenu EnableImageSprites="False"></FilterMenu>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="OrdersDataSource" runat="server"
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
            SelectCommand="SELECT * FROM [Orders] WHERE ([CustomerID] = @CustomerID)">
            <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="CustomersDataSource" runat="server"
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
            SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
    </form>
</body>
</html>
