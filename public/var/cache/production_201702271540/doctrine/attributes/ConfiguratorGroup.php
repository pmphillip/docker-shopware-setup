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
 * @ORM\Table(name="s_article_configurator_groups_attributes")
 */
class ConfiguratorGroup extends ModelEntity
{
    

    /**
     * @var integer $id
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     * @ORM\Column(name="id", type="integer", nullable=false)
     */
     protected $id;


    /**
     * @var integer $configuratorGroupId
     *
     * @ORM\Column(name="groupID", type="integer", nullable=false)
     */
     protected $configuratorGroupId;


    /**
     * @var \Shopware\Models\Article\Configurator\Group
     *
     * @ORM\OneToOne(targetEntity="Shopware\Models\Article\Configurator\Group", inversedBy="attribute")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="groupID", referencedColumnName="id")
     * })
     */
    protected $configuratorGroup;
    


    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }
    

    public function getConfiguratorGroupId()
    {
        return $this->configuratorGroupId;
    }

    public function setConfiguratorGroupId($configuratorGroupId)
    {
        $this->configuratorGroupId = $configuratorGroupId;
        return $this;
    }
    

    public function getConfiguratorGroup()
    {
        return $this->configuratorGroup;
    }

    public function setConfiguratorGroup($configuratorGroup)
    {
        $this->configuratorGroup = $configuratorGroup;
        return $this;
    }
    
}