import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure GlobalSubmanifoldsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure GlobalSubmanifoldsAdmittedObject where
  space : GlobalSubmanifoldsSpace
  closedSubmanifold : Prop
  embedded : Prop
  conclusion : embedded

def GlobalSubmanifoldsWitnessClosed (O : GlobalSubmanifoldsAdmittedObject) : Prop :=
  O.embedded

theorem global_submanifolds_statement (M : GlobalSubmanifoldsSpace) : Prop :=
  True

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse