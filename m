Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2C8363
	for <loongarch@lists.linux.dev>; Fri, 21 Jul 2023 01:54:51 +0000 (UTC)
X-UUID: 44fc00ce998c430ca28cc240fb33ea67-20230721
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:b0624744-c03f-4a97-b859-c2f46250c0d1,IP:15,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-INFO: VERSION:1.1.28,REQID:b0624744-c03f-4a97-b859-c2f46250c0d1,IP:15,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-5
X-CID-META: VersionHash:176cd25,CLOUDID:ac43e88e-7caa-48c2-8dbb-206f0389473c,B
	ulkID:230721094930VGG5JF1A,BulkQuantity:0,Recheck:0,SF:19|44|24|17|102,TC:
	nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-UUID: 44fc00ce998c430ca28cc240fb33ea67-20230721
X-User: lienze@kylinos.cn
Received: from ubuntu [(39.156.73.12)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1944297572; Fri, 21 Jul 2023 09:49:29 +0800
From: Enze Li <lienze@kylinos.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,  loongarch@lists.linux.dev,  glider@google.com,
  elver@google.com,  akpm@linux-foundation.org,
  kasan-dev@googlegroups.com,  linux-mm@kvack.org,  zhangqing@loongson.cn,
  yangtiezhu@loongson.cn,  dvyukov@google.com
Subject: Re: [PATCH 2/4] LoongArch: Get stack without NMI when providing
 regs parameter
In-Reply-To: <CAAhV-H5y2cbbzrWtPKPZtP-DwzAq+g=PvEExD=rru1PkQg37dA@mail.gmail.com>
	(Huacai Chen's message of "Wed, 19 Jul 2023 23:17:14 +0800")
References: <20230719082732.2189747-1-lienze@kylinos.cn>
	<20230719082732.2189747-3-lienze@kylinos.cn>
	<CAAhV-H5y2cbbzrWtPKPZtP-DwzAq+g=PvEExD=rru1PkQg37dA@mail.gmail.com>
Date: Fri, 21 Jul 2023 09:49:20 +0800
Message-ID: <87tttyf2zj.fsf@kylinos.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Huacai,

Thanks for your review.

On Wed, Jul 19 2023 at 11:17:14 PM +0800, Huacai Chen wrote:

> Hi, Enze,
>
> On Wed, Jul 19, 2023 at 4:34=E2=80=AFPM Enze Li <lienze@kylinos.cn> wrote:
>>
>> Currently, executing arch_stack_walk can only get the full stack
>> information including NMI.  This is because the implementation
>> of arch_stack_walk is forced to ignore the information passed by the
>> regs parameter and use the current stack information instead.
>>
>> For some detection systems like KFENCE, only partial stack information
>> is needed.  In particular, the stack frame where the interrupt occurred.
>>
>> To support KFENCE, this patch modifies the implementation of the
>> arch_stack_walk function so that if this function is called with the
>> regs argument passed, it retains all the stack information in regs and
>> uses it to provide accurate information.
>>
>> Before the patch applied, I get,
>> [    1.531195 ] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [    1.531442 ] BUG: KFENCE: out-of-bounds read in stack_trace_save_regs=
+0x48/0x6c
>> [    1.531442 ]
>> [    1.531900 ] Out-of-bounds read at 0xffff800012267fff (1B left of kfe=
nce-#12):
>> [    1.532046 ]  stack_trace_save_regs+0x48/0x6c
>> [    1.532169 ]  kfence_report_error+0xa4/0x528
>> [    1.532276 ]  kfence_handle_page_fault+0x124/0x270
>> [    1.532388 ]  no_context+0x50/0x94
>> [    1.532453 ]  do_page_fault+0x1a8/0x36c
>> [    1.532524 ]  tlb_do_page_fault_0+0x118/0x1b4
>> [    1.532623 ]  test_out_of_bounds_read+0xa0/0x1d8
>> [    1.532745 ]  kunit_generic_run_threadfn_adapter+0x1c/0x28
>> [    1.532854 ]  kthread+0x124/0x130
>> [    1.532922 ]  ret_from_kernel_thread+0xc/0xa4
>> <snip>
>>
>> With this patch applied, I get the correct stack information.
>> [    1.320220 ] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [    1.320401 ] BUG: KFENCE: out-of-bounds read in test_out_of_bounds_re=
ad+0xa8/0x1d8
>> [    1.320401 ]
>> [    1.320898 ] Out-of-bounds read at 0xffff800012257fff (1B left of kfe=
nce-#10):
>> [    1.321134 ]  test_out_of_bounds_read+0xa8/0x1d8
>> [    1.321264 ]  kunit_generic_run_threadfn_adapter+0x1c/0x28
>> [    1.321392 ]  kthread+0x124/0x130
>> [    1.321459 ]  ret_from_kernel_thread+0xc/0xa4
>> <snip>
>>
>> Signed-off-by: Enze Li <lienze@kylinos.cn>
>> ---
>>  arch/loongarch/kernel/stacktrace.c | 16 ++++++++++------
>>  1 file changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/loongarch/kernel/stacktrace.c b/arch/loongarch/kernel/=
stacktrace.c
>> index 2463d2fea21f..21f60811e26f 100644
>> --- a/arch/loongarch/kernel/stacktrace.c
>> +++ b/arch/loongarch/kernel/stacktrace.c
>> @@ -18,16 +18,20 @@ void arch_stack_walk(stack_trace_consume_fn consume_=
entry, void *cookie,
>>         struct pt_regs dummyregs;
>>         struct unwind_state state;
>>
>> -       regs =3D &dummyregs;
>> -
>>         if (task =3D=3D current) {
>> -               regs->regs[3] =3D (unsigned long)__builtin_frame_address=
(0);
>> -               regs->csr_era =3D (unsigned long)__builtin_return_addres=
s(0);
>> +               if (regs)
>> +                       memcpy(&dummyregs, regs, sizeof(*regs));
>> +               else {
>> +                       dummyregs.regs[3] =3D (unsigned long)__builtin_f=
rame_address(0);
>> +                       dummyregs.csr_era =3D (unsigned long)__builtin_r=
eturn_address(0);
>> +               }
>>         } else {
> When "task !=3D current", we don't need to handle the "regs !=3D NULL" ca=
se?
>
> Huacai
>

So far, I have not encountered this situation.  I'm not sure what
problems would arise from extending the modifications with "task !=3D
current".

However, these modifications now are sufficient for the KFENCE
system.  I would suggest that we don't modify other parts until we
encounter problems.  This way, we can forge ahead steadily.

Best Regards,
Enze

>> -               regs->regs[3] =3D thread_saved_fp(task);
>> -               regs->csr_era =3D thread_saved_ra(task);
>> +               dummyregs.regs[3] =3D thread_saved_fp(task);
>> +               dummyregs.csr_era =3D thread_saved_ra(task);
>>         }
>>
>> +       regs =3D &dummyregs;
>> +
>>         regs->regs[1] =3D 0;
>>         for (unwind_start(&state, task, regs);
>>              !unwind_done(&state) && !unwind_error(&state); unwind_next_=
frame(&state)) {
>> --
>> 2.34.1
>>
>>
