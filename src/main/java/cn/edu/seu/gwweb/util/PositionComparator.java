package cn.edu.seu.gwweb.util;

import cn.edu.seu.whitemirror.api.dto.SectionDTO;

import java.util.Comparator;

/**
 * Created with IntelliJ IDEA.
 * User: Junxue Zhang
 * Date: 13-11-10
 * Time: 下午6:11
 * To change this template use File | Settings | File Templates.
 */
public class PositionComparator implements Comparator<SectionDTO> {
    @Override
    public int compare(SectionDTO o1, SectionDTO o2) {
        return o1.getPriority().compareTo(o2.getPriority());
    }
}
