// Generated at Wed May 18 00:41:40 2016. Do not modify it

/*
gccxml_plugin
*/

#ifdef _WIN32
#pragma warning ( disable : 4786 )
#pragma warning ( disable : 4345 )
#elif defined(__GNUC__) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 3)) && !defined(__INTEL_COMPILER) 
# pragma GCC diagnostic ignored "-Warray-bounds"
#endif
#include "../x86_64-slc6-gcc48-opt/dict/TrigCostMonitor/TrigCostMonitorDict_gen.h"
#ifdef CONST
# undef CONST
#endif
#include "Reflex/Builder/ReflexBuilder.h"
#include <typeinfo>

namespace {
  ::Reflex::NamespaceBuilder nsb0( Reflex::Literal("Trig") );
  ::Reflex::Type type_1277 = ::Reflex::TypeBuilder(Reflex::Literal("int"));
  ::Reflex::Type type_void = ::Reflex::TypeBuilder(Reflex::Literal("void"));
  ::Reflex::Type type_1793 = ::Reflex::TypeBuilder(Reflex::Literal("void"));
  ::Reflex::Type type_6805 = ::Reflex::TypeBuilder(Reflex::Literal("bool"));
  ::Reflex::Type type_2517 = ::Reflex::TypeBuilder(Reflex::Literal("IAlgTool"));
  ::Reflex::Type type_1960 = ::Reflex::TypeBuilder(Reflex::Literal("InterfaceID"));
  ::Reflex::Type type_1161 = ::Reflex::TypeBuilder(Reflex::Literal("unsigned int"));
  ::Reflex::Type type_2519 = ::Reflex::TypeBuilder(Reflex::Literal("TrigMonEvent"));
  ::Reflex::Type type_2518 = ::Reflex::TypeBuilder(Reflex::Literal("TrigMonConfig"));
  ::Reflex::Type type_2857 = ::Reflex::TypeBuilder(Reflex::Literal("HLT::TrigSteer"));
  ::Reflex::Type type_2852 = ::Reflex::TypeBuilder(Reflex::Literal("Trig::ITrigNtTool"));
  ::Reflex::Type type_1965 = ::Reflex::TypeBuilder(Reflex::Literal("std::basic_string<char>"));
  ::Reflex::Type type_23996 = ::Reflex::ReferenceBuilder(type_2852);
  ::Reflex::Type type_2852c = ::Reflex::ConstBuilder(type_2852);
  ::Reflex::Type type_23997 = ::Reflex::ReferenceBuilder(type_2852c);
  ::Reflex::Type type_1960c = ::Reflex::ConstBuilder(type_1960);
  ::Reflex::Type type_6775 = ::Reflex::ReferenceBuilder(type_1960c);
  ::Reflex::Type type_2857c = ::Reflex::ConstBuilder(type_2857);
  ::Reflex::Type type_23998 = ::Reflex::PointerBuilder(type_2857c);
  ::Reflex::Type type_23999 = ::Reflex::PointerBuilder(type_2518);
  ::Reflex::Type type_10934 = ::Reflex::ReferenceBuilder(type_2519);
  ::Reflex::Type type_2519c = ::Reflex::ConstBuilder(type_2519);
  ::Reflex::Type type_10932 = ::Reflex::ReferenceBuilder(type_2519c);
  ::Reflex::Type type_1965c = ::Reflex::ConstBuilder(type_1965);
  ::Reflex::Type type_10077 = ::Reflex::ReferenceBuilder(type_1965c);
} // unnamed namespace

#ifndef __CINT__

// Shadow classes to obtain the data member offsets 
namespace __shadow__ {
#ifdef __Trig__ITrigNtTool
#undef __Trig__ITrigNtTool
#endif
class __Trig__ITrigNtTool : virtual public ::IAlgTool {
  public:
  __Trig__ITrigNtTool();
  virtual ~__Trig__ITrigNtTool() throw();
  virtual void SetSteer(HLT::TrigSteer const*) throw();
  virtual void Done() throw();
  virtual void SetOption(unsigned int) throw();
  virtual bool Fill(TrigMonEvent&) throw();
};
}


