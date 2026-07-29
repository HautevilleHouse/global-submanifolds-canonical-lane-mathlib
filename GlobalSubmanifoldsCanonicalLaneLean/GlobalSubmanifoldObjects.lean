import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure GlobalSubmanifoldObject where
  ambientManifold : Type
  submanifold : Type
  embedding : submanifold → ambientManifold
  closedCondition : Prop
  embeddedSubmanifold : Prop
  globalProductStructure : Prop
  conclusion : closedCondition ∧ embeddedSubmanifold ∧ globalProductStructure

structure GlobalSubmanifoldAdmittedObject where
  object : GlobalSubmanifoldObject
  conclusion : object.conclusion

def GlobalSubmanifoldWitnessClosed (O : GlobalSubmanifoldAdmittedObject) : Prop :=
  O.conclusion

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse
