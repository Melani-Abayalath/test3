import ballerina/io;

public function main() returns error? {
    // Initializes the CSV file paths and content.
    string csvFilePath2 = "./files/csvFile2.csv";

    // Writes the given content `string[][]` to a CSV file in csvFilePath1.
    // Reads the previously-saved CSV file as a `string[][]`.
    string[][] readCsv = check io:fileReadCsv(csvFilePath2);
    io:println(readCsv);

    // Writes the given content as a stream to a CSV file.
    // Reads the previously-saved CSV file as a stream.
    stream<string[], io:Error?> csvStream = check
                                        io:fileReadCsvAsStream(csvFilePath2);
    // Iterates through the stream and prints the content.
    check csvStream.forEach(function(string[] val) {
                              io:println(val);
                          });

}