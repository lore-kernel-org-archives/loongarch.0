Received: from out-30.mta1.migadu.com (out-30.mta1.migadu.com [95.215.58.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4E215C0
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 06:07:45 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690265264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9RhR3Z+kw1Y/Wd/w+yq7BdbxI7CNxW0pkaVU5PxwFqo=;
	b=Z1mmOZtv2jbqNze2prcEPMtDaBP+yh6AcU5wgRgGPLE53INartfSH86VP3UTVDg6Sd9/Mv
	9AlKlsmDHJZyemDn2KQjK5RIfe6w7ygPEqi+vSfVhn2nOF5BcFYNaFs1h5KW6yureqQxL1
	UeHKGIvS3VQGsfoNxCHnlyImPxX6HBo=
From: Enze Li <enze.li@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Enze Li <lienze@kylinos.cn>,  kernel@xen0n.name,
  loongarch@lists.linux.dev,  glider@google.com,  elver@google.com,
  akpm@linux-foundation.org,  kasan-dev@googlegroups.com,
  linux-mm@kvack.org,  zhangqing@loongson.cn,  yangtiezhu@loongson.cn,
  dvyukov@google.com
Subject: Re: [PATCH 1/4] LoongArch: mm: Add page table mapped mode support
In-Reply-To: <CAAhV-H7mpjeqnv1MXn--EPDUam6TTcHwqiMsEL4OsmAFS5XNMA@mail.gmail.com>
	(Huacai Chen's message of "Tue, 25 Jul 2023 10:06:01 +0800")
References: <20230719082732.2189747-1-lienze@kylinos.cn>
	<20230719082732.2189747-2-lienze@kylinos.cn>
	<CAAhV-H5pWmd2owMgH9hiqxoWpeAOKGv_=j2V-urA+D87_uCMyg@mail.gmail.com>
	<87pm4mf1xl.fsf@kylinos.cn>
	<CAAhV-H4+8_gBMMdLhx=uEAsCN5wK7kFONsKDyGPqm0kxW8FU=A@mail.gmail.com>
	<87lef7ayha.fsf@kylinos.cn>
	<CAAhV-H7mpjeqnv1MXn--EPDUam6TTcHwqiMsEL4OsmAFS5XNMA@mail.gmail.com>
Date: Tue, 25 Jul 2023 14:07:27 +0800
Message-ID: <87bkg0zfq8.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 25 2023 at 10:06:01 AM +0800, Huacai Chen wrote:

> On Sun, Jul 23, 2023 at 3:17=E2=80=AFPM Enze Li <lienze@kylinos.cn> wrote:
>>
>> On Fri, Jul 21 2023 at 10:21:38 AM +0800, Huacai Chen wrote:
>>
>> > On Fri, Jul 21, 2023 at 10:12=E2=80=AFAM Enze Li <lienze@kylinos.cn> w=
rote:
>> >>
>> >> On Wed, Jul 19 2023 at 11:29:37 PM +0800, Huacai Chen wrote:
>> >>
>> >> > Hi, Enze,
>> >> >
>> >> > On Wed, Jul 19, 2023 at 4:34=E2=80=AFPM Enze Li <lienze@kylinos.cn>=
 wrote:

<snip>

>> I've also tried to include mm_types.h in advance, but in this case that
>> doesn't work because the _LINUX_MM_TYPES_H macro already exists.
>> The "forward declaration" was also taken into account, in the end it was
>> found to be unavailable as well.
>>
>> In summary, I'm afraid that rewriting tlb_virt_to_page in asm/page.h as
>> a macro or inline function is not possible.  The root case of this is
>> that both 'struct mm_struct' and 'virt_to_kpte' belong to high-level
>> data structures, and if they are referenced in asm/page.h at the
>> low-level, dependency problems arise.
>>
>> Anyway, we can at least define it as a normal function in asm/pgtable.h,
>> is that Okay with you?
>>
>> It may be a bit wordy, so please bear with me.  In addition, all of the
>> above is my understanding, am I missing something?
> Well, you can define the helpers in .c files at present, but I have
> another question.
>
> Though other archs (e.g., RISC-V) have no DMW addresses, they still
> have linear area. In other words, both LoongArch and RISC-V have
> linear area and vmalloc-like areas. The only difference is LoongArch's
> linear area is DMW-mapped but RISC-V's linear area is TLB-mapped.
>
> For linear area, the translation is pfn_to_page(virt_to_pfn(kaddr)),
> no matter LoongArch or RISC-V;
> For vmalloc-like areas, the translation is
> pte_page(*virt_to_kpte(kaddr)), no matter LoongArch or RISC-V.
>

Hi Huacai,

Thanks for your reply.

> My question is: why RISC-V only care about the linear area for
> virt_to_page(), but you are caring about the vmalloc-like areas?

This patch is a preparation to make LoongArch support KFENCE.

One of the core principles of KFENCE is that pages are tagged in the PTE
and then synchronized to the TLB.  When the MMU detects an improper
access, it can generate an interrupt signal, which is subsequently
handled by a handler function (kfence_handle_page_fault) provided by
KFENCE.  In short, KFENCE requires the support of the TLB.

There's no need to take this into account on RISC-V because TLB mapping
is already supported in linear area.

Best Regards,
Enze

>
> Huacai

<snip>
