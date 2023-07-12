Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA20810
	for <loongarch@lists.linux.dev>; Wed, 12 Jul 2023 03:16:24 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.9.158])
	by gateway (Coremail) with SMTP id _____8CxLOsGG65keMcDAA--.5571S3;
	Wed, 12 Jul 2023 11:16:22 +0800 (CST)
Received: from kvm-1-158.loongson.cn (unknown [10.2.9.158])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxWM0GG65kA7cpAA--.53483S2;
	Wed, 12 Jul 2023 11:16:22 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH 0/3] LoongArch: mm: Code cleanup with populate pte
Date: Wed, 12 Jul 2023 11:16:19 +0800
Message-Id: <20230712031622.1888321-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxWM0GG65kA7cpAA--.53483S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZrWkAryDAw4kJF1fKr1ruFX_yoWxAFb_Xa
	4ftasYkr4xXayUKay8KF4rJFWjkF4v9F1qyFykJFW7GFy3Jw1UJF42yan8Za4q9FW7trs5
	Aw45ArnYvw129osvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8m9aDUUUUU==

There are some confusion between pdg and p4d when populate pte for
kernel address space. This patch modifies this issue and adds unified
function for pcpu and fixmap populate pte.

Bibo Mao (3):
  mm/percpu: Remove some local variables in pcpu_populate_pte
  LoongArch: Code cleanup in function pcpu_populate_pte
  LoongArch: mm: Add unified function populate_kernel_pte

 arch/loongarch/include/asm/pgalloc.h |  1 +
 arch/loongarch/kernel/numa.c         | 35 ++-----------------
 arch/loongarch/mm/init.c             | 52 ++++++++++++++++------------
 mm/percpu.c                          | 24 +++++--------
 4 files changed, 42 insertions(+), 70 deletions(-)

-- 
2.27.0

