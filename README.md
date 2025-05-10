# frpfile-icloud-ecid-registration-tool
Windows batch tool for registering device ECIDs (via crocs.pythonanywhere.com) and Serial Numbers (via frpfile.com/icloud).

# 🔧 FRPfile & Crocs ECID/Serial Registration Tool  
*Batch script to register device ECIDs (via [crocs.pythonanywhere.com](https://crocs.pythonanywhere.com)) and Serial Numbers (via [frpfile.com/icloud](https://frpfile.com/icloud)).*  

## 🌐 Supported Services  
- **FRPfile iCloud**: Serial number registration ([frpfile.com/icloud](https://frpfile.com/icloud))  
- **Crocs PythonAnywhere**: ECID registration ([crocs.pythonanywhere.com](https://crocs.pythonanywhere.com))  

## 🚀 Features  
- **ECID Registration**: POSTs to Crocs' PythonAnywhere API.  
- **Serial Registration**: Submits to FRPfile’s iCloud endpoint.  
- **Error Handling**: Validates inputs and API responses.  

## 📥 Usage  
1. Download `register.bat`.  
2. Run as Administrator:  
   ```cmd
   register.bat
