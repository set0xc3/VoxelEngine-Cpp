#ifndef OBJECTS_ENTITY_DEF_HPP_
#define OBJECTS_ENTITY_DEF_HPP_

#include <string>

#include "../typedefs.hpp"

struct EntityDef {
    /// @brief Entity string id (with prefix included)
    std::string const name;

    std::string scriptName = name.substr(name.find(':')+1);
    
    struct {
        entityid_t id;
    } rt;
    
    EntityDef(const std::string& name) : name(name) {}
    EntityDef(const EntityDef&) = delete;
};

#endif // OBJECTS_ENTITY_DEF_HPP_
