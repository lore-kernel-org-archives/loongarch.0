Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28889440
	for <loongarch@lists.linux.dev>; Thu,  3 Aug 2023 08:06:09 +0000 (UTC)
X-UUID: 31d6717c58ef4209b175782d51f77270-20230803
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:6068e0c5-4592-4c2a-864d-cdc44bfed288,IP:25,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:10
X-CID-INFO: VERSION:1.1.28,REQID:6068e0c5-4592-4c2a-864d-cdc44bfed288,IP:25,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-META: VersionHash:176cd25,CLOUDID:2f581ab4-a467-4aa9-9e04-f584452e3794,B
	ulkID:230802231252IHNI1SQW,BulkQuantity:1,Recheck:0,SF:19|44|24|17|102,TC:
	nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,
	TF_CID_SPAM_ULS
X-UUID: 31d6717c58ef4209b175782d51f77270-20230803
Received: from ubuntu [(39.156.73.12)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 166434915; Thu, 03 Aug 2023 16:05:58 +0800
From: Enze Li <lienze@kylinos.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,  loongarch@lists.linux.dev,  glider@google.com,
  elver@google.com,  akpm@linux-foundation.org,
  kasan-dev@googlegroups.com,  linux-mm@kvack.org,  zhangqing@loongson.cn,
  yangtiezhu@loongson.cn,  dvyukov@google.com
Subject: Re: [PATCH 0/4 v3] Add KFENCE support for LoongArch
In-Reply-To: <CAAhV-H6FqreZtuOXYayhu=bLZeij+fxygbK5Mpw_kVuPTvdbWw@mail.gmail.com>
	(Huacai Chen's message of "Wed, 2 Aug 2023 23:12:23 +0800")
References: <20230801025815.2436293-1-lienze@kylinos.cn>
	<CAAhV-H6FqreZtuOXYayhu=bLZeij+fxygbK5Mpw_kVuPTvdbWw@mail.gmail.com>
Date: Thu, 03 Aug 2023 16:05:45 +0800
Message-ID: <87a5v83606.fsf@kylinos.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02 2023 at 11:12:23 PM +0800, Huacai Chen wrote:

> Hi, Enze,
>
> I applied this series (with some small modifications) together with KASAN=
 at:
> https://github.com/chenhuacai/linux/commits/loongarch-next
>
> Please confirm everything works well for you.

Hi Huacai,

Thanks for your patience these days.

I've tested this on both a physical machine and a qemu VM.  It works
well.

BTW, if there're any modifications, bugs or improvments to KFENCE on
LoongArch in the future, feel free to Cc me.  I'll appreciate it. :)

Best Regards,
Enze

>
> Huacai
>
> On Tue, Aug 1, 2023 at 10:59=E2=80=AFAM Enze Li <lienze@kylinos.cn> wrote:
>>
>> Hi all,
>>
>> This patchset adds KFENCE support on LoongArch.
>>
>> To run the testcases, you will need to enable the following options,
>>
>> -> Kernel hacking
>>    [*] Tracers
>>        [*] Support for tracing block IO actions (NEW)
>>    -> Kernel Testing and Coverage
>>       <*> KUnit - Enable support for unit tests
>>
>> and then,
>>
>> -> Kernel hacking
>>    -> Memory Debugging
>>       [*] KFENCE: low-overhead sampling-based memory safety error detect=
or (NEW)
>>           <*> KFENCE integration test suite (NEW)
>>
>> With these options enabled, KFENCE will be tested during kernel startup.
>> And normally, you might get the following feedback,
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> [   35.326363 ] # kfence: pass:23 fail:0 skip:2 total:25
>> [   35.326486 ] # Totals: pass:23 fail:0 skip:2 total:25
>> [   35.326621 ] ok 1 kfence
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>>
>> you might notice that 2 testcases have been skipped.  If you tend to run
>> all testcases, please enable CONFIG_INIT_ON_FREE_DEFAULT_ON, you can
>> find it here,
>>
>> -> Security options
>>    -> Kernel hardening options
>>       -> Memory initialization
>>          [*] Enable heap memory zeroing on free by default
>>
>> and you might get all testcases passed.
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> [   35.531860 ] # kfence: pass:25 fail:0 skip:0 total:25
>> [   35.531999 ] # Totals: pass:25 fail:0 skip:0 total:25
>> [   35.532135 ] ok 1 kfence
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>>
>> v3:
>>    * Address Huacai's comments.
>>    * Fix a bug that Jackie Liu pointed out.
>>    * Rewrite arch_stack_walk() with the suggestion of Jinyang He.
>>
>> v2:
>>    * Address Huacai's comments.
>>    * Fix typos in commit message.
>>
>> Thanks,
>> Enze
>>
>> Enze Li (4):
>>   KFENCE: Defer the assignment of the local variable addr
>>   LoongArch: mm: Add page table mapped mode support
>>   LoongArch: Get stack without NMI when providing regs parameter
>>   LoongArch: Add KFENCE support
>>
>>  arch/loongarch/Kconfig               |  1 +
>>  arch/loongarch/include/asm/kfence.h  | 66 ++++++++++++++++++++++++++++
>>  arch/loongarch/include/asm/page.h    |  8 +++-
>>  arch/loongarch/include/asm/pgtable.h | 16 ++++++-
>>  arch/loongarch/kernel/stacktrace.c   | 18 ++++----
>>  arch/loongarch/mm/fault.c            | 22 ++++++----
>>  arch/loongarch/mm/pgtable.c          |  7 +++
>>  mm/kfence/core.c                     |  5 ++-
>>  8 files changed, 123 insertions(+), 20 deletions(-)
>>  create mode 100644 arch/loongarch/include/asm/kfence.h
>>
>> --
>> 2.34.1
>>
