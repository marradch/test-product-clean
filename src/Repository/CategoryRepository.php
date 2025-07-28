<?php

namespace App\Repository;

use PDO;
use App\Entity\Category;

class CategoryRepository
{
    public function __construct(private PDO $pdo) {}

    public function exists(int $id): bool
    {
        $stmt = $this->pdo->prepare('SELECT 1 FROM categories WHERE id = :id');
        $stmt->execute(['id' => $id]);
        return (bool) $stmt->fetchColumn();
    }
}