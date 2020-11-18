#include <string>
#include <unordered_map>
#include "lua.h"
#include "MetaRegistry.h"

using namespace std;

namespace luacompiler {

	MetaRegistry::MetaRegistry() {
		type = LUA_TNONE;
		value = NULL;
	}

	MetaRegistry::~MetaRegistry()
	{
		for (auto iter = registry.begin(); iter != registry.end(); iter++)
		{
			delete(iter->second);
		}
		registry.clear();
	}

	MetaRegistry* MetaRegistry::GetRegistry(string key)
	{
		return registry[key];
	}

	bool MetaRegistry::HasRegistry(string key)
	{
		return GetRegistry(key) != NULL;
	}

	void MetaRegistry::AddRegistry(string key)
	{
		if (registry.find(key) == registry.end())
		{
			registry[key] = new MetaRegistry();
		}
	}

	int MetaRegistry::RemoveRegistry(string key)
	{
		return registry.erase(key);
	}

}
