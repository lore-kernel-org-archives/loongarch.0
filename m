Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F6853B7
	for <loongarch@lists.linux.dev>; Wed,  9 Aug 2023 09:55:37 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dxl+iXYtNk+LcTAA--.7041S3;
	Wed, 09 Aug 2023 17:55:35 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxxsyWYtNkRRZRAA--.49183S3;
	Wed, 09 Aug 2023 17:55:35 +0800 (CST)
Subject: Re: [PATCH v1 0/6] Add objtool and orc support for LoongArch
To: Peter Zijlstra <peterz@infradead.org>
References: <1690272910-11869-1-git-send-email-yangtiezhu@loongson.cn>
 <20230725120110.GF3765278@hirez.programming.kicks-ass.net>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <33274746-a943-947b-55b0-5ba449ebc769@loongson.cn>
Date: Wed, 9 Aug 2023 17:55:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230725120110.GF3765278@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8BxxsyWYtNkRRZRAA--.49183S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr4xGr43GrWrZr45KFW5CFX_yoW8KrWUpF
	y7GFZxKr4rXFWxA3Z7J3W2q3y3XryYyFW7ta98JryrCr45ZF9Yg3yfKa12v3W5Wr43XFyF
	y3y8WasrKa1qyagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-
	e5UUUUU==



On 07/25/2023 08:01 PM, Peter Zijlstra wrote:
> On Tue, Jul 25, 2023 at 04:15:04PM +0800, Tiezhu Yang wrote:
>
>> To be honest, there still exist some objtool warnings, I will try my best
>> to fix them in the later versions or the other separate patches.
>
> Please give us some examples of what's still going wrong. Are you
> running into jump-tables? IIRC I've not seen code for those yet.
>

Sorry for the late reply, I did more analysis and test recently.
I have already addressed most of the objtool warnings, discussed
offline with compiler engineers, sent separate patch to maillist
or modified the related code locally.

For example,
arch/loongarch/mm/fault.o: warning: objtool: no_context.part.0() falls 
through to next function do_sigsegv()
[PATCH] LoongArch: Remove noreturn attribute for die()
https://lore.kernel.org/loongarch/1690871581-23944-1-git-send-email-yangtiezhu@loongson.cn/

Additionally, when I update the latest upstream gcc and binutils,
it generates more objtool warnings, like this:
init/version.o: warning: objtool: early_hostname+0x20: sibling call from 
callable instruction with modified stack frame

[fedora@linux 6.5.test]$ gcc --version
gcc (GCC) 14.0.0 20230803 (experimental)
[fedora@linux 6.5.test]$ as --version
GNU assembler (GNU Binutils) 2.41.50.20230803
[fedora@linux 6.5.test]$ objdump -M no-aliases -D init/version.o
0000000000000000 <early_hostname>:
    0:   00150085        or              $a1, $a0, $zero
    4:   1a000004        pcalau12i       $a0, 0
    8:   02ffc063        addi.d          $sp, $sp, -16
    c:   02810406        addi.w          $a2, $zero, 65
   10:   02c00084        addi.d          $a0, $a0, 0
   14:   29c02061        st.d            $ra, $sp, 8
   18:   54000000        bl              0       # 18 <early_hostname+0x18>
   1c:   0281000c        addi.w          $t0, $zero, 64
   20:   6c001584        bgeu            $t0, $a0, 20    # 34 <.L2>
   24:   1a000004        pcalau12i       $a0, 0
   28:   02810005        addi.w          $a1, $zero, 64
   2c:   02c00084        addi.d          $a0, $a0, 0
   30:   54000000        bl              0       # 30 <early_hostname+0x30>

0000000000000034 <.L2>:
   34:   28c02061        ld.d            $ra, $sp, 8
   38:   00150004        or              $a0, $zero, $zero
   3c:   02c04063        addi.d          $sp, $sp, 16
   40:   4c000020        jirl            $zero, $ra, 0

A preliminary analysis shows that the common functions is_sibling_call()
and add_jump_destinations() in tools/objtool/check.c need to be modified
to handle the case "reloc->sym->type == STT_NOTYPE", I will send a patch
in the next week.

Thanks,
Tiezhu

