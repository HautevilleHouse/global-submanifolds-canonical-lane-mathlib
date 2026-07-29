import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GlobalSubmanifoldsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse