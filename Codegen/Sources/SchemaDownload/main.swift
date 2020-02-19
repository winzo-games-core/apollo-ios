import Foundation
import ApolloCodegenLib

// Grab the parent folder of this file on the filesystem
let parentFolderOfScriptFile = FileFinder.findParentFolder()

// Use that to calculate the source root
let sourceRootURL = parentFolderOfScriptFile
    .deletingLastPathComponent() // Sources
    .deletingLastPathComponent() // Codegen
    .deletingLastPathComponent() // apollo-ios

let cliFolderURL = sourceRootURL
    .appendingPathComponent("Codegen")
    .appendingPathComponent("ApolloCLI")

let endpoint = URL(string: "http://localhost:8080/graphql")!

let output = sourceRootURL
    .appendingPathComponent("Tests")
    .appendingPathComponent("StarWarsAPI")

let options = ApolloSchemaOptions(schemaFileName: "downloaded_schema",
                                  endpointURL: endpoint,
                                  outputFolderURL: output)

do {
    try ApolloSchemaDownloader.run(with: cliFolderURL,
                                   options: options)
} catch {
    exit(1)
}
