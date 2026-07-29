import GlobalSubmanifoldsCanonicalLaneLean.GlobalSubmanifoldAdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GlobalSubmanifoldWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse
