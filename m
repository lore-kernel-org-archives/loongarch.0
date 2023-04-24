Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756017C
	for <loongarch@lists.linux.dev>; Mon, 24 Apr 2023 01:19:15 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxPNoK2UVkGWMhAA--.40765S3;
	Mon, 24 Apr 2023 09:19:06 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxoOQJ2UVkbeg3AA--.10000S3;
	Mon, 24 Apr 2023 09:19:06 +0800 (CST)
Subject: Re: [PATCH v3 4/6] LoongArch: Add uprobes support
To: Huacai Chen <chenhuacai@kernel.org>
References: <1681898221-27828-1-git-send-email-yangtiezhu@loongson.cn>
 <1681898221-27828-5-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H7Z_Y+XC-yMGRA1zq9FBU-tAVK+8+Jd4t5x4L4DFXAPJA@mail.gmail.com>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <993a2d7e-d7a2-3017-5a81-517ef6f85049@loongson.cn>
Date: Mon, 24 Apr 2023 09:19:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7Z_Y+XC-yMGRA1zq9FBU-tAVK+8+Jd4t5x4L4DFXAPJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxoOQJ2UVkbeg3AA--.10000S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ZF4rJFykAr1kWw4UZrW5KFg_yoW8Jw13pa
	15Aay2qrsxJ3y8Cr18X390vryaq3yktr4DWr4DXrWrG3y7Xwn8GF92gryayFyjvrnYgay0
	93Wj9FZ3ZFZxAFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8r9N3UUUUU==



On 04/23/2023 09:12 PM, Huacai Chen wrote:
> Hi, Tiezhu,
>
> On Wed, Apr 19, 2023 at 5:57 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> Uprobes is the user-space counterpart to kprobes, this commit
>> adds uprobes support for LoongArch.

...

>> +#define MAX_UINSN_BYTES                8
>> +#define UPROBE_XOL_SLOT_BYTES  MAX_UINSN_BYTES
> In old versions we define UPROBE_XOL_SLOT_BYTES to 128, why we use 8 now?

I assume "the old version" maybe comes from mips, I am not quite sure 
the backgrounds. For LoongArch, there are 2 xol slots to save 2 
instructions, each of them is 32 bit, 2*32bit=8bytes, so 
UPROBE_XOL_SLOT_BYTES can be 8.

>> +
>> +#define UPROBE_XOLBP_INSN      larch_insn_gen_break(BRK_UPROBE_XOLBP)
>> +#define UPROBE_SWBP_INSN       larch_insn_gen_break(BRK_UPROBE_BP)
>> +#define UPROBE_SWBP_INSN_SIZE  LOONGARCH_INSN_SIZE

...

>>         case BRK_UPROBE_XOLBP:
>> -               if (notify_die(DIE_UPROBE_XOL, "Uprobe_XOL", regs, bcode,
>> -                              current->thread.trap_nr, SIGTRAP) == NOTIFY_STOP)
>> +               if (uprobe_singlestep_handler(regs))
> As I know, XOL means "execute out of line", is it an alias of "single step"?

I think so, the instruction filled in xol slots is to single step, 
arm64, riscv, csky also uses "single step" for the related code, 
powerpc, s390 uses "DIE_SSTEP".

Thanks,
Tiezhu

