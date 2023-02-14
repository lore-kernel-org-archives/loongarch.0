Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5487C
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 10:03:39 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id C66FFD05FD
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 09:55:59 +0000 (UTC)
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id AB0771BF20A;
	Tue, 14 Feb 2023 09:55:43 +0000 (UTC)
Message-ID: <0bf59207-838b-2a0b-a95e-925a6bbf1913@ghiti.fr>
Date: Tue, 14 Feb 2023 10:55:43 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: API for setting multiple PTEs at once
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>, linux-arch@vger.kernel.org
Cc: Yin Fengwei <fengwei.yin@intel.com>, linux-mm@kvack.org,
 linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org
References: <Y9wnr8SGfGGbi/bk@casper.infradead.org>
 <Y+K0O35jNNzxiXE6@casper.infradead.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <Y+K0O35jNNzxiXE6@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Matthew,

On 2/7/23 21:27, Matthew Wilcox wrote:
> On Thu, Feb 02, 2023 at 09:14:23PM +0000, Matthew Wilcox wrote:
>> For those of you not subscribed, linux-mm is currently discussing
>> how best to handle page faults on large folios.  I simply made it work
>> when adding large folio support.  Now Yin Fengwei is working on
>> making it fast.
> OK, here's an actual implementation:
>
> https://lore.kernel.org/linux-mm/20230207194937.122543-3-willy@infradead.org/
>
> It survives a run of xfstests.  If your architecture doesn't store its
> PFNs at PAGE_SHIFT, you're going to want to implement your own set_ptes(),
> or you'll see entirely the wrong pages mapped into userspace.  You may
> also wish to implement set_ptes() if it can be done more efficiently
> than __pte(pteval(pte) + PAGE_SIZE).
>
> Architectures that implement things like flush_icache_page() and
> update_mmu_cache() may want to propose batched versions of those.
> That's alpha, csky, m68k, mips, nios2, parisc, sh,
> arm, loongarch, openrisc, powerpc, riscv, sparc and xtensa.
> Maintainers BCC'd, mailing lists CC'd.
>
> I'm happy to collect implementations and submit them as part of a v6.


Please find below the riscv implementation for set_ptes:

diff --git a/arch/riscv/include/asm/pgtable.h 
b/arch/riscv/include/asm/pgtable.h
index ebee56d47003..10bf812776a4 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -463,6 +463,20 @@ static inline void set_pte_at(struct mm_struct *mm,
         __set_pte_at(mm, addr, ptep, pteval);
  }

+#define set_ptes set_ptes
+static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
+                           pte_t *ptep, pte_t pte, unsigned int nr)
+{
+       for (;;) {
+               set_pte_at(mm, addr, ptep, pte);
+               if (--nr == 0)
+                       break;
+               ptep++;
+               addr += PAGE_SIZE;
+               pte = __pte(pte_val(pte) + (1 << _PAGE_PFN_SHIFT));
+       }
+}
+
  static inline void pte_clear(struct mm_struct *mm,
         unsigned long addr, pte_t *ptep)
  {


Thanks,

Alex

