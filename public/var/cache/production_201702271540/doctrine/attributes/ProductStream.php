<?php

/**
 * Shopware 5
 * Copyright (c) shopware AG
 *
 * According to our dual licensing model, this program can be used either
 * under the terms of the GNU Affero General Public License, version 3,
 * or under a proprietary license.
 *
 * The texts of the GNU Affero General Public License with an additional
 * permission and of our proprietary license can be found at and
 * in the LICENSE file you have received along with this program.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Affero General Public License for more details.
 *
 * "Shopware" is a registered trademark of shopware AG.
 * The licensing of the program under the AGPLv3 does not imply a
 * trademark license. Therefore any rights, title and interest in
 * our trademarks remain entirely with us.
 */


namespace Shopware\Models\Attribute;
use Shopware\Components\Model\ModelEntity,
    Doctrine\ORM\Mapping AS ORM,
    Symfony\Component\Validator\Constraints as Assert,
    Doctrine\Common\Collections\ArrayCollection;


/**
 * @ORM\Entity
 * @ORM\Table(name="s_product_streams_attributes")
 */
class ProductStream extends ModelEntity
{
    

    /**
     * @var integer $id
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     * @ORM\Column(name="id", type="integer", nullable=false)
     */
     protected $id;


    /**
     * @var integer $productStreamId
     *
     * @ORM\Column(name="streamID", type="integer", nullable=false)
     */
     protected $productStreamId;


    /**
     * @var \Shopware\Models\ProductStream\ProductStream
     *
     * @ORM\OneToOne(targetEntity="Shopware\Models\ProductStream\ProductStream", inversedBy="attribute")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="streamID", referencedColumnName="id")
     * })
     */
    protected $productStream;
    


    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }
    

    public function getProductStreamId()
    {
        return $this->productStreamId;
    }

    public function setProductStreamId($productStreamId)
    {
        $this->productStreamId = $productStreamId;
        return $this;
    }
    

    public function getProductStream()
    {
        return $this->productStream;
    }

    public function setProductStream($productStream)
    {
        $this->productStream = $productStream;
        return $this;
    }
    
}