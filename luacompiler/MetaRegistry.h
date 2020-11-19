#ifndef MetaRegistry_h
#define MetaRegistry_h

#include <string>
#include <unordered_map>
#include "lua.h"

using namespace std;

namespace luacompiler 
{
	class MetaRegistry
	{
	private:
		string name;
		int type;
		void* value;
		unordered_map<string, MetaRegistry*> registry;
	public:
		MetaRegistry(string name, int type = LUA_TNONE);
		~MetaRegistry();
		MetaRegistry* GetRegistry(string key);
		bool HasRegistry(string key);
		MetaRegistry* AddRegistry(string key, int type = LUA_TNONE);
		int RemoveRegistry(string key);
	};
}

#endif
