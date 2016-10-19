//
//  CSVUnformated
//  Modified by Augusto Faria on 10/14/16
//

import Foundation

public class TDTOpenner {
    public var headers: [String] = []
    public var rows: [Dictionary<Int, String>] = []
    public var columns = Dictionary<String, [String]>()
    var delimiter = NSCharacterSet(charactersInString: "\t")
    
    public init(content: String?, delimiter: NSCharacterSet, encoding: UInt) throws{
        if let csvStringToParse = content{
            self.delimiter = delimiter

            let newline = NSCharacterSet.newlineCharacterSet()
            var lines: [String] = []
            csvStringToParse.stringByTrimmingCharactersInSet(newline).enumerateLines { line, stop in lines.append(line) }

            self.headers = self.parseHeaders(fromLines: lines)
            self.rows = self.parseRows(fromLines: lines)
            self.columns = self.parseColumns(fromLines: lines)
        }
    }
    
    public convenience init(contentsOfURL url: String) throws {
        let comma = NSCharacterSet(charactersInString: "\t")
        let csvString: String?
        do {
            csvString = try String(contentsOfFile: url, encoding: NSNonLossyASCIIStringEncoding)//NSUTF8StringEncoding, NSASCIIStringEncoding, NSUTF16 NSUTF32
        } catch _ {
            csvString = nil
        };
        try self.init(content: csvString,delimiter:comma, encoding:NSUTF8StringEncoding)
    }
    
    
    func parseHeaders(fromLines lines: [String]) -> [String] {
        return lines[0].componentsSeparatedByCharactersInSet(self.delimiter)
    }
    
    func parseRows(fromLines lines: [String]) -> [Dictionary<Int, String>] {
        var rows: [Dictionary<Int, String>] = []
        
        for (lineNumber, line) in lines.enumerate() {
            if lineNumber == 0 {
                continue
            }
            
            var row = Dictionary<Int, String>()
            let values = line.componentsSeparatedByCharactersInSet(self.delimiter)
            for (index, _) in self.headers.enumerate() {
                if index < values.count {
                    row[index] = utils.trim(values[index])
                } else {
                    row[index] = ""
                }
            }
            rows.append(row)
        }
        
        return rows
    }
    
    func parseColumns(fromLines lines: [String]) -> Dictionary<String, [String]> {
        var columns = Dictionary<String, [String]>()
        
        var i = 0
        for header in self.headers {
            let column = self.rows.map { row in row[i] != nil ? row[i]! : "" }
            columns[header] = column
            i += 1
        }
        
        return columns
    }
}
