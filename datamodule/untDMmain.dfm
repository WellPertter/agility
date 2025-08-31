object dmMain: TdmMain
  Height = 313
  Width = 355
  object Connection: TFDConnection
    Params.Strings = (
      'Database=consult'
      'User_Name=root'
      'Password=DEUS LHE ABEN'#199'OE MUITO!! '
      'DriverID=MySQL')
    Left = 48
    Top = 80
  end
  object MySQLlinkDLL: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Users\Jos'#233' Arthur\Desktop\agility\libmysql.dll'
    Left = 49
    Top = 161
  end
end
