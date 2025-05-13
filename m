Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6965B19CC3C
	for <loongarch@lists.linux.dev>; Tue, 13 May 2025 02:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747102810; cv=none; b=HZT5dPbUB7K27V5lzIUtM4gySh3QaTrEAmMGzpCmff2JSxl9tVc7j6KJmILBc4EbsQD1UbpiFINP77QP3TFQEo9tsggN1ZgYo22xm6HwoBn8urbfdVZLeO72mlxPusLi0JBhGh3R72yqRMgLLPqLfmItOLzcV3x1t1E4sZmK1Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747102810; c=relaxed/simple;
	bh=lqc9ZJSJMpKP1W9NCfJPGfOF/PiVnNHdc6szgzmmluE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ejW1Dm4dlTKr1qqKZox/OqabM/DC6ezCqvQUXajMXybXR3K+SLvP4IV3b51qm4d/WqQjH/R7Lr3WzqmxWdPCx9gKKculoiEV1OFJxG/VwXDlHa3+ZEaGLDy7/M+fxPCy4y5u3QnRgsNNUiuWYEb61jMWZjEp5eI5a9/I4QcBppU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mV18y68T; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mV18y68T"
Date: Tue, 13 May 2025 10:19:48 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747102801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQsFUfbIOkh3KmaYEyRqKaKZ6EkDvY4HPuETL+dpT1E=;
	b=mV18y68TdIWFLdKAXwKgtTyFtokQT+3PfqqwaG9xkAhnx462ok3tXC0+Pmhe2Pl8UExqkK
	HDvHbO7BfeJm7NyZ8iywyp4ci6Vedx42EFXQ4Ke8IoIl0lLFGTlv/c88/EnwNBZeBX2kbD
	qPYf9jZFQceN3rljGxMjKGaMFi9FnoI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: George Guo <dongtai.guo@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, rppt@kernel.org, akpm@linux-foundation.org,
 dave.hansen@linux.intel.com, geert@linux-m68k.org, ptesarik@suse.com,
 guoweikang.kernel@gmail.com, maobibo@loongson.cn,
 loongarch@lists.linux.dev, George Guo <guodongtai@kylinos.cn>
Subject: Re: [PATCH 1/1] LoongArch: mm: remove redundant pte occupancy check
 in __set_fixmap()
Message-ID: <20250513101948.000036d6@linux.dev>
In-Reply-To: <CAAhV-H5eUtV6N=jt9sUyKXLAP2sX2kHA7rEbyKuSL1G-kRiXFg@mail.gmail.com>
References: <20250508030506.7076-1-dongtai.guo@linux.dev>
	<CAAhV-H5eUtV6N=jt9sUyKXLAP2sX2kHA7rEbyKuSL1G-kRiXFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Sat, 10 May 2025 15:34:01 +0800
Huacai Chen <chenhuacai@kernel.org> wrote:

