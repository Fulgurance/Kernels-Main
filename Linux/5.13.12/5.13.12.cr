class Target < ISM::Software
    
    def prepareInstallation
        super
        makeDirectory("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/src/")
        copyDirectory("#{mainWorkDirectoryPath(false)}Documentation","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share/doc/linux-5.13.12")
        moveFile("#{workDirectoryPath(false)}linux-5.13.12","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/src/")
    end

end
