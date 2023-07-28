Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F06AD5C
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 06:57:26 +0000 (UTC)
X-UUID: eefb8ffe66a04e8aa2bbd4540826a9fd-20230728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:a4fd5e3c-7353-42fa-8118-c344962bb5e6,IP:25,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:10
X-CID-INFO: VERSION:1.1.28,REQID:a4fd5e3c-7353-42fa-8118-c344962bb5e6,IP:25,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-META: VersionHash:176cd25,CLOUDID:fe548d42-d291-4e62-b539-43d7d78362ba,B
	ulkID:230728145721DEQA46GY,BulkQuantity:0,Recheck:0,SF:24|17|19|44|102,TC:
	nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: eefb8ffe66a04e8aa2bbd4540826a9fd-20230728
Received: from ubuntu [(39.156.73.12)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1316808868; Fri, 28 Jul 2023 14:57:20 +0800
From: Enze Li <lienze@kylinos.cn>
To: Jinyang He <hejinyang@loongson.cn>
Cc: chenhuacai@kernel.org,  kernel@xen0n.name,  loongarch@lists.linux.dev,
  glider@google.com,  elver@google.com,  akpm@linux-foundation.org,
  kasan-dev@googlegroups.com,  linux-mm@kvack.org,  yangtiezhu@loongson.cn,
  dvyukov@google.com
Subject: Re: [PATCH 2/4 v2] LoongArch: Get stack without NMI when providing
 regs parameter
In-Reply-To: <e325ac53-ba3f-db7a-ccc2-5cfadf6462b9@loongson.cn> (Jinyang He's
	message of "Wed, 26 Jul 2023 10:59:06 +0800")
References: <20230725061451.1231480-1-lienze@kylinos.cn>
	<20230725061451.1231480-3-lienze@kylinos.cn>
	<e325ac53-ba3f-db7a-ccc2-5cfadf6462b9@loongson.cn>
Date: Fri, 28 Jul 2023 14:57:11 +0800
Message-ID: <87o7jwa5h4.fsf@kylinos.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26 2023 at 10:59:06 AM +0800, Jinyang He wrote:

> On 2023-07-25 14:14, Enze Li wrote:
>
>> Currently, arch_stack_walk() can only get the full stack information
>> including NMI.  This is because the implementation of arch_stack_walk()
>> is forced to ignore the information passed by the regs parameter and use
>> the current stack information instead.
>>
>> For some detection systems like KFENCE, only partial stack information
>> is needed.  In particular, the stack frame where the interrupt occurred.
>>
>> To support KFENCE, this patch modifies the implementation of the
>> arch_stack_walk() function so that if this function is called with the
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
>>   arch/loongarch/kernel/stacktrace.c | 20 ++++++++++++++------
>>   1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/loongarch/kernel/stacktrace.c b/arch/loongarch/kernel/=
stacktrace.c
>> index 2463d2fea21f..9dab30ae68ec 100644
>> --- a/arch/loongarch/kernel/stacktrace.c
>> +++ b/arch/loongarch/kernel/stacktrace.c
>> @@ -18,16 +18,24 @@ void arch_stack_walk(stack_trace_consume_fn consume_=
entry, void *cookie,
>>   	struct pt_regs dummyregs;
>>   	struct unwind_state state;
>>   -	regs =3D &dummyregs;
>> -
>>   	if (task =3D=3D current) {
>> -		regs->regs[3] =3D (unsigned long)__builtin_frame_address(0);
>> -		regs->csr_era =3D (unsigned long)__builtin_return_address(0);
>> +		if (regs)
>> +			memcpy(&dummyregs, regs, sizeof(*regs));
>> +		else {
>> +			dummyregs.regs[3] =3D (unsigned long)__builtin_frame_address(0);
>> +			dummyregs.csr_era =3D (unsigned long)__builtin_return_address(0);
>> +		}
>>   	} else {
>> -		regs->regs[3] =3D thread_saved_fp(task);
>> -		regs->csr_era =3D thread_saved_ra(task);
>> +		if (regs)
>> +			memcpy(&dummyregs, regs, sizeof(*regs));
>> +		else {
>> +			dummyregs.regs[3] =3D thread_saved_fp(task);
>> +			dummyregs.csr_era =3D thread_saved_ra(task);
>> +		}
>>   	}
>>   +	regs =3D &dummyregs;
>> +

Hi Jinyang,

>
> if (!regs) {
> =C2=A0=C2=A0=C2=A0 regs =3D &dummyregs;
>
> =C2=A0=C2=A0=C2=A0 if (task =3D=3D current) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 regs->regs[3] =3D (unsigned long)__=
builtin_frame_address(0);
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 regs->csr_era =3D (unsigned long)__=
builtin_return_address(0);
> =C2=A0=C2=A0=C2=A0 } else {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 regs->regs[3] =3D thread_saved_fp(t=
ask);
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 regs->csr_era =3D thread_saved_ra(t=
ask);
> =C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 regs->regs[1] =3D 0;
> }

Excellent!  FWIW, it looks easy to understand.
I've tested this patch, and it works well.  Thank you.

Cheers!
Enze

>
> BTW, I remembered that __unwind_start() deals with this issue in regs,
> task and current. arch_stack_walk() is unnecessary to provide current
> or task regs if we fix the unwind_start() skip its parent frame
> (caller is arch_stack_walk). But the current state is better, I think.
>
>
> Thanks,
>
> Jinyang
>
>>   	regs->regs[1] =3D 0;
>>   	for (unwind_start(&state, task, regs);
>>   	     !unwind_done(&state) && !unwind_error(&state); unwind_next_frame=
(&state)) {
