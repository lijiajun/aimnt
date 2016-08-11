package com.ai.mnt.persistence.inst;


import java.util.List;

import org.springframework.stereotype.Repository;




import com.ai.mnt.model.inst.MntReqTrack;
import com.ai.mnt.persistence.base.CrudMapper;

/**
 * @Title: MntReqTrackMapper 
 * @Description: MntReqTrackMapper Persistence
 * @Author: Auto Generate. HE
 * @Date: 2016-7-27
 */
@Repository
public interface MntReqTrackMapper extends CrudMapper<MntReqTrack, Integer>{
   /* public List<MntReqTrack> findListStatistics(MntReqTrack mntReqTrack);
    public List<MntReqTrack> findListStatisticsByBaseName(MntReqTrack mntReqTrack);*/
    public List<MntReqTrack> findListStatisticsByProdName(MntReqTrack mntReqTrack);
    
    public List<MntReqTrack> getReqSummaryStat(MntReqTrack mntReqTrack);
}