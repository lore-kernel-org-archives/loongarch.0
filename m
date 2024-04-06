Received: from dggsgout12.his.huawei.com (unknown [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B410B381DE
	for <loongarch@lists.linux.dev>; Sat,  6 Apr 2024 08:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712390962; cv=none; b=Dx8IHthpJ/Zpt902BIDxZCsZt+EILvANW2txYWU8QjXV76I2OzVD4EYmNC3F+3h1ePO3QZkAGjcYquqPwHak4jUPyDHwLeccmiCK5IlfRvMVVCYSMfXJTO33hExBanhK12lDZ6rygRCKkbD0xqTXn6ed/cPigH0uBdpmfHe8R0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712390962; c=relaxed/simple;
	bh=RGeLpQq1tNqBVU02itqj6kS9o7uyCx/gUkBGHq49FmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=InPQndCnG4ISFgeFtm+xnbZCcEjuARRFQGmgTem5NCHUCnnyANw+Cyaz0hfym7S6+/GWIu03wzleNLKpBxF3W64AUXP2QnsTcBz/WA8Z5NRyGsYTXcy5owwNTfQ3Kp2y+eg/uPo5rFQ4Fzfvd9RCbnVztB8P9cHpLwYFodl3x90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4VBSg4651sz4f3kGJ
	for <loongarch@lists.linux.dev>; Sat,  6 Apr 2024 16:09:04 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 7EED71A0572
	for <loongarch@lists.linux.dev>; Sat,  6 Apr 2024 16:09:11 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgDHlxAjAxFmnZTkJA--.2125S7;
	Sat, 06 Apr 2024 16:09:11 +0800 (CST)
From: Yu Kuai <yukuai1@huaweicloud.com>
To: axboe@kernel.dk,
	chenhuacai@kernel.org,
	tj@kernel.org,
	josef@toxicpanda.com,
	jhs@mojatatu.com,
	svenjoac@gmx.de,
	raven@themaw.net,
	pctammela@mojatatu.com,
	yukuai3@huawei.com,
	qde@naccy.de,
	zhaotianrui@loongson.cn
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	cgroups@vger.kernel.org,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH RFC v2 3/6] blk-throttle: expand tg_conf_updated() to return if any tg has rules
Date: Sat,  6 Apr 2024 16:00:56 +0800
Message-Id: <20240406080059.2248314-4-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240406080059.2248314-1-yukuai1@huaweicloud.com>
References: <20240406080059.2248314-1-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgDHlxAjAxFmnZTkJA--.2125S7
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr47Kr4xtry3ur17GryDJrb_yoW5Jr48pF
	yUAa1UJw4DZFs09rsxJr1qgFWFqan7Zryaq393Ww4rtr4aqwnYgFn0vryruayrAF93uF4x
	ZrsrtrWYkF109FDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUojjgUUUU
	U
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

From: Yu Kuai <yukuai3@huawei.com>

There are no functional changes yet, prepare to destroy blk-throttle
when it's disabled.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 block/blk-throttle.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/block/blk-throttle.c b/block/blk-throttle.c
index acb2758f45ef..b371442131fe 100644
--- a/block/blk-throttle.c
+++ b/block/blk-throttle.c
@@ -320,9 +320,10 @@ static void throtl_pd_init(struct blkg_policy_data *pd)
  * This doesn't require walking up to the top of the hierarchy as the
  * parent's has_rules[] is guaranteed to be correct.
  */
-static void tg_update_has_rules(struct throtl_grp *tg)
+static bool tg_update_has_rules(struct throtl_grp *tg)
 {
 	struct throtl_grp *parent_tg = sq_to_tg(tg->service_queue.parent_sq);
+	bool has_rules = false;
 	int rw;
 
 	for (rw = READ; rw <= WRITE; rw++) {
@@ -332,7 +333,11 @@ static void tg_update_has_rules(struct throtl_grp *tg)
 		tg->has_rules_bps[rw] =
 			(parent_tg && parent_tg->has_rules_bps[rw]) ||
 			tg_bps_limit(tg, rw) != U64_MAX;
+		if (tg->has_rules_iops[rw] || tg->has_rules_bps[rw])
+			has_rules = true;
 	}
+
+	return has_rules;
 }
 
 static void throtl_pd_online(struct blkg_policy_data *pd)
@@ -1163,11 +1168,12 @@ static int tg_print_conf_uint(struct seq_file *sf, void *v)
 	return 0;
 }
 
-static void tg_conf_updated(struct throtl_grp *tg, bool global)
+static bool tg_conf_updated(struct throtl_grp *tg, bool global)
 {
 	struct throtl_service_queue *sq = &tg->service_queue;
 	struct cgroup_subsys_state *pos_css;
 	struct blkcg_gq *blkg;
+	bool has_rules = false;
 
 	throtl_log(&tg->service_queue,
 		   "limit change rbps=%llu wbps=%llu riops=%u wiops=%u",
@@ -1187,7 +1193,8 @@ static void tg_conf_updated(struct throtl_grp *tg, bool global)
 		struct throtl_grp *this_tg = blkg_to_tg(blkg);
 		struct throtl_grp *parent_tg;
 
-		tg_update_has_rules(this_tg);
+		if (tg_update_has_rules(this_tg))
+			has_rules = true;
 		/* ignore root/second level */
 		if (!cgroup_subsys_on_dfl(io_cgrp_subsys) || !blkg->parent ||
 		    !blkg->parent->parent)
@@ -1211,6 +1218,8 @@ static void tg_conf_updated(struct throtl_grp *tg, bool global)
 		tg_update_disptime(tg);
 		throtl_schedule_next_dispatch(sq->parent_sq, true);
 	}
+
+	return has_rules;
 }
 
 static int blk_throtl_init(struct gendisk *disk)
-- 
2.39.2