> Hi, George,
> 
> On Thu, May 8, 2025 at 11:05 AM george <dongtai.guo@linux.dev> wrote:
> >
> > From: George Guo <guodongtai@kylinos.cn>
> >
> > This check could falsely report errors when PTEs are remapped:
> > arch/loongarch/mm/init.c:204: bad pte 0000000107b601c3.
> >
> > The check was unnecessary because:
> > - Fixmap slots are designed to be reusable
> > - Other architectures (x86/arm64) allow PTE overwrites
> > - Callers are responsible for proper mapping management
> >
> > Signed-off-by: George Guo <guodongtai@kylinos.cn>
> > ---
> >  arch/loongarch/mm/init.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
> > index 06f11d9e4ec1..7b7e3b1aa00d 100644
> > --- a/arch/loongarch/mm/init.c
> > +++ b/arch/loongarch/mm/init.c
> > @@ -200,10 +200,6 @@ void __init __set_fixmap(enum fixed_addresses
> > idx, BUG_ON(idx <= FIX_HOLE || idx >= __end_of_fixed_addresses);
> >
> >         ptep = populate_kernel_pte(addr);
> > -       if (!pte_none(ptep_get(ptep))) {
> > -               pte_ERROR(*ptep);
> > -               return;
> > -       }
> Resolve what problems? If other patches need this change, please
> submit them as a series.
Here is a test case to show the bug:
#include <linux/module.h>
#include <linux/vmalloc.h>
#include <linux/mm.h>
#include <asm/io.h>
#include <asm-generic/fixmap.h>

#define ALLOC_SIZE 8192  // 8KB

static char *vmalloc_mem = NULL;

static int __init fixmap_test_init(void)
{
	struct page *page;
	phys_addr_t phys;
	void *addr;
	char c;
	void __iomem *base;
	char *charp;

	pr_info("%s module loaded!\n", THIS_MODULE->name);

	addr = vmalloc_mem = vmalloc(ALLOC_SIZE);
	if (!vmalloc_mem) {
		pr_err("Failed to allocate memory with vmalloc\n");
		return -ENOMEM;
	}

	vmalloc_mem[4099] = 'a';
	vmalloc_mem[0] = 'g';
	pr_info("Allocated vmalloc memory at virtual address: %px,
	vmalloc_mem[0]=%c\n", vmalloc_mem, vmalloc_mem[0]);

	//vrit addr -> phys addr
	page = vmalloc_to_page(addr);
	phys = page_to_phys(page) + offset_in_page(addr);
	pr_info("phys = 0x%lx\n", phys);


	__set_fixmap(FIX_TEXT_POKE0, phys & PAGE_MASK, FIXMAP_PAGE_IO);
	base = (void __iomem *)__fix_to_virt(FIX_TEXT_POKE0);
	base += phys & ~PAGE_MASK;
	charp = (char *)base;
	pr_info("fixmap virt addr=0x%lx,charp[0] = %c\n",base,
	charp[0]);
	__set_fixmap(FIX_TEXT_POKE0, 0, FIXMAP_PAGE_CLEAR);

	return 0;
}

static void __exit fixmap_test_exit(void)
{
	if (vmalloc_mem) {
		vfree(vmalloc_mem);
		pr_info("Freed vmalloc memory\n");
	}

	pr_info("%s module unloaded!\n", THIS_MODULE->name);
}

module_init(fixmap_test_init);
module_exit(fixmap_test_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("George Guo <guodongtai@kylinos.cn>");
MODULE_DESCRIPTION("fixmap test");

And below is the log for test:

arm64:

first insmod:
[10476.162720] fixmap_test module loaded!
[10476.163390] Allocated vmalloc memory at virtual address:
ffff80008008f000, vmalloc_mem[0]=g
[10476.164497] phys = 0x10fab2000
[10476.165106] fixmap virt addr=0xffffffffff5fc000,charp[0] = g

rmmod then insmod again:
[10514.031689] Freed vmalloc memory
[10514.032268] fixmap_test module unloaded!
[10516.391483] fixmap_test module loaded!
[10516.392135] Allocated vmalloc memory at virtual address:
ffff800080097000, vmalloc_mem[0]=g
[10516.393205] phys = 0x10dc2c000
[10516.393663] fixmap virt addr=0xffffffffff5fc000,charp[0] = g


loongarch:

first insmod:
[   43.983300] [   T1399] fixmap test module loaded
[   43.983570] [   T1399] Allocated vmalloc memory at virtual address:
ffff80001b45c000, vmalloc_mem[0]=g
[   43.983973] [   T1399] phys = 0x107b60000
[   43.984535] [   T1399] fixmap virt addr=0xfffffffffffd8000,charp[0]
= g

rmmod then insmod again:
[   52.266230] [   T1417] Freed vmalloc memory
[   55.344169] [   T1421] fixmap test module loaded
[   55.344441] [   T1421] Allocated vmalloc memory at virtual address:
ffff80001b344000, vmalloc_mem[0]=g
[   55.344915] [   T1421] phys = 0x10ae04000
[   55.345503] [   T1421] arch/loongarch/mm/init.c:204: bad pte
0000000107b601c3.
[   55.346087] [   T1421] fixmap virt addr=0xfffffffffffd8000,charp[0]
= \x00

> 
> Huacai
> 
> >
> >         if (pgprot_val(flags))
> >                 set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
> > --
> > 2.34.1
> >
> >

