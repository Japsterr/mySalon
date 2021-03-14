object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 590
  Width = 839
  object database: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Sa' +
      'lon\Data\Database;Mode=Share Deny None;Extended Properties="";Pe' +
      'rsist Security Info=False;Jet OLEDB:System database="";Jet OLEDB' +
      ':Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engin' +
      'e Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Part' +
      'ial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:Ne' +
      'w Database Password="";Jet OLEDB:Create System Database=False;Je' +
      't OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Co' +
      'mpact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet O' +
      'LEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 16
  end
  object tbEmployee: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'Employee'
    Left = 48
    Top = 96
    object tbEmployeeID: TWideStringField
      FieldName = 'ID'
    end
    object tbEmployeeNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object tbEmployeeSurname: TWideStringField
      FieldName = 'Surname'
      Size = 25
    end
    object tbEmployeeSalary: TFloatField
      FieldName = 'Salary'
    end
    object tbEmployeeCommission: TFloatField
      FieldName = 'Commission'
    end
    object tbEmployeePhone: TWideStringField
      FieldName = 'Phone'
    end
  end
  object tbProduct: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'Product'
    Left = 56
    Top = 192
    object tbProductID: TWideStringField
      FieldName = 'ID'
    end
    object tbProductNames: TWideStringField
      FieldName = 'Names'
      Size = 50
    end
    object tbProductCost: TFloatField
      FieldName = 'Cost'
    end
    object tbProductPrice: TFloatField
      FieldName = 'Price'
    end
    object tbProductStock: TIntegerField
      FieldName = 'Stock'
    end
    object tbProductActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object qAllProducts: TADOQuery
    Active = True
    Connection = database
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM product'
      'WHERE product.active = true')
    Left = 736
    Top = 16
    object qAllProductsID: TWideStringField
      FieldName = 'ID'
      Size = 10
    end
    object qAllProductsNames: TWideStringField
      FieldName = 'Names'
      Size = 50
    end
    object qAllProductsCost: TFloatField
      FieldName = 'Cost'
    end
    object qAllProductsPrice: TFMTBCDField
      FieldName = 'Price'
      Precision = 19
      Size = 4
    end
    object qAllProductsStock: TIntegerField
      FieldName = 'Stock'
    end
    object qAllProductsActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object tbServiceIndex: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'ServiceIndex'
    Left = 64
    Top = 280
    object tbServiceIndexID: TWideStringField
      FieldName = 'ID'
    end
    object tbServiceIndexNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object tbServiceIndexActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object tbServiceOne: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'ServiceOne'
    Left = 200
    Top = 24
    object tbServiceOneID: TWideStringField
      FieldName = 'ID'
    end
    object tbServiceOneNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object tbServiceOnePrice: TFloatField
      FieldName = 'Price'
    end
    object tbServiceOneActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object tbServiceTwo: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'ServiceTwo'
    Left = 200
    Top = 96
    object tbServiceTwoID: TWideStringField
      FieldName = 'ID'
    end
    object tbServiceTwoNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object tbServiceTwoPrice: TFloatField
      FieldName = 'Price'
    end
    object tbServiceTwoActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object tbServiceThree: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'ServiceThree'
    Left = 200
    Top = 176
    object tbServiceThreeID: TWideStringField
      FieldName = 'ID'
    end
    object tbServiceThreeNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object tbServiceThreePrice: TFloatField
      FieldName = 'Price'
    end
    object tbServiceThreeActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object tbServiceFour: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'ServiceFour'
    Left = 200
    Top = 272
    object tbServiceFourID: TWideStringField
      FieldName = 'ID'
    end
    object tbServiceFourNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object tbServiceFourPrice: TFloatField
      FieldName = 'Price'
    end
    object tbServiceFourActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object tbServiceFive: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'ServiceFive'
    Left = 200
    Top = 352
    object tbServiceFiveID: TWideStringField
      FieldName = 'ID'
    end
    object tbServiceFiveNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object tbServiceFivePrice: TFloatField
      FieldName = 'Price'
    end
    object tbServiceFiveActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object tbServiceSix: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'ServiceSix'
    Left = 200
    Top = 432
    object tbServiceSixID: TWideStringField
      FieldName = 'ID'
    end
    object tbServiceSixNames: TWideStringField
      FieldName = 'Names'
      Size = 50
    end
    object tbServiceSixPrice: TFloatField
      FieldName = 'Price'
    end
    object tbServiceSixActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object tbServiceSeven: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'ServiceSeven'
    Left = 200
    Top = 504
    object tbServiceSevenID: TWideStringField
      FieldName = 'ID'
    end
    object tbServiceSevenNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object tbServiceSevenPrice: TFloatField
      FieldName = 'Price'
    end
    object tbServiceSevenActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object tbServiceEight: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'ServiceEight'
    Left = 328
    Top = 24
    object tbServiceEightID: TWideStringField
      FieldName = 'ID'
    end
    object tbServiceEightNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object tbServiceEightPrice: TFloatField
      FieldName = 'Price'
    end
    object tbServiceEightActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object tbServiceNine: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'ServiceNine'
    Left = 328
    Top = 96
    object tbServiceNineID: TWideStringField
      FieldName = 'ID'
    end
    object tbServiceNineNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object tbServiceNinePrice: TFloatField
      FieldName = 'Price'
    end
    object tbServiceNineActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object tbServiceTen: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'ServiceTen'
    Left = 328
    Top = 176
    object tbServiceTenID: TWideStringField
      FieldName = 'ID'
    end
    object tbServiceTenNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object tbServiceTenPrice: TFloatField
      FieldName = 'Price'
    end
    object tbServiceTenActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object tbSaleTemp: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'SaleTemp'
    Left = 544
    Top = 16
    object tbSaleTempDates: TDateTimeField
      FieldName = 'Dates'
    end
    object tbSaleTempTime: TWideStringField
      FieldName = 'Time'
      Size = 12
    end
    object tbSaleTempEmp_ID: TWideStringField
      FieldName = 'Emp_ID'
    end
    object tbSaleTempSer_ID: TWideStringField
      FieldName = 'Ser_ID'
      Size = 10
    end
    object tbSaleTempSer_Name: TWideStringField
      FieldName = 'Ser_Name'
      Size = 25
    end
    object tbSaleTempPrice: TFloatField
      FieldName = 'Price'
    end
    object tbSaleTempAmount: TIntegerField
      FieldName = 'Amount'
    end
    object tbSaleTempCommision: TFloatField
      FieldName = 'Commision'
    end
  end
  object tbSaleDaily: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'SaleDaily'
    Left = 544
    Top = 64
    object tbSaleDailyDates: TDateTimeField
      FieldName = 'Dates'
    end
    object tbSaleDailyTime: TWideStringField
      FieldName = 'Time'
      Size = 12
    end
    object tbSaleDailyEmp_ID: TWideStringField
      FieldName = 'Emp_ID'
    end
    object tbSaleDailySer_ID: TWideStringField
      FieldName = 'Ser_ID'
      Size = 10
    end
    object tbSaleDailySer_Name: TWideStringField
      FieldName = 'Ser_Name'
      Size = 25
    end
    object tbSaleDailySale_Amount: TIntegerField
      FieldName = 'Sale_Amount'
    end
    object tbSaleDailyTotal_Price: TFloatField
      FieldName = 'Total_Price'
    end
    object tbSaleDailyTotal_Comission: TFloatField
      FieldName = 'Total_Comission'
    end
  end
  object tbTotalDaily: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'TotalDaily'
    Left = 544
    Top = 136
    object tbTotalDailyDates: TDateTimeField
      FieldName = 'Dates'
    end
    object tbTotalDailyTotal: TFloatField
      FieldName = 'Total'
    end
    object tbTotalDailyCommission: TFloatField
      FieldName = 'Commission'
    end
  end
  object tbTotalWeek: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'TotalWeek'
    Left = 544
    Top = 192
    object tbTotalWeekStart_Date: TDateTimeField
      FieldName = 'Start_Date'
    end
    object tbTotalWeekEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object tbTotalWeekTotal: TFloatField
      FieldName = 'Total'
    end
    object tbTotalWeekCommission: TFloatField
      FieldName = 'Commission'
    end
  end
  object tbTotalMonth: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'TotalMonth'
    Left = 544
    Top = 248
    object tbTotalMonthStart_Date: TDateTimeField
      FieldName = 'Start_Date'
    end
    object tbTotalMonthEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object tbTotalMonthTotal: TFloatField
      FieldName = 'Total'
    end
    object tbTotalMonthCommission: TFloatField
      FieldName = 'Commission'
    end
  end
  object tbTotalYear: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'TotalYear'
    Left = 544
    Top = 296
    object tbTotalYearStart_Date: TDateTimeField
      FieldName = 'Start_Date'
    end
    object tbTotalYearEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object tbTotalYearTotal: TFloatField
      FieldName = 'Total'
    end
    object tbTotalYearCommission: TFloatField
      FieldName = 'Commission'
    end
  end
  object tbEmpTotalDaily: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'EmpTotalDaily'
    Left = 544
    Top = 344
    object tbEmpTotalDailyDates: TDateTimeField
      FieldName = 'Dates'
    end
    object tbEmpTotalDailyEmp_ID: TWideStringField
      FieldName = 'Emp_ID'
    end
    object tbEmpTotalDailyTotal: TFloatField
      FieldName = 'Total'
    end
    object tbEmpTotalDailyCommission: TFloatField
      FieldName = 'Commission'
    end
  end
  object tbEmpTotalWeek: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'EmpTotalWeek'
    Left = 544
    Top = 400
    object tbEmpTotalWeekStart_Date: TDateTimeField
      FieldName = 'Start_Date'
    end
    object tbEmpTotalWeekEmp_ID: TWideStringField
      FieldName = 'Emp_ID'
    end
    object tbEmpTotalWeekEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object tbEmpTotalWeekTotal: TFloatField
      FieldName = 'Total'
    end
    object tbEmpTotalWeekCommission: TFloatField
      FieldName = 'Commission'
    end
  end
  object tbEmpTotalMonth: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'EmpTotalMonth'
    Left = 552
    Top = 456
    object tbEmpTotalMonthStart_Date: TDateTimeField
      FieldName = 'Start_Date'
    end
    object tbEmpTotalMonthEmp_ID: TWideStringField
      FieldName = 'Emp_ID'
    end
    object tbEmpTotalMonthEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object tbEmpTotalMonthTotal: TFloatField
      FieldName = 'Total'
    end
    object tbEmpTotalMonthCommission: TFloatField
      FieldName = 'Commission'
    end
  end
  object tbAdmin: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'Admin'
    Left = 328
    Top = 248
    object tbAdminID: TWideStringField
      FieldName = 'ID'
    end
    object tbAdminNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object tbAdminSurname: TWideStringField
      FieldName = 'Surname'
      Size = 25
    end
    object tbAdminBus_Name: TWideStringField
      FieldName = 'Bus_Name'
      Size = 25
    end
    object tbAdminTelephone: TWideStringField
      FieldName = 'Telephone'
    end
    object tbAdminDate_Due: TDateTimeField
      FieldName = 'Date_Due'
    end
    object tbAdminRegistered: TBooleanField
      FieldName = 'Registered'
    end
    object tbAdminSetup: TBooleanField
      FieldName = 'Setup'
    end
  end
  object tbKey: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'RegKey'
    Left = 328
    Top = 352
    object tbKeycode: TWideStringField
      FieldName = 'code'
      Size = 10
    end
  end
  object qSaleDaily: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'date'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM Employee, SaleDaily'
      'WHERE Employee.ID =  Emp_ID'
      'AND SaleDaily.Dates = :date'
      'ORDER By SaleDaily.Dates, SaleDaily.Time')
    Left = 736
    Top = 72
    object qSaleDailyID: TWideStringField
      FieldName = 'ID'
      Size = 15
    end
    object qSaleDailyNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object qSaleDailySurname: TWideStringField
      FieldName = 'Surname'
      Size = 25
    end
    object qSaleDailySalary: TFloatField
      FieldName = 'Salary'
    end
    object qSaleDailyCommission: TFloatField
      FieldName = 'Commission'
    end
    object qSaleDailyPhone: TWideStringField
      FieldName = 'Phone'
      Size = 12
    end
    object qSaleDailyDates: TDateTimeField
      FieldName = 'Dates'
    end
    object qSaleDailyTime: TWideStringField
      FieldName = 'Time'
      Size = 12
    end
    object qSaleDailyEmp_ID: TWideStringField
      FieldName = 'Emp_ID'
      Size = 10
    end
    object qSaleDailySer_ID: TWideStringField
      FieldName = 'Ser_ID'
      Size = 10
    end
    object qSaleDailySer_Name: TWideStringField
      FieldName = 'Ser_Name'
      Size = 25
    end
    object qSaleDailySale_Amount: TIntegerField
      FieldName = 'Sale_Amount'
    end
    object qSaleDailyTotal_Price: TFloatField
      FieldName = 'Total_Price'
    end
    object qSaleDailyTotal_Comission: TFloatField
      FieldName = 'Total_Comission'
    end
  end
  object qEmpTotalDaily: TADOQuery
    Active = True
    Connection = database
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Employee, EmpTotalDaily'
      'WHERE Employee.ID = Emp_ID'
      'ORDER BY EmpTotalDaily.Dates')
    Left = 736
    Top = 128
    object qEmpTotalDailyID: TWideStringField
      FieldName = 'ID'
      Size = 15
    end
    object qEmpTotalDailyNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object qEmpTotalDailySurname: TWideStringField
      FieldName = 'Surname'
      Size = 25
    end
    object qEmpTotalDailySalary: TFloatField
      FieldName = 'Salary'
    end
    object qEmpTotalDailyEmployeeCommission: TFloatField
      FieldName = 'Employee.Commission'
    end
    object qEmpTotalDailyPhone: TWideStringField
      FieldName = 'Phone'
      Size = 12
    end
    object qEmpTotalDailyDates: TDateTimeField
      FieldName = 'Dates'
    end
    object qEmpTotalDailyEmp_ID: TWideStringField
      FieldName = 'Emp_ID'
      Size = 15
    end
    object qEmpTotalDailyTotal: TFMTBCDField
      FieldName = 'Total'
      Precision = 19
      Size = 4
    end
    object qEmpTotalDailyEmpTotalDailyCommission: TFMTBCDField
      FieldName = 'EmpTotalDaily.Commission'
      Precision = 19
      Size = 4
    end
  end
  object qEmpTotalWeek: TADOQuery
    Active = True
    Connection = database
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Employee, EmpTotalWeek'
      'WHERE Employee.ID = EmpTotalWeek.Emp_ID'
      'ORDER BY EmpTotalWeek.Start_Date')
    Left = 736
    Top = 184
    object qEmpTotalWeekStart_Date: TDateTimeField
      FieldName = 'Start_Date'
    end
    object qEmpTotalWeekEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object qEmpTotalWeekNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object qEmpTotalWeekSurname: TWideStringField
      FieldName = 'Surname'
      Size = 25
    end
    object qEmpTotalWeekEmpTotalWeekCommission: TFloatField
      FieldName = 'EmpTotalWeek.Commission'
    end
    object qEmpTotalWeekTotal: TFloatField
      FieldName = 'Total'
    end
  end
  object qEmpTotalMonth: TADOQuery
    Active = True
    Connection = database
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Employee, EmpTotalMonth'
      'WHERE Employee.ID = EmpTotalMonth.Emp_ID'
      'ORDER BY EmpTotalMonth.Start_Date')
    Left = 736
    Top = 232
    object qEmpTotalMonthID: TWideStringField
      FieldName = 'ID'
      Size = 15
    end
    object qEmpTotalMonthNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object qEmpTotalMonthSurname: TWideStringField
      FieldName = 'Surname'
      Size = 25
    end
    object qEmpTotalMonthSalary: TFloatField
      FieldName = 'Salary'
    end
    object qEmpTotalMonthEmployeeCommission: TFloatField
      FieldName = 'Employee.Commission'
    end
    object qEmpTotalMonthPhone: TWideStringField
      FieldName = 'Phone'
      Size = 12
    end
    object qEmpTotalMonthStart_Date: TDateTimeField
      FieldName = 'Start_Date'
    end
    object qEmpTotalMonthEmp_ID: TWideStringField
      FieldName = 'Emp_ID'
      Size = 15
    end
    object qEmpTotalMonthEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object qEmpTotalMonthTotal: TFMTBCDField
      FieldName = 'Total'
      Precision = 19
      Size = 4
    end
    object qEmpTotalMonthEmpTotalMonthCommission: TFMTBCDField
      FieldName = 'EmpTotalMonth.Commission'
      Precision = 19
      Size = 4
    end
  end
  object tbBookings: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'Bookings'
    Left = 416
    Top = 16
    object tbBookingsDates: TDateTimeField
      FieldName = 'Dates'
    end
    object tbBookingsTime: TWideStringField
      FieldName = 'Time'
      Size = 5
    end
    object tbBookingsEmp_ID: TWideStringField
      FieldName = 'Emp_ID'
    end
    object tbBookingsWho: TWideStringField
      FieldName = 'Who'
      Size = 25
    end
    object tbBookingsWho_Telephone: TWideStringField
      FieldName = 'Who_Telephone'
    end
    object tbBookingsType: TWideStringField
      FieldName = 'Type'
      Size = 25
    end
  end
  object qBookings: TADOQuery
    Connection = database
    CursorType = ctStatic
    ParamCheck = False
    Parameters = <
      item
        Name = 'date'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM employee, bookings '
      'WHERE employee.ID = bookings.Emp_ID'
      'AND bookings.dates = :date')
    Left = 736
    Top = 336
    object qBookingsDates: TDateTimeField
      FieldName = 'Dates'
    end
    object qBookingsTime: TWideStringField
      FieldName = 'Time'
      Size = 5
    end
    object qBookingsNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object qBookingsWho: TWideStringField
      FieldName = 'Who'
      Size = 25
    end
    object qBookingsWho_Telephone: TWideStringField
      FieldName = 'Who_Telephone'
      Size = 11
    end
    object qBookingsType: TWideStringField
      FieldName = 'Type'
      Size = 25
    end
  end
end
