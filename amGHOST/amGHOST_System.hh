#pragma once

/**
 * SINGLETON Class
 * 
 *        I:  CREATE & DISPOSE
 *       II:      EK & EVENT
 *      III: PROCESS & DISPATCH [event]
 *       IV: Some internally used funcs
 *        V: GENERIC - STUFFS   [window]        [ \todo Pop-Ups, Time, Directories ]
 * 
 */
class amGHOST_System {
  public:
    static inline      amGHOST_System* heart = nullptr;         /** C++17 */
    static         void create_system(void);
    static amGHOST_System* get_system(void);
    /* */         void dispose_system(void);                    /** I want people to    heart->dispose_system()   */
    
  protected:                                                    /** SINGLETON */
    amGHOST_System(const amGHOST_System&) = delete;             /** Copy-Constructor    ==> DELETED */
    amGHOST_System& operator=(const amGHOST_System&) = delete;  /** Assignment Operator ==> DELETED */

    amGHOST_System() {};  
    virtual ~amGHOST_System() = default;                        /** -Wnon-virtual-dtor   [using G++/GCC] */
                                                                /** making it virtual means, even if you  `delete amGHOST_System *system`  it will call e.g. `~amGHOST_SystemWIN32()` */
};