
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

	const pair<int, int> MetaRegistry::max_life_cycle = pair<int, int>(0, MAX_INT);

	MetaRegistry::MetaRegistry(string name, int type) {
		this->name = name;
		this->type = type;
		value = NULL;
		life_cycle = max_life_cycle;
	}

	MetaRegistry::~MetaRegistry()
	{
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
			key = LUA_G;
		}
		if (registry.find(key) != registry.end())
		{
			return registry[key];
		}
		else return NULL;
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

	int MetaRegistry::GetType()
	{
		return this->type;
	}

	void MetaRegistry::SetLifeCycle(pair<int, int> life_cycle)
	{
		this->life_cycle = life_cycle;
	}

	bool MetaRegistry::IsInLifeCycle(int pc)
	{
		return pc >= life_cycle.first && pc <= life_cycle.second;
	}

}
