Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E1D803
	for <loongarch@lists.linux.dev>; Tue,  5 Dec 2023 02:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx77uPkG5l0+8+AA--.835S3;
	Tue, 05 Dec 2023 10:53:03 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxrdyOkG5lBA9VAA--.56516S3;
	Tue, 05 Dec 2023 10:53:02 +0800 (CST)
Subject: Re: [PATCH] LoongArch: BPF: Remove fatal signed-extension
 instructions
To: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev
References: <20231204141938.7230-1-hengqi.chen@gmail.com>
Cc: chenhuacai@kernel.org, kernel@xen0n.name
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <846ccd59-9789-daf1-972d-2a47912f5433@loongson.cn>
Date: Tue, 5 Dec 2023 10:53:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231204141938.7230-1-hengqi.chen@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8BxrdyOkG5lBA9VAA--.56516S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uF4kGFW8Ww4DZr47CFW5CFX_yoW8uFWxpF
	ZIg3yakrWDt39xWw1xZw4Uua40yw1ft3y5GFyrtr13K34UWFn2vrWrtF45AF98ZF4fWFy2
	va1DXw4Sg3WqvagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70Pf
	DUUUU

Hi Hengqi,

On 12/04/2023 10:19 PM, Hengqi Chen wrote:
> As reported on mailing list ([0]), several BPF testcases could
> triggered kernel panics like:
>
>     # ./test_progs -t verifier_map_ptr_mixing

...

>     [   47.872612] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

According to the commit message, the code itself looks good to me,
thanks for your patch.

In my opinion, I think it is better to update the commit message
and split the changes into two separate patches.

> Take the `cls_redirect` case as an example:
>
>     cls_redirect()
>       -> get_global_metrics() returns pcpu ptr 0xfffffefffc00b480
>
> The pointer is later signed-extended to 0xfffffffffc00b480 at
> `BPF_JMP | BPF_EXIT`. During BPF prog run, this triggers unhandled
> page fault and a kernel panic.

The test case that cause panic is "verifier_map_ptr_mixing",
but here the example is another test case "test_cls_redirect",
please take "verifier_map_ptr_mixing" as an example to analysis
to keep it consistent.

>
> The `cgrp_ls_tp_btf` test reveals another kind of kernel panic
> when handling memory load:
>
>     ptr = bpf_cgrp_storage_get(&map_a, task->cgroups->dfl_cgrp, 0,
>     				   BPF_LOCAL_STORAGE_GET_F_CREATE);
>
> The expression `task->cgroups->dfl_cgrp` involves two memory load.
> Since the field offset fits in imm12 or imm14, we use ldd or ldptrd
> to perform memory load. But the ldd and ldptrd instructions both
> have the side effect that it will signed-extended the imm operand.

The initial aim of ldd and ldptrd is to reduce one instruction,
if it has problem, we can use ldxd directly, but ...

> Finally, we got the wrong addresses and result in kernel panics.

... if the test case "cgrp_ls_tp_btf" triggers another panic,
and the cause is another reason related with BPF_DW case,
please submit a separate patch so that we can record the cause
and analysis clearly.

>
> Let's get rid of those fatal signed-extension instrutions to fix
> the issues. For the first case, no arches do a sext on function
> return, the fix should be safe. For the second case, we fallback
> to use a generic ldxd instruction.

Thanks,
Tiezhu

