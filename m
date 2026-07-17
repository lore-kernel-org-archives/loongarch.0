Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784103AA4F1
	for <loongarch@lists.linux.dev>; Fri, 17 Jul 2026 07:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784275042; cv=none; b=ttFMp7fAZtzCGzuJ//6sv5+N3mWDdobJhuN1cxyGelnnjydFI3vB9WLxX07Yt8gN0mRKpGEtQe5KKJrDy2gWKp7APGcWiZXqnlqZsId/9YIJAyJgqYt7PfTxjFfkBLO9ZFXfwuBaZutIFbPs4VIHeseXOiSyDWS/0kAhFjAma3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784275042; c=relaxed/simple;
	bh=0LcCs4VkI0i4I902Nhcw62yUBf6er7y5mHgGs6CMtEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1SQt9Q1kccazt86b1TuCsmA/Tp4FOvFr+Xy6AB8K7CghLZ5jduxcuIcETzS6tiH8yAHonktB8LsaZxPUS7H0fRxTcHxH3sFNHYIeuI+KXCh1r/ZGstfM6REyuj6g+k7tbB2gcgJvJB2zccZ2GhnaDMx8zCpQ7hWCVZ69c0H+9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dxeetf4FlqEXsEAA--.17492S3;
	Fri, 17 Jul 2026 15:57:19 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxq8Rc4FlqDNUPAA--.25915S3;
	Fri, 17 Jul 2026 15:57:17 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] mm/execmem: Print size, align and caller on allocation failure
Date: Fri, 17 Jul 2026 15:57:14 +0800
Message-ID: <20260717075715.25513-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260717075715.25513-1-yangtiezhu@loongson.cn>
References: <20260717075715.25513-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxq8Rc4FlqDNUPAA--.25915S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JFy7Gr43Gr4UZFyrKr4kGrX_yoWkZrcEgF
	40gr98Gr9IyF12k3Wqq3W3Xr4Ig3y8ur10gwn2qwnxZa4DJF48Aa4ktrs8urs7u3yqkFn8
	AanIkw4akr47GosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxUc-eODUUUU

The current execmem_vmalloc() function reports an allocation failure
with a simplistic "unable to allocate memory" message. This notifies
the user that an error occurred, but it acts as a black box during
debugging.

Enhance pr_warn_ratelimited() within execmem_vmalloc() to explicitly
print the requested allocation size, alignment constraints, and the
symbolic caller.

This diagnostic visibility is valuable for analyzing the root cause
of allocation failures and tracking misbehaving subsystems without
inducing log pollution.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 mm/execmem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/execmem.c b/mm/execmem.c
index 084a207e4278..f3bc68e0eb98 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -50,7 +50,9 @@ static void *execmem_vmalloc(struct execmem_range *range, size_t size,
 	}
 
 	if (!p) {
-		pr_warn_ratelimited("unable to allocate memory\n");
+		pr_warn_ratelimited("unable to allocate memory, "
+				    "size=%zu, align=%u, caller is %pS\n",
+				     size, align, __builtin_return_address(0));
 		return NULL;
 	}
 
-- 
2.42.0

