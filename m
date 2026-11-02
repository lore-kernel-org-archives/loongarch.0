Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608055;
	b=5p9lP+npxN3iE6Vl75dZ77TMAGYQuk9Um3qMPcn112gkmBKygkIWEwzQwRrvhyesXCWv
	 J9uBxW9meXH6IW55mKG/Vepx/TpOG9C86eeeYF4rQE/z6hJSPEVew4GWEh25jChW5iMMC
	 SZUeL8Zy0On2AZjIq63LAnLLZ6LsNpumZb+724/ZcgqR7Y7uyATQTcHVuvEeQCAaa7exM
	 1O9/mUo0XeFXbgQ6o2guk191VMMClZs7Ie6sw5HCKlZp0rbP4BNuWakK6O3i35xIE6cOB
	 T5LKEASEpWR+TyRMBjKefXSMbxL6TVrGl/HmmaklgQGBM3CLE4mCTDXhuFZaNhMpIVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608055;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=8rzT69sai/1JVMZrPPxqbIhnSUltQ4xUL98H0qfUrjY=;
	b=dKQjSDQbhA4i+meHECKVKCMAj003pme04PRCkB4FqnFntMebp2TX4iMB22Kj4uyHDszL
	 2TWP+eOMfun183L76djw6ZBGv+2mHNW5EavBZjeEr+1oleGjC5nPTgtlbvMGegjANPyBU
	 5fxHk4vYBhbyRKY/SjUx3wt6LDzYUVtBCQ6dG32AgPqe8MYJrNXw/K2Mz4ib1SijDOr6d
	 157B6i+G0YHl1NXK5cYOt/+JcBhjBhHlwoGztLby4mYFMbOI+Ng5MYLxKqMATij2gwONK
	 o2LdyI9h6lCqZyESj7EbiEoYMYNaTi8Pp1Qw1+EJV3JXrkgl3RAoF66KylHd1GjmgKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854D3606A326
	for <loongarch@lists.linux.dev>; Mon,  2 Nov 2026 08:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 854D3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxytF0SehqknkbAA--.13538S3;
	Mon, 02 Nov 2026 16:27:32 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJBx5cxzSehqyc0xAA--.10726S2;
	Mon, 02 Nov 2026 16:27:31 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>
Cc: linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] mm/slub: Genericize x86-specific cmpxchg16b comment
Date: Mon,  2 Nov 2026 16:27:30 +0800
Message-ID: <20261102082730.12430-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBx5cxzSehqyc0xAA--.10726S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF45uw4UCF4xKw4DKF1Dtwc_yoW8Aw48pa
	17A3yjqan8ur1I9a47Cw47u343Jay8KFW2k3yfCw13Zwn8Kw1fKF1xt3yFqF4rXrWfua1j
	qF1ktFWjvF4UAFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8uc_3UUUUU==

The kmalloc_nolock() infrastructure relies on slab caches with double-word
atomic cmpxchg capabilities (__CMPXCHG_DOUBLE). The current inline comment
in __kmalloc_nolock_noprof() uses 'cmpxchg16b' as the prerequisite hardware
capability.

However, "cmpxchg16b" is an x86-specific instruction mnemonic (CX16). On
modern architectures supported by the Linux kernel, this 128-bit atomic
primitive is satisfied by different hardware implementations:
  - arm64: satisfies it via LSE atomics ('casp' instruction)
  - s390: satisfies it via native 'cdsg' instruction
  - riscv: satisfies it via ZACAS extension ('amocas.q' instruction)
  - loongarch: satisfies it via SCQ extension (using an 'll.d'/'sc.q' loop)

Update the comment to refer to "128-bit atomic cmpxchg" to accurately
describe the cross-platform hardware invariant needed by the lockless
allocator, and to avoid misleading developers of non-x86 archs.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 mm/slub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 45e077c7526c..216bc6b5d776 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -5589,8 +5589,8 @@ static void *__kmalloc_nolock_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t gfp_f
 	if (!(s->flags & __CMPXCHG_DOUBLE) && !kmem_cache_debug(s))
 		/*
 		 * kmalloc_nolock() is not supported on architectures that
-		 * don't implement cmpxchg16b and thus need slab_lock()
-		 * which could be preempted by a nmi.
+		 * don't implement 128-bit atomic cmpxchg and thus need
+		 * slab_lock() which could be preempted by a nmi.
 		 * But debug caches don't use that and only rely on
 		 * kmem_cache_node->list_lock, so kmalloc_nolock() can attempt
 		 * to allocate from debug caches by
-- 
2.42.0

