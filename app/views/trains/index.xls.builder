excel_document(xml) do
  xml.Worksheet "ss:Name": "Sheet1" do
    xml.Table do
      xml.Row do
        xml.Cell {}
        xml.Cell {xml.Data '', 'ss:Type': 'String'}
        xml.Cell {xml.Data '', 'ss:Type': 'String'}

        for t in @trains
          xml.Row do
            xml.Cell {xml.Data t.name, 'ss:Type': 'String'}
            xml.