#endif // __CINT__
namespace {
//------Stub functions for class ITrigNtTool -------------------------------
static  void operator_10923( void* retaddr, void* o, const std::vector<void*>& arg, void*)
{
  if (retaddr) *(void**)retaddr = (void*)&(((::Trig::ITrigNtTool*)o)->operator=)(*(const ::Trig::ITrigNtTool*)arg[0]);
  else   (((::Trig::ITrigNtTool*)o)->operator=)(*(const ::Trig::ITrigNtTool*)arg[0]);
}

static void destructor_10925(void*, void * o, const std::vector<void*>&, void *) {
(((::Trig::ITrigNtTool*)o)->::Trig::ITrigNtTool::~ITrigNtTool)();
}
static  void method_10926( void* retaddr, void* o, const std::vector<void*>&, void*)
{
  if (retaddr) *(void**)retaddr = (void*)&(((::Trig::ITrigNtTool*)o)->interfaceID)();
  else   (((::Trig::ITrigNtTool*)o)->interfaceID)();
}

static  void method_10927( void*, void* o, const std::vector<void*>& arg, void*)
{
  (((::Trig::ITrigNtTool*)o)->SetSteer)((const ::HLT::TrigSteer*)arg[0]);
}

static  void method_10928( void*, void* o, const std::vector<void*>& arg, void*)
{
  (((::Trig::ITrigNtTool*)o)->SetOption)(*(unsigned int*)arg[0]);
}

static  void method_10929( void* retaddr, void* o, const std::vector<void*>& arg, void*)
{
  if (retaddr) new (retaddr) (bool)((((::Trig::ITrigNtTool*)o)->Fill)((::TrigMonConfig*)arg[0]));
  else   (((::Trig::ITrigNtTool*)o)->Fill)((::TrigMonConfig*)arg[0]);
}

static  void method_10930( void* retaddr, void* o, const std::vector<void*>& arg, void*)
{
  if (retaddr) new (retaddr) (bool)((((::Trig::ITrigNtTool*)o)->Fill)(*(::TrigMonEvent*)arg[0]));
  else   (((::Trig::ITrigNtTool*)o)->Fill)(*(::TrigMonEvent*)arg[0]);
}

static  void method_10931( void*, void* o, const std::vector<void*>&, void*)
{
  (((::Trig::ITrigNtTool*)o)->Done)();
}

static void method_x0( void* retaddr, void*, const std::vector<void*>&, void*)
{
  typedef std::vector<std::pair< ::Reflex::Base, int> > Bases_t;
  static Bases_t s_bases;
  if ( !s_bases.size() ) {
    s_bases.push_back(std::make_pair(::Reflex::Base( ::Reflex::TypeBuilder(Reflex::Literal("IAlgTool")), ::Reflex::BaseOffset< ::Trig::ITrigNtTool,::IAlgTool >::Get(),::Reflex::VIRTUAL |::Reflex::PUBLIC), 0));
    s_bases.push_back(std::make_pair(::Reflex::Base( ::Reflex::TypeBuilder(Reflex::Literal("INamedInterface")), ::Reflex::BaseOffset< ::Trig::ITrigNtTool,::INamedInterface >::Get(),::Reflex::VIRTUAL |::Reflex::PUBLIC), 1));
    s_bases.push_back(std::make_pair(::Reflex::Base( ::Reflex::TypeBuilder(Reflex::Literal("IInterface")), ::Reflex::BaseOffset< ::Trig::ITrigNtTool,::IInterface >::Get(),::Reflex::VIRTUAL |::Reflex::PUBLIC), 2));
  }
  if (retaddr) *(Bases_t**)retaddr = &s_bases;
}

//------Dictionary for class ITrigNtTool -------------------------------
void __Trig__ITrigNtTool_db_datamem(Reflex::Class*);
void __Trig__ITrigNtTool_db_funcmem(Reflex::Class*);
Reflex::GenreflexMemberBuilder __Trig__ITrigNtTool_datamem_bld(&__Trig__ITrigNtTool_db_datamem);
Reflex::GenreflexMemberBuilder __Trig__ITrigNtTool_funcmem_bld(&__Trig__ITrigNtTool_db_funcmem);
void __Trig__ITrigNtTool_dict() {
  ::Reflex::ClassBuilder(Reflex::Literal("Trig::ITrigNtTool"), typeid(::Trig::ITrigNtTool), sizeof(::Trig::ITrigNtTool), ::Reflex::PUBLIC | ::Reflex::ARTIFICIAL | ::Reflex::ABSTRACT | ::Reflex::VIRTUAL, ::Reflex::CLASS)
  .AddBase(type_2517, ::Reflex::BaseOffset< ::Trig::ITrigNtTool, ::IAlgTool >::Get(), ::Reflex::VIRTUAL | ::Reflex::PUBLIC)
  .AddFunctionMember(::Reflex::FunctionTypeBuilder(type_23996, type_23997), Reflex::Literal("operator="), operator_10923, 0, "", ::Reflex::PUBLIC | ::Reflex::ARTIFICIAL | ::Reflex::OPERATOR)
  .AddFunctionMember(::Reflex::FunctionTypeBuilder(type_void), Reflex::Literal("~ITrigNtTool"), destructor_10925, 0, 0, ::Reflex::PUBLIC | ::Reflex::VIRTUAL | ::Reflex::DESTRUCTOR )
  .AddFunctionMember<void*(void)>(Reflex::Literal("__getBasesTable"), method_x0, 0, 0, ::Reflex::PUBLIC | ::Reflex::ARTIFICIAL)
  .AddOnDemandFunctionMemberBuilder(&__Trig__ITrigNtTool_funcmem_bld);
}

//------Delayed data member builder for class ITrigNtTool -------------------
void __Trig__ITrigNtTool_db_datamem(Reflex::Class*) {

}
//------Delayed function member builder for class ITrigNtTool -------------------
void __Trig__ITrigNtTool_db_funcmem(Reflex::Class* cl) {
  ::Reflex::ClassBuilder(cl)
  .AddFunctionMember(::Reflex::FunctionTypeBuilder(type_6775), Reflex::Literal("interfaceID"), method_10926, 0, 0, ::Reflex::PUBLIC | ::Reflex::STATIC)
  .AddFunctionMember(::Reflex::FunctionTypeBuilder(type_1793, type_23998), Reflex::Literal("SetSteer"), method_10927, 0, "", ::Reflex::PUBLIC | ::Reflex::VIRTUAL)
  .AddFunctionMember(::Reflex::FunctionTypeBuilder(type_1793, type_1161), Reflex::Literal("SetOption"), method_10928, 0, "option", ::Reflex::PUBLIC | ::Reflex::VIRTUAL)
  .AddFunctionMember(::Reflex::FunctionTypeBuilder(type_6805, type_23999), Reflex::Literal("Fill"), method_10929, 0, "", ::Reflex::PUBLIC | ::Reflex::VIRTUAL | ::Reflex::ABSTRACT)
  .AddFunctionMember(::Reflex::FunctionTypeBuilder(type_6805, type_10934), Reflex::Literal("Fill"), method_10930, 0, "", ::Reflex::PUBLIC | ::Reflex::VIRTUAL | ::Reflex::ABSTRACT)
  .AddFunctionMember(::Reflex::FunctionTypeBuilder(type_1793), Reflex::Literal("Done"), method_10931, 0, 0, ::Reflex::PUBLIC | ::Reflex::VIRTUAL);
}
static void function_2856( void* retaddr, void*, const std::vector<void*>& arg, void*)
{
  if ( arg.size() == 3 ) {
    if (retaddr) new (retaddr) (std::basic_string<char>)(Trig::MergeEvent(*(::TrigMonEvent*)arg[0],
      *(const ::TrigMonEvent*)arg[1],
      *(int*)arg[2]));
    else Trig::MergeEvent(*(::TrigMonEvent*)arg[0],
      *(const ::TrigMonEvent*)arg[1],
      *(int*)arg[2]);
  }
  else if ( arg.size() == 4 ) { 
    if (retaddr) new (retaddr) (std::basic_string<char>)(Trig::MergeEvent(*(::TrigMonEvent*)arg[0],
      *(const ::TrigMonEvent*)arg[1],
      *(int*)arg[2],
      *(const ::std::basic_string<char>*)arg[3]));
    else Trig::MergeEvent(*(::TrigMonEvent*)arg[0],
      *(const ::TrigMonEvent*)arg[1],
      *(int*)arg[2],
      *(const ::std::basic_string<char>*)arg[3]);
  }
}
namespace {
  struct Dictionaries {
    Dictionaries() {
      Reflex::Instance initialize_reflex;
      __Trig__ITrigNtTool_dict(); 
      ::Reflex::Type t0 = ::Reflex::FunctionTypeBuilder(type_1965, type_10934, type_10932, type_1277, type_10077);      ::Reflex::FunctionBuilder(t0, Reflex::Literal("Trig::MergeEvent"), function_2856, 0, Reflex::Literal("event;other;level_other;option=\"\""), ::Reflex::PUBLIC);
    }
    ~Dictionaries() {
      type_2852.Unload(); // class Trig::ITrigNtTool 
    }
  };
  static Dictionaries instance;
}
} // unnamed namespace
