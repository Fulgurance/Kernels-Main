class Target < ISM::Software
    
    def prepareInstallation
        super

        makeDirectory("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/src/")
        makeDirectory("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share/doc/")
        copyDirectory("#{mainWorkDirectoryPath(false)}Documentation","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share/doc/linux-5.13.12")
        moveFile("#{workDirectoryPath(false)}/Sources","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/src/linux-5.13.12")
    end

end
