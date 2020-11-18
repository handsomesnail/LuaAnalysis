#ifndef MetaRegistry_h
#define MetaRegistry_h

#include <string>
#include <unordered_map>

using namespace std;

namespace luacompiler 
{
	class MetaRegistry
	{
	private:
		int type;
		void* value;
		unordered_map<string, MetaRegistry*> registry;
	public:
		MetaRegistry();
		~MetaRegistry();
		MetaRegistry* GetRegistry(string key);
		bool HasRegistry(string key);
		void AddRegistry(string key);
		int RemoveRegistry(string key);
	};
}

#endif
