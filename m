Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77F22F5468
	for <loongarch@lists.linux.dev>; Wed,  4 Mar 2026 01:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772587161; cv=none; b=jYP24izogY9L0Y5+YAe0z2TNLME8yUbWz0N9axkV30kpMFVHizPiyPnTrrtzRYyUfbP3izE7QxInkxMwG1WhKyCJ3Be+I+xRKNFfMFh4vSJHhV2cIWo3SgOm16du5WxghawSVt70RWTfxN1fWvRIWJ/jNMwKse4cXqc9Dyyy8q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772587161; c=relaxed/simple;
	bh=cvUz5nycCJzJGIvFMOEtfX5tbJQc5PIUEAbKKTFVa14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TprDOEbQcXC+PW8LyLC18NVCtvAWMYWLAWaLJ4UgvI7w557pa0c5Iv6QC9ehiWWjvEWegK8esMnpCv5/jCpuH5aOx25JXH6eC76T//zMd++BIJcYkRZpDiI+TKN7cs7kSQrIjcR+BoiQLdejcE2qEqhz+NlvcIIHjjt3uP5fod0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.207.111.194])
	by gateway (Coremail) with SMTP id _____8DxNMGUiKdpVEIXAA--.22696S3;
	Wed, 04 Mar 2026 09:19:16 +0800 (CST)
Received: from ubuntu.. (unknown [111.207.111.194])
	by front1 (Coremail) with SMTP id qMiowJCxHOGTiKdp5vFNAA--.17480S2;
	Wed, 04 Mar 2026 09:19:15 +0800 (CST)
From: Ming Wang <wangming01@loongson.cn>
To: kexec@lists.infradead.org
Cc: horms@kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH] LoongArch: Increase MAX_MEMORY_RANGES to 1024
Date: Wed,  4 Mar 2026 09:19:14 +0800
Message-ID: <20260304011914.880120-1-wangming01@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxHOGTiKdp5vFNAA--.17480S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAgEQEmmmeCEbPQAAsx
X-Coremail-Antispam: 1Uk129KBj9xXoW7GFy3XFyUKr45ZFWUGry7CFX_yoWkWFg_WF
	17Zw18WrWrCa17Jw4jga45tayjqFy8AF15ZFn3WF4xGw15JF4ayr4rW345ur1UKrWDZFs5
	J3sYqrsxZw1UtosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU83DG5UU
	UUU==

On some LoongArch systems, especially multi-socket machines like 3D6000,
the current limit of MAX_MEMORY_RANGES (64) is too small to accommodate
all memory range entries in /proc/iomem.

When the limit is reached, get_memory_ranges() stops parsing, which causes
kexec to fail with "locate_hole failed" because it cannot correctly identify
the crash kernel reserved memory or necessary RAM segments.

Increase MAX_MEMORY_RANGES to 1024 to support systems with complex
memory layouts.

Signed-off-by: Ming Wang <wangming01@loongson.cn>
---
 kexec/arch/loongarch/kexec-loongarch.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kexec/arch/loongarch/kexec-loongarch.h b/kexec/arch/loongarch/kexec-loongarch.h
index 2e65eb0..895809c 100644
--- a/kexec/arch/loongarch/kexec-loongarch.h
+++ b/kexec/arch/loongarch/kexec-loongarch.h
@@ -8,7 +8,7 @@
 #define BOOT_BLOCK_VERSION 17
 #define BOOT_BLOCK_LAST_COMP_VERSION 16
 
-#define MAX_MEMORY_RANGES 64
+#define MAX_MEMORY_RANGES 1024
 #define MAX_LINE 160
 
 #define CORE_TYPE_ELF64 1
-- 
2.43.0

