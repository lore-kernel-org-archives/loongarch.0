Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6C138F
	for <loongarch@lists.linux.dev>; Fri, 21 Jul 2023 02:12:16 +0000 (UTC)
X-UUID: 987d0810b5e2432186d959547283f089-20230721
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:815b0b25-7515-4126-b1ce-6a90ada0293f,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-INFO: VERSION:1.1.28,REQID:815b0b25-7515-4126-b1ce-6a90ada0293f,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:0
X-CID-META: VersionHash:176cd25,CLOUDID:5a34f44c-06c1-468b-847d-5b62d44dbb9b,B
	ulkID:23072110121292XKGXD5,BulkQuantity:0,Recheck:0,SF:24|17|19|44|102,TC:
	nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_ULS,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 987d0810b5e2432186d959547283f089-20230721
X-User: lienze@kylinos.cn
Received: from ubuntu [(39.156.73.12)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 716535529; Fri, 21 Jul 2023 10:12:11 +0800
From: Enze Li <lienze@kylinos.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,  loongarch@lists.linux.dev,  glider@google.com,
  elver@google.com,  akpm@linux-foundation.org,
  kasan-dev@googlegroups.com,  linux-mm@kvack.org,  zhangqing@loongson.cn,
  yangtiezhu@loongson.cn,  dvyukov@google.com
Subject: Re: [PATCH 1/4] LoongArch: mm: Add page table mapped mode support
In-Reply-To: <CAAhV-H5pWmd2owMgH9hiqxoWpeAOKGv_=j2V-urA+D87_uCMyg@mail.gmail.com>
	(Huacai Chen's message of "Wed, 19 Jul 2023 23:29:37 +0800")
References: <20230719082732.2189747-1-lienze@kylinos.cn>
	<20230719082732.2189747-2-lienze@kylinos.cn>
	<CAAhV-H5pWmd2owMgH9hiqxoWpeAOKGv_=j2V-urA+D87_uCMyg@mail.gmail.com>
Date: Fri, 21 Jul 2023 10:12:06 +0800
Message-ID: <87pm4mf1xl.fsf@kylinos.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19 2023 at 11:29:37 PM +0800, Huacai Chen wrote:

> Hi, Enze,
>
> On Wed, Jul 19, 2023 at 4:34=E2=80=AFPM Enze Li <lienze@kylinos.cn> wrote:
>>
>> According to LoongArch documentation online, there are two types of addr=
ess
>> translation modes: direct mapped address translation mode (direct mapped=
 mode)
>> and page table mapped address translation mode (page table mapped mode).
>>
>> Currently, the upstream code only supports DMM (Direct Mapped Mode).
>> This patch adds a function that determines whether PTMM (Page Table
>> Mapped Mode) should be used, and also adds the corresponding handler
>> funcitons for both modes.
>>
>> For more details on the two modes, see [1].
>>
>> [1]
>> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.htm=
l#virtual-address-space-and-address-translation-mode
>>
>> Signed-off-by: Enze Li <lienze@kylinos.cn>
>> ---
>>  arch/loongarch/include/asm/page.h    | 10 ++++++++++
>>  arch/loongarch/include/asm/pgtable.h |  6 ++++++
>>  arch/loongarch/mm/pgtable.c          | 25 +++++++++++++++++++++++++
>>  3 files changed, 41 insertions(+)
>>
>> diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/include/=
asm/page.h
>> index 26e8dccb6619..05919be15801 100644
>> --- a/arch/loongarch/include/asm/page.h
>> +++ b/arch/loongarch/include/asm/page.h
>> @@ -84,7 +84,17 @@ typedef struct { unsigned long pgprot; } pgprot_t;
>>  #define sym_to_pfn(x)          __phys_to_pfn(__pa_symbol(x))
>>
>>  #define virt_to_pfn(kaddr)     PFN_DOWN(PHYSADDR(kaddr))
>> +
>> +#ifdef CONFIG_64BIT
>> +#define virt_to_page(kaddr)                                            \
>> +({                                                                     \
>> +       is_PTMM_addr((unsigned long)kaddr) ?                            \
>> +       PTMM_virt_to_page((unsigned long)kaddr) :                       \
>> +       DMM_virt_to_page((unsigned long)kaddr);                         \
>> +})
> 1, Rename these helpers to
> is_dmw_addr()/dmw_virt_to_page()/tlb_virt_to_page() will be better.
> 2, These helpers are so simple so can be defined as inline function or
> macros in page.h.

Hi Huacai,

Except for tlb_virt_to_page(), the remaining two modifications are easy.

I've run into a lot of problems when trying to make tlb_virt_to_page()
as a macro or inline function.  That's because we need to export this
symbol in order for it to be used by the module that called the
virt_to_page() function, other wise, we got the following errors,

-----------------------------------------------------------------------
  MODPOST Module.symvers
ERROR: modpost: "tlb_virt_to_page" [fs/hfsplus/hfsplus.ko] undefined!
ERROR: modpost: "tlb_virt_to_page" [fs/smb/client/cifs.ko] undefined!
ERROR: modpost: "tlb_virt_to_page" [crypto/gcm.ko] undefined!
ERROR: modpost: "tlb_virt_to_page" [crypto/ccm.ko] undefined!
ERROR: modpost: "tlb_virt_to_page" [crypto/essiv.ko] undefined!
ERROR: modpost: "tlb_virt_to_page" [lib/crypto/libchacha20poly1305.ko] unde=
fined!
ERROR: modpost: "tlb_virt_to_page" [drivers/gpu/drm/ttm/ttm.ko] undefined!
ERROR: modpost: "tlb_virt_to_page" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] u=
ndefined!
ERROR: modpost: "tlb_virt_to_page" [drivers/scsi/iscsi_tcp.ko] undefined!
ERROR: modpost: "tlb_virt_to_page" [drivers/scsi/qla2xxx/qla2xxx.ko] undefi=
ned!
WARNING: modpost: suppressed 44 unresolved symbol warnings because there we=
re too many)
-----------------------------------------------------------------------

