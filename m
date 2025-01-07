Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1C92AEE3
	for <loongarch@lists.linux.dev>; Tue,  7 Jan 2025 06:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736230967; cv=none; b=MG1at9tG9dPaDL1fvKfpYWuI21o5Onugm4yiS+aRKVyLFArGA5CyEkoCkbnaiFHnb6ksl3SvQ7vFWEobjbcf+5WbLSX8zFkj2lfMgp1YsocAM52K3Hp/T7EYEQx/PfMLfrUEbwoKacid9wa9zgt4NrpEnJlZFDFwRS/jZEKkYFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736230967; c=relaxed/simple;
	bh=/htVdya0nMz9rNCXE6q1fKK+pUSud7jwm50b7x9QsCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=teGPD3Z5KbwbhthRWNkrF1OUV7ClhOElilWAKBsjlv6tyybCBY4d0XgIUTd/bLbGr4gHrHqjze8voS+yvi4xjY7hgt6PY4xgMzFwFt407g4e9P0SDTlXysu4NOFgl4qLHdGg6Ls4+Y/8UssSOsvS79dYC0hJF2YubkQW6SwFiGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.63])
	by gateway (Coremail) with SMTP id _____8Cx73MwyHxnAAVfAA--.1369S3;
	Tue, 07 Jan 2025 14:22:41 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
	by front1 (Coremail) with SMTP id qMiowMAxPMUtyHxnH5oXAA--.6012S2;
	Tue, 07 Jan 2025 14:22:40 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Correct the __switch_to() prototype in comments
Date: Tue,  7 Jan 2025 14:22:36 +0800
Message-ID: <20250107062236.940829-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxPMUtyHxnH5oXAA--.6012S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWruFWUtF4rGryrKFW7XrWfXrc_yoW3JFc_Xw
	17ta1UWr1ftaySv3srtr1fWF1jq3WrtF90k3Z7urZ7Jry5trW5JrZYq3W7Ar93KFWxWFZ3
	X3yDXan0vw12kosvyTuYvTs0mTUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4cdbUUUUU

Correct the __switch_to() prototype in comments, keep it be the same as
the declaration in switch_to.h.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/switch.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/switch.S b/arch/loongarch/kernel/switch.S
index 31dd8199b245..9c23cb7e432f 100644
--- a/arch/loongarch/kernel/switch.S
+++ b/arch/loongarch/kernel/switch.S
@@ -12,7 +12,7 @@
 
 /*
  * task_struct *__switch_to(task_struct *prev, task_struct *next,
- *			    struct thread_info *next_ti)
+ *			    struct thread_info *next_ti, void *sched_ra, void *sched_cfa)
  */
 	.align	5
 SYM_FUNC_START(__switch_to)
-- 
2.43.5

