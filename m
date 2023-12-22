Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3481C1773E
	for <loongarch@lists.linux.dev>; Fri, 22 Dec 2023 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxhfCjdYVl69QDAA--.19419S3;
	Fri, 22 Dec 2023 19:40:20 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxneSidYVlj4kFAA--.27786S3;
	Fri, 22 Dec 2023 19:40:19 +0800 (CST)
Subject: Re: [PATCH] LoongArch: BPF: Prevent out-of-bounds memory access
To: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev
References: <20231211151105.7473-1-hengqi.chen@gmail.com>
Cc: chenhuacai@kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <f2c31a82-34bc-3693-a364-b6c3b85762cb@loongson.cn>
Date: Fri, 22 Dec 2023 19:40:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231211151105.7473-1-hengqi.chen@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8BxneSidYVlj4kFAA--.27786S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7JrWfCr48uw47KFW3tF43Jwc_yoW8Jryrpa
	45Wa1vkFZ8XF4xZF1vv39ruryUKFZ3Ca4fJw4rG345Cw15Zrn8WrZ29a9xWFnrJayFgryf
	ZayFgryxt3WUGacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1QV
	y3UUUUU==

Hi Hengqi,

Thanks for the patch, sorry for the late reply.

On 12/11/2023 11:11 PM, Hengqi Chen wrote:
> The test_tag test triggers an unhandled page fault:
>
>   # ./test_tag
>   [  130.640218] CPU 0 Unable to handle kernel paging request at virtual address ffff80001b898004, era == 9000000003137f7c, ra == 9000000003139e70

I can reproduce it with gcc 13 and binutils 2.40 on Fedora 38,
but can not reproduce it with gcc 14 and binutils 2.41, maybe
it is related with compiler, I am not quite sure.

> So, let's access next instruction only under `dst = imm64` context.
>
> With this fix, we have:
>
>   # ./test_tag
>   test_tag: OK (40945 tests)
>
> Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")

This Fixes tag is wrong, because the code is same with this patch in
commit 5dc615520c4d ("LoongArch: Add BPF JIT support"), the current
code is changed in commit bbfddb904df6 ("LoongArch: BPF: Avoid declare 
variables in switch-case").

So maybe it should be:

Fixes: bbfddb904df6 ("LoongArch: BPF: Avoid declare variables in 
switch-case")

> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>

Anyway, the code itself looks good to me, feel free to add a

Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Thanks,
Tiezhu