It seems to me that wrapping it into a common function might be the only
way to successfully compile or link with this modification.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -360,6 +360,8 @@ static inline void pte_clear(struct mm_struct *mm, unsi=
gned long addr, pte_t *pt
 #define PMD_T_LOG2     (__builtin_ffs(sizeof(pmd_t)) - 1)
 #define PTE_T_LOG2     (__builtin_ffs(sizeof(pte_t)) - 1)
=20
+inline struct page *tlb_virt_to_page(unsigned long kaddr);
+

--- a/arch/loongarch/mm/pgtable.c
+++ b/arch/loongarch/mm/pgtable.c
@@ -9,6 +9,12 @@
 #include <asm/pgtable.h>
 #include <asm/tlbflush.h>
=20
+inline struct page *tlb_virt_to_page(unsigned long kaddr)
+{
+       return pte_page(*virt_to_kpte(kaddr));
+}
+EXPORT_SYMBOL_GPL(tlb_virt_to_page);
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

WDYT?

Best Regards,
Enze

> 3, CONFIG_64BIT can be removed here.
>
> Huacai
>
>> +#else
>>  #define virt_to_page(kaddr)    pfn_to_page(virt_to_pfn(kaddr))
>> +#endif
>>
>>  extern int __virt_addr_valid(volatile void *kaddr);
>>  #define virt_addr_valid(kaddr) __virt_addr_valid((volatile void *)(kadd=
r))
>> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/inclu=
de/asm/pgtable.h
>> index ed6a37bb55b5..0fc074b8bd48 100644
>> --- a/arch/loongarch/include/asm/pgtable.h
>> +++ b/arch/loongarch/include/asm/pgtable.h
>> @@ -360,6 +360,12 @@ static inline void pte_clear(struct mm_struct *mm, =
unsigned long addr, pte_t *pt
>>  #define PMD_T_LOG2     (__builtin_ffs(sizeof(pmd_t)) - 1)
>>  #define PTE_T_LOG2     (__builtin_ffs(sizeof(pte_t)) - 1)
>>
>> +#ifdef CONFIG_64BIT
>> +struct page *DMM_virt_to_page(unsigned long kaddr);
>> +struct page *PTMM_virt_to_page(unsigned long kaddr);
>> +bool is_PTMM_addr(unsigned long kaddr);
>> +#endif
>> +
>>  extern pgd_t swapper_pg_dir[];
>>  extern pgd_t invalid_pg_dir[];
>>
>> diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
>> index 36a6dc0148ae..4c6448f996b6 100644
>> --- a/arch/loongarch/mm/pgtable.c
>> +++ b/arch/loongarch/mm/pgtable.c
>> @@ -9,6 +9,31 @@
>>  #include <asm/pgtable.h>
>>  #include <asm/tlbflush.h>
>>
>> +#ifdef CONFIG_64BIT
>> +/* DMM stands for Direct Mapped Mode. */
>> +struct page *DMM_virt_to_page(unsigned long kaddr)
>> +{
>> +       return pfn_to_page(virt_to_pfn(kaddr));
>> +}
>> +EXPORT_SYMBOL_GPL(DMM_virt_to_page);
>> +
>> +/* PTMM stands for Page Table Mapped Mode. */
>> +struct page *PTMM_virt_to_page(unsigned long kaddr)
>> +{
>> +       return pte_page(*virt_to_kpte(kaddr));
>> +}
>> +EXPORT_SYMBOL_GPL(PTMM_virt_to_page);
>> +
>> +bool is_PTMM_addr(unsigned long kaddr)
>> +{
>> +       if (unlikely((kaddr & GENMASK(BITS_PER_LONG - 1, cpu_vabits)) =
=3D=3D
>> +                    GENMASK(BITS_PER_LONG - 1, cpu_vabits)))
>> +               return true;
>> +       return false;
>> +}
>> +EXPORT_SYMBOL_GPL(is_PTMM_addr);
>> +#endif
>> +
>>  pgd_t *pgd_alloc(struct mm_struct *mm)
>>  {
>>         pgd_t *ret, *init;
>> --
>> 2.34.1
>>
>>
