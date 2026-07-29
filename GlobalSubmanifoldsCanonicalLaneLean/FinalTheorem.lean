import canonicalLaneMathlib.AdmissibleClass
import GlobalSubmanifoldsCanonicalLaneLean.ImmersionSubmersion
import GlobalSubmanifoldsCanonicalLaneLean.EmbeddingResources
import GlobalSubmanifoldsCanonicalLaneLean.EmbeddedSubmanifold
import GlobalSubmanifoldsCanonicalLaneLean.TransverseIntersection
import GlobalSubmanifoldsCanonicalLaneLean.NormalBundle

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

def ConstrainedGlobalSubmanifoldsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_global_submanifolds_endgame (A : AdmissibleClass) : ConstrainedGlobalSubmanifoldsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse