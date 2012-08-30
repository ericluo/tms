# coding: utf-8 

excel_document(xml) do
  xml.Worksheet "ss:Name" => "Sheet1" do
    xml.Table do
      xml.Row do
        xml.Cell {xml.Data '培训项目', 'ss:Type' => 'String'}
        xml.Cell {xml.Data '举办单位', 'ss:Type' => 'String'}
        xml.Cell {xml.Data '受训人员', 'ss:Type' => 'String'}
        xml.Cell {xml.Data '应得学分', 'ss:Type' => 'String'}
      end

      for t in @trains
        xml.Row do
          xml.Cell {xml.Data t.name, 'ss:Type' => 'String'}
          xml.Cell {xml.Data t.organizer, 'ss:Type' => 'String'}
          xml.Cell {xml.Data t.trainee.name, 'ss:Type' => 'String'}
          xml.Cell {xml.Data t.score, 'ss:Type' => 'Number'}
        end
      end
    end
  end
end

        
