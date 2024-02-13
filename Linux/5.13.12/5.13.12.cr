class Target < ISM::Software

    def configure
        super

        if option("Pass1")
            makeSource(["mrproper"],mainWorkDirectoryPath)
        end
    end

    def build
        super

        if option("Pass1")
            makeSource(["headers"],mainWorkDirectoryPath)
        end
    end
    
    def prepareInstallation
        super

        if option("Pass1")
            deleteAllHiddenFilesRecursively("#{mainWorkDirectoryPath}usr/include")
            deleteFile("#{mainWorkDirectoryPath}usr/include/Makefile")
            makeDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}/usr")
            copyDirectory("#{mainWorkDirectoryPath}usr/include", "#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}/usr")
        else
            makeDirectory("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/src/")
            makeDirectory("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share/doc/")
            copyDirectory("#{mainWorkDirectoryPath(false)}Documentation","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/share/doc/linux-5.13.12")
            moveFile("#{workDirectoryPath(false)}/Sources","#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}usr/src/linux-5.13.12")
        end
    end

    def install
        super

        if !option("Pass1")
            updateKernelOptionsDatabase
        end
    end

end
