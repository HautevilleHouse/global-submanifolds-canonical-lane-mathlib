import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GlobalSubmanifoldsCanonicalLaneLean

structure GeodesicCompletenessPackage where
  manifold : Type u
  metric : Type v
  hopfRinowEquivalent : Prop
  geodesicConnected : Prop
  completenessTransferToSubmanifold : Prop
  closureUnderParallelTransport : Prop
  hopfRinowEquivalentTerm : hopfRinowEquivalent
  geodesicConnectedTerm : geodesicConnected
  completenessTransferTerm : completenessTransferToSubmanifold
  closureUnderParallelTransportTerm : closureUnderParallelTransport

structure GeodesicCompletenessEvidence (G : GeodesicCompletenessPackage) where
  hopfRinowEquivalentClosed : G.hopfRinowEquivalent
  geodesicConnectedClosed : G.geodesicConnected
  completenessTransferClosed : G.completenessTransferToSubmanifold
  closureUnderParallelTransportClosed : G.closureUnderParallelTransport

def GeodesicCompletenessClosed (G : GeodesicCompletenessPackage) : Prop :=
  G.hopfRinowEquivalent ∧ G.geodesicConnected ∧ G.completenessTransferToSubmanifold ∧ G.closureUnderParallelTransport

theorem geodesic_completeness_closed_from_evidence (G : GeodesicCompletenessPackage)
    (Ev : GeodesicCompletenessEvidence G) : GeodesicCompletenessClosed G := by
  exact And.intro Ev.hopfRinowEquivalentClosed
    (And.intro Ev.geodesicConnectedClosed
      (And.intro Ev.completenessTransferClosed Ev.closureUnderParallelTransportClosed))

end GlobalSubmanifoldsCanonicalLaneLean
end HautevilleHouse