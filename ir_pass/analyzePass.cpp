#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IR/IRBuilder.h"
#include <vector>

using namespace llvm;

struct AnalyzePass : public PassInfoMixin<AnalyzePass> {

  bool isLogger(StringRef name) {
    return name == "instructionLogger" || name == "initLogger" || name == "closeLogger";
  }

  PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
    for (auto &F : M) {
      if (isLogger(F.getName()) || F.isDeclaration()) {
        continue;
      }

      LLVMContext &Ctx = F.getContext();
      Type *voidType = Type::getVoidTy(Ctx);
      Type *charPtrType = Type::getInt8Ty(Ctx)->getPointerTo();

      ArrayRef<Type*> instrLogParams = {charPtrType, charPtrType};
      FunctionType *instrLogFuncType = FunctionType::get(voidType, instrLogParams, false);
      FunctionCallee instrLogFunc = M.getOrInsertFunction("instructionLogger", instrLogFuncType);

      std::vector<std::pair<Instruction*, Instruction*>> pairs;

      FunctionType *voidFuncType = FunctionType::get(voidType, false);
      FunctionCallee initLoggerFunc = M.getOrInsertFunction("initLogger", voidFuncType);
      FunctionCallee closeLoggerFunc = M.getOrInsertFunction("closeLogger", voidFuncType);

      if (F.getName() == "main") {
        IRBuilder<> builder(&F.getEntryBlock().front());
        builder.CreateCall(initLoggerFunc);
        
        for (auto &B : F) {
          for (auto &I : B) {
            if (auto* retPtr = dyn_cast<ReturnInst>(&I)) {
              IRBuilder<> returnBuilder(retPtr);
              returnBuilder.CreateCall(closeLoggerFunc);
            }
          }
        }
      }
      
      for (auto &B : F) {
        for (auto &I : B) {
          if (isa<PHINode>(&I)) continue;
          
          for(auto* user : I.users()) {
            if(auto* userI = dyn_cast<Instruction>(user)) {
              if(isa<PHINode>(userI)) continue;
              pairs.emplace_back(userI, &I);
            }
          }
        }
      }

      for(auto[caller, callee] : pairs) {
        IRBuilder<> builder(callee->getContext());
        
        if (callee->isTerminator()) {
          builder.SetInsertPoint(callee);
        } else {
          builder.SetInsertPoint(callee->getNextNode());
        }
        
        Value* calleeName = builder.CreateGlobalStringPtr(callee->getOpcodeName());
        Value* callerName = builder.CreateGlobalStringPtr(caller->getOpcodeName());
        Value* args[] = {calleeName, callerName};
        builder.CreateCall(instrLogFunc, args);
      }

      bool verif = verifyFunction(F, &outs());
      outs() << "[VERIFICATION] " << (verif ? "FAIL\n" : "OK\n");
    }
    
    return PreservedAnalyses::none();
  }
};

PassPluginLibraryInfo getPassPluginInfo() {
  const auto callback = [](PassBuilder &PB) {
    PB.registerPipelineStartEPCallback([](ModulePassManager &MPM, auto) {
      MPM.addPass(AnalyzePass{});
      return true;
    });
  };

  return {LLVM_PLUGIN_API_VERSION, "analyze-pass", "0.0.1", callback};
};

/* When a plugin is loaded by the driver, it will call this entry point to
obtain information about this plugin and about how to register its passes.
*/
extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return getPassPluginInfo();
}
