Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921693A0E97
	for <loongarch@lists.linux.dev>; Wed, 18 Mar 2026 09:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825431; cv=none; b=QyM00seEg/Scg/mZm9nYfkPvORRBQm+BPmgMhmciTw0yAsIfD0z5vWz34qspc6V4JrF8LEa19Sa7vyWP0q7CEP2jEE5jVucKLjDTczMe30GKevnp6SHiKf322AgPPn7nhFWIhBNrqwgwOt7+f+QQLKlYUUJ/4vyYiTIKGVBdgZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825431; c=relaxed/simple;
	bh=8rajb01R8JqD6irW/Mze0ckDdmzBwFMKgXIdLKqdvp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTyJrdcLw3fvr/Ik6Z8w7M4RqYAbb2M7GzI7fcvn1fqYGxzAP82ETXVN1Oqj8jWqGHuGQDHSC5xyIAA+m8loWi0xR1KjF1OosOK5N8prncBXBD+gngK/DEsX6imvpcPxueqQ+urT8PMO+YySDqRiXOm3jmvDHWCUQru/BqjQJ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.17])
	by gateway (Coremail) with SMTP id _____8BxD6qLbbpp70QcAA--.22714S3;
	Wed, 18 Mar 2026 17:16:59 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.17])
	by front1 (Coremail) with SMTP id qMiowJBxKMF+bbppwqlXAA--.23316S3;
	Wed, 18 Mar 2026 17:16:58 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 1/4] MAINTAINERS: Add entry for Loongson ASoC driver
Date: Wed, 18 Mar 2026 17:16:35 +0800
Message-ID: <38d58f79a227177e9ba5211cdaff67adedcce3fa.1773821115.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773821115.git.zhoubinbin@loongson.cn>
References: <cover.1773821115.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxKMF+bbppwqlXAA--.23316S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEKCGm6PqMDjAAAsA
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jr4fJrWDWrykKw1kZr4fZwc_yoW3AFg_u3
	Wag3yxWry8AFnrG3y8XryxAryYq3yxG3WruFnrtw45Aa4jywn8tryDArnrGry3ur4rCFsI
	qayxG3Wxur1jqosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOb18UUUUU=

Add myself as maintainer of Loongson ASoC driver as I will be
responsible for this driver.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96ea84948d76..6a652d8878bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14935,6 +14935,13 @@ F:	arch/loongarch/
 F:	drivers/*/*loongarch*
 F:	drivers/cpufreq/loongson3_cpufreq.c
 
+LOONGSON AUDIO (ASoC) DRIVERS
+M:	Binbin Zhou <zhoubinbin@loongson.cn>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	sound/soc/loongson/loongson_*.c
+F:	sound/soc/loongson/loongson_*.h
+
 LOONGSON GPIO DRIVER
 M:	Yinbo Zhu <zhuyinbo@loongson.cn>
 L:	linux-gpio@vger.kernel.org
-- 
2.52.0

