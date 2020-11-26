#ifndef MetaRegistry_h
#define MetaRegistry_h

#include <string>
#include <unordered_map>
#include "lua.h"

using namespace std;

#define LUA_TUSER -2

namespace luacompiler 
{
	class MetaRegistry
	{
	private:
		string name;
		int type;
		void* value;
		pair<int, int> life_cycle;
		unordered_map<string, MetaRegistry*> registry;
	public:
		const static pair<int, int> max_life_cycle;
		MetaRegistry(string name, int type = LUA_TNONE);
		~MetaRegistry();
		MetaRegistry* GetRegistry(string key);
		bool HasRegistry(string key);
		MetaRegistry* AddRegistry(string key, int type = LUA_TNONE);
		int RemoveRegistry(string key);
		int GetType();
		void SetLifeCycle(pair<int, int> life_cycle);
		bool IsInLifeCycle(int pc);
	};
}

#endif
