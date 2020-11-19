
extern "C"
{
	#include "adapter.h"
	#include "lua.h"
	#include "llex.h"
	#include "analyzer.h"
}

#include <string>
#include <unordered_map>
#include "MetaRegistry.h"

using namespace std;

namespace luacompiler {

	MetaRegistry::MetaRegistry(string name, int type) {
		this->name = name;
		this->type = type;
		value = NULL;
	}

	MetaRegistry::~MetaRegistry()
	{
		Printf("%s Finalized\n", name.c_str());
		for (auto iter = registry.begin(); iter != registry.end(); iter++)
		{
			if (!(name == LUA_G && iter->first == LUA_G))
			{
				delete(iter->second);
				iter->second = NULL;
			}
		}
		registry.clear();
	}

	MetaRegistry* MetaRegistry::GetRegistry(string key)
	{
		if (name == LUA_G && key == LUA_ENV) //_ENV=_G
		{
			return registry[LUA_G];
		}
		else return registry[key];
	}

	bool MetaRegistry::HasRegistry(string key)
	{
		return GetRegistry(key) != NULL;
	}

	MetaRegistry* MetaRegistry::AddRegistry(string key, int type)
	{
		if (registry.find(key) == registry.end())
		{
			if (name == LUA_G && key == LUA_G)
			{
				registry[key] = this; //_G._G=_G
			}
			else
			{
				registry[key] = new MetaRegistry(key, type);
			}
		}
		return GetRegistry(key);
	}

	int MetaRegistry::RemoveRegistry(string key)
	{
		if (name == LUA_G && key == LUA_G)
		{
			return 0;
		}
		else return registry.erase(key);
	}

}
