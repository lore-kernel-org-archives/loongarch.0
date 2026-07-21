Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B469A46C4AE;
	Tue, 21 Jul 2026 16:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651105; cv=none; b=BfiFLPQyeUsc5sN52wkRa11pDns1erwOkf+Mj8AqjvDNll/p4r2GtxlgX5tW03xtkN9xBvr8qCJ9lXSPT4Wp71Adfu+XaLyPms9b1S5MG5HroG3zQqaOUehx4e5Q1b8xegX+wWJu1BnuRD8Td46ovJ4zbTj3nJ+6aIw6q2Abdl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651105; c=relaxed/simple;
	bh=9x32j9jXcwO3+3v8rllO8lR9Gi1B816eNohNYUh3Cd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s5DBKovWjz49xTJpFwqUX5XDkaWrNUmPrNP0P2PR6lE3N6NXAnPqfdga3F1Gl2ccp2szB62WGrDerTqawYEOhNNAisrMy3Y5VGPv5mGTV4FIUJihVS+oAN0k4A6JaeM3XWvpdYPTo0FfzxugDGIET0MZLa3uyEHTESio4x+JwTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGIO4UJ5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGIO4UJ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C379D1F00A3F;
	Tue, 21 Jul 2026 16:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651104;
	bh=aHE9E+mQ6FecAcifXNkjcLKFQsJdzpbS6vo0hKS7MCs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JGIO4UJ5qxnF1hC6IdbRB7Cz7UAlenF2xGg1HDepQsa9sW3gzBG8KEjpg4eaajMqn
	 +1z2M14sXjjxZISNdj5pwAqMHTYh+ZMsh7mBT5HDyAo4CqTgBvlVgEdpN1dFHSYHjv
	 rUbGkkyOrsNatXd86xR+fx/PQ1t8YjkznLPlooouTIhlpQwPD4ct6gTnRbtt7ANt/y
	 z/SocZF0FQ4ral3W7XLaZeUMwSW4tF3g82+UCiwgH8TzGWqC5EaaSGPxt1pgyfaO7r
	 j1iXeKTnDY1apTx0ilVi+Jb/uOzHx1utq5agfbvlNdBmjxsPvPlSKQjQ7EZqcXI7ID
	 eKsxCxxA5cFbQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:35 +0300
Subject: [PATCH RFC 12/18] x86/pat/mm, mm/set_memory: abstract the CPA page
 table lock
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-12-2c1fc62306b3@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
To: linux-mm@kvack.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Brendan Jackman <jackmanb@google.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16-dev

x86 requires taking pgd_lock to serialize large page splits against
parallel page table operations, for instance such as
arch_sync_kernel_mappings() and pgd allocation and freeing.

Add arch_lock() and arch_unlock() static inlines that replace direct
locking/unlocking of the pgd_lock in CPA core.

Since only x86 needs such lock, keep things simple and use #ifdef
CONFIG_X86 rather than creating an overridable infrastructure.

No functional change intended.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/set_memory.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/mm/set_memory.c b/mm/set_memory.c
index 712264de8e9b..d2846804e4e6 100644
--- a/mm/set_memory.c
+++ b/mm/set_memory.c
@@ -14,6 +14,20 @@
  */
 static DEFINE_SPINLOCK(cpa_lock);
 
+static inline void arch_lock(void)
+{
+#ifdef CONFIG_X86
+	spin_lock(&pgd_lock);
+#endif
+}
+
+static inline void arch_unlock(void)
+{
+#ifdef CONFIG_X86
+	spin_unlock(&pgd_lock);
+#endif
+}
+
 unsigned long cpa_addr(struct cpa_data *cpa, unsigned long idx)
 {
 	if (cpa->flags & CPA_PAGES_ARRAY) {
@@ -170,7 +184,7 @@ static int cpa_handle_large_page(struct cpa_data *cpa, pte_t *kpte,
 	if (!sd.ptdesc)
 		return -ENOMEM;
 
-	spin_lock(&pgd_lock);
+	arch_lock();
 
 	/*
 	 * Check for races, another CPU might have split this page
@@ -202,11 +216,11 @@ static int cpa_handle_large_page(struct cpa_data *cpa, pte_t *kpte,
 	if (ret)
 		goto out_free_ptdesc;
 
-	spin_unlock(&pgd_lock);
+	arch_unlock();
 	return do_split;
 
 out_free_ptdesc:
-	spin_unlock(&pgd_lock);
+	arch_unlock();
 	pagetable_free(sd.ptdesc);
 	return ret;
 }

-- 
2.53.0

