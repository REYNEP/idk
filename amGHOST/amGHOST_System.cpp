#include "amGHOST_System.hh"
#include "amVK_LoggerNUtils/amVK_Logger.hh"

void amGHOST_System::create_system(void) {
    if (heart) {
        amVK_LOG("[amGHOST_System::create_system]: A GHOST System Already Exists, Please Destroy it before you can create Another System.");
        return;
    }
}