<?php

namespace App\DTO;

class UpdateProductDTO
{
    #[Assert\Length(max: 255)]
    public ?string $name = null;

    #[Assert\Type('numeric')]
    #[Assert\PositiveOrZero]
    #[Assert\Range(max: 99999999.99)]
    public ?float $price = null;

    #[Assert\Type('integer')]
    public ?int $category_id = null;

    #[Assert\Choice(callback: [ProductStatus::class, 'values'])]
    public ?string $status = null;

    #[Assert\Type('array')]
    public ?array $attributes = null;
}