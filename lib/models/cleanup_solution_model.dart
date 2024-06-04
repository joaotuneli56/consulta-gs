// cleanup_solution_model.dart

enum CleanupStatus { inProgress, completed, pending, inMaintenance, inOperation, harvesting }

class CleanupSolution {
  final String name;
  final String since;
  final String description;
  final String image;
  final String statusDescription;
  final CleanupStatus status;
  final int id;
  final List<String> imagesGallery;

  CleanupSolution({
    required this.name,
    required this.since,
    required this.description,
    required this.image,
    required this.statusDescription,
    required this.status,
    required this.id,
    required this.imagesGallery,
  });

  // Método de exemplo para obter uma lista de soluções de limpeza
  static List<CleanupSolution> getList() {
    return [
      // Lista de exemplos
    ];
  }
}
