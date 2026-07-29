import GlobalSubmanifoldsCanonicalLaneLean.GlobalSubmanifoldGateLemmas

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

def ConstrainedGlobalSubmanifoldClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_global_submanifold_endgame (A : AdmissibleClass) :
    ConstrainedGlobalSubmanifoldClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse
