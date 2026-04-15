add_llvm_library(LLVMMimicryPasses MODULE
  # List all your .cpp files here
  MimicryInstrument.cpp
  FeliDefUseInfo.cpp
  # Add any other pass files you have
  
  PLUGIN_TOOL
  opt
)
