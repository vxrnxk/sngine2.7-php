<?php
/**
 * class -> pager
 * 
 * @package Sngine
 * @author Zamblek
 */

class Pager {
    
    private $_page;
    private $_size;
    private $_total;
    private $_link;
    
    /**
     * __construct
     * 
     * @param array $params
     */
    public function __construct($params) {
        if(is_array($params)) {
            if(isset($params['selected_page'])) {
                $params['selected_page'] = (int)$params['selected_page'];
                $params['selected_page'] = ($params['selected_page'] == 0) ? 1 : $params['selected_page'];
                
                $this->_page = $params['selected_page'];
            } else {
                $this->_page = NULL;
                exit("sd");
            }
            $this->_total = isset($params['total_items']) ? $params['total_items'] : NULL;
            $this->_size = isset($params['items_per_page']) ? $params['items_per_page'] : NULL;
            $this->_link = isset($params['url']) ? $params['url'] : NULL;
        }
    }
    
    /**
     * getLimitSql
     * 
     * @return string
     */
    public function getLimitSql() {
        
        $sql = "LIMIT " . $this->getLimit();
        return $sql;
    }
    
    /**
     * getLimit
     * 
     * @return string
     */
    private function getLimit() {
        
        if($this->_total == 0) {
            $lastpage = 0;
        }else {
            $lastpage = ceil($this->_total/$this->_size);
        }
        
        $page = $this->_page;
        
        if($this->_page < 1) {
            $page = 1;
        }elseif ($this->_page > $lastpage && $lastpage > 0) {
            $page = $this->_page;
        }else {
            $page = $this->_page;
        }
        
        $sql = ($page - 1) * $this->_size . "," . $this->_size;
        
        return $sql;
    }
    
    /**
     * getPager
     * 
     * @return string
     */
    public function getPager() {
        
        $totalPages = floor($this->_total / $this->_size);
        $totalPages += ($this->_total % $this->_size != 0) ? 1 : 0;
        
        
        if($this->_page == $totalPages) {
            $to = ($this->_total - $this->_size) + $this->_size;
            $from = ($this->_page * $this->_size) - $this->_size  + 1;
        }else {
            $to = ($this->_page * $this->_size);
            $from = $to - $this->_size  + 1;
        }
        
        if($totalPages <= 1) {
            return null;
		}
        
        // total pages
        $output = '<li class="page-item previous disabled"><a class="page-link">'.__("Displaying").' ('.$from.'-'.$to.' '.__("of").' '.$this->_total.')</a></li>';
        
        // prepare loop
        $loopStart = 1;
        $loopEnd = $totalPages;
        
        if($totalPages > 5) {
            if ($this->_page <= 3) {
                $loopStart = 1;
                $loopEnd = 5;
            }elseif ($this->_page >= $totalPages - 2) {
                $loopStart = $totalPages - 4;
                $loopEnd = $totalPages;
            }else {
                $loopStart = $this->_page - 2;
                $loopEnd = $this->_page + 2;
            }
        }
        
        // go to first page
        if($loopStart != 1) {
            $output .= sprintf('<li class="page-item"><a class="page-link" href="' . $this->_link . '">&#171;</a></li>', '1');
        }
        
        // previous page
        if($this->_page > 1) {
            $output .= sprintf('<li><a class="page-link" href="' . $this->_link . '">'.__("Prev").'</a></li>', $this->_page - 1);
        }
        
        // pages
        for($i = $loopStart; $i <= $loopEnd; $i++) {
            if($i == $this->_page) {
                $output .= '<li class="page-item active"><a class="page-link">' . $i . '</a></li> ';
            }else {
                $output .= sprintf('<li class="page-item"><a class="page-link" href="' . $this->_link . '">', $i) . $i . '</a></li> ';
            }
        }
        
        // next page
        if($this->_page < $totalPages) {
            $output .= sprintf('<li class="page-item"><a class="page-link" href="' . $this->_link . '">'.__("Next").'</a></li>', $this->_page + 1);
		}
        
        // go to last page
        if($loopEnd != $totalPages){
            $output .= sprintf('<li class="page-item"><a class="page-link" href="' . $this->_link . '">&#187;</a></li>', $totalPages);
		}
        
        return '<ul class="pagination">' . $output . '</ul>';
    }
    
    /**
     * display
     * 
     * @return void
     */
    public function display() {
        
        print($this->getPager());
    }
    
}
?>