Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E5D3F44D5
	for <loongarch@lists.linux.dev>; Tue, 26 May 2026 11:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796586; cv=none; b=p7LLlDUSJrqa3O6156iMpIdfi5/LC0YN9UrQ1NaLpE3LxzT33EtmI1ul8Ims3CXwWo261sF7zCKvAVFSQ7hYCC8Zt3wG5ThzsRvLfOklKNiPKQtHX0Vj0APES6Lfj6jRftIIN9+UqkJzjfkrcZayvx2AJX+1PpaMZPn/PgVU7Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796586; c=relaxed/simple;
	bh=WDBD7odW8qeNfAPZ82pQiC+MuUy5bvT0fucchfMOiMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mANOJPjDvpzVCBN6uNcc00eLska6qI+Z94QNTPJxeitJ8SqggOaXAmpwqS6fEvQ7WTzIPbEI6zWpYSl6uoJUKgLbD4kgjZyu8DX4fMjEy+1Rg7HLzSG0EWjKPdrfQ4vpMX+bRtvgblkPOzMN5TqOQJYHHikFMdQF/fzJ2XX63vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8CxRXhfihVqmGMNAA--.13862S3;
	Tue, 26 May 2026 19:56:15 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJCxGOBYihVq04+RAA--.13379S3;
	Tue, 26 May 2026 19:56:14 +0800 (CST)
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
Subject: [PATCH v2 1/5] MAINTAINERS: Add entry for Loongson ASoC driver
Date: Tue, 26 May 2026 19:55:59 +0800
Message-ID: <07d8cfd65906ce64498e14b4a27760e65a09f067.1779796354.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1779796354.git.zhoubinbin@loongson.cn>
References: <cover.1779796354.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxGOBYihVq04+RAA--.13379S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQETCGoVNlwIuwAAs9
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xr1UJw4DWF1UXrW7WrWUZFc_yoWDJrc_Ca
	yIg3yxWry8AF17G39YvF4xtrWYq3yfC3Wru3ZFqws7Aa4Utr9xtryDAwnIkr17Xr4ruFsx
	Za97Gr1xur12qosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8SksDUUUUU==

Add MAINTAINERS entry for Loongson I2S ASoC drivers to track
changes in sound/soc/loongson/ directory.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 792bbcd4d40a..4d5a8d7f7acc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15050,6 +15050,15 @@ F:	arch/loongarch/
 F:	drivers/*/*loongarch*
 F:	drivers/cpufreq/loongson3_cpufreq.c
 
+LOONGSON AUDIO (ASoC) DRIVERS
+M:	Binbin Zhou <zhoubinbin@loongson.cn>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
+F:	Documentation/devicetree/bindings/sound/loongson,ls2k1000-i2s.yaml
+F:	sound/soc/loongson/loongson_*.c
+F:	sound/soc/loongson/loongson_*.h
+
 LOONGSON GPIO DRIVER
 M:	Yinbo Zhu <zhuyinbo@loongson.cn>
 L:	linux-gpio@vger.kernel.org
-- 
2.52.0

