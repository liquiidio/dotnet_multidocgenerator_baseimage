
# .NET MultiDocGenerator BaseImage

Image can be built using Docker commandline. 

#### .NET (Compatible with Unity)
Contains latest .NET binaries to compile and test Code using dotnet commands 

    dotnet run
    dotnet test
    dotnet ... 
#### Doxygen
Allows to generate Doxybooks from provided source-code by using doxygen commands and a Doxyfile

    doxygen documentation/Doxyfile

#### Doxybook2
Allows to then use Doxybook2 to convert the generated Doxygen-output into static HTML-content using one of the diverse available Documentation Frameworks

    doxybook2 --input documentation/doxyoutput/xml --output documentation/gitbook --config ...

Necessary sources are already installed within this image and allow to generate Documentation using 

- [Hugo](https://gohugo.io/)
- [MkDocs](https://www.mkdocs.org/)
- [Bootswatch](http://mkdocs.github.io/mkdocs-bootswatch/)
- [VuePress](https://vuepress.vuejs.org/)
- [GitBook](https://github.com/GitbookIO/gitbook)
- [Docsify](https://docsify.js.org/#/)
- Doxygen

