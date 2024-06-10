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
            makeDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/src/")
            makeDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/doc/")
            copyDirectory("#{mainWorkDirectoryPath}Documentation","#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/doc/linux-6.5.1")
            moveFile("#{workDirectoryPath}/Sources","#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/src/linux-6.5.1")
        end
    end

    def install
        super

        if !option("Pass1")
            updateKernelOptionsDatabase
        end
    end

end
