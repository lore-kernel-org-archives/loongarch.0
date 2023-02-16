Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C0B17FF
	for <loongarch@lists.linux.dev>; Thu, 16 Feb 2023 06:59:17 +0000 (UTC)
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8Ax69lC1O1jZDoBAA--.2972S3;
	Thu, 16 Feb 2023 14:59:15 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxg+U81O1jR140AA--.63254S3;
	Thu, 16 Feb 2023 14:59:10 +0800 (CST)
Subject: Re: [PATCH v4 2/5] LoongArch: Use la.pcrel instead of la.abs for
 exception handlers
To: Youling Tang <tangyouling@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Xi Ruoyao <xry111@xry111.site>
Cc: Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
 Jianmin lv <lvjianmin@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>
References: <1676018856-26520-1-git-send-email-tangyouling@loongson.cn>
 <1676018856-26520-3-git-send-email-tangyouling@loongson.cn>
 <CAAhV-H4Bs5n_ek3mq6zwxAgVw0nvER1XUA+WUA8M12eKcYVPDQ@mail.gmail.com>
 <05ef2d91-ab87-b8d9-85fa-6a90a92f8f39@loongson.cn>
 <848e2985-9ba3-c14d-23ac-a7f1c218215f@loongson.cn>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <5adf0fc4-b75c-f7f2-311c-0f5d8f14311b@loongson.cn>
Date: Thu, 16 Feb 2023 14:59:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <848e2985-9ba3-c14d-23ac-a7f1c218215f@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8Cxg+U81O1jR140AA--.63254S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxArWUGF4rJFyxur4UZF4DCFg_yoWrtry5pr
	1fZr4kArWUGr1kJr1Utw1jvryUJw1DG3y7XF18XFy8A3Wjgr10qr18Xr1q9F1Utw4rGr4F
	qF1rJry2vFsrJwUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
	AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
	07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
	YxBIdaVFxhVjvjDU0xZFpf9x07jeSoXUUUUU=

On 2023-02-16 10:32, Youling Tang wrote:

> Hi folks,
>
> On 02/10/2023 05:18 PM, Youling Tang wrote:
>>
>>
>> On 02/10/2023 05:09 PM, Huacai Chen wrote:
>>> Hi, Youling and Ruoyao,
>>>
>>> Thank you very much for implementing the per-node exceptions. But I
>>> want to know if the per-node solution is really worthy for a PIE
>>> kernel. So, could you please test the performance? Maybe we can reduce
>>> the complexity if we give up the per-node solution.
>
> Tested on Loongson-3C5000L-LL machine, using CLFS7.3 system.
>
> - nopernode:
>   Based on the v1 patch method, and remove the else branch process in
>   setup_tlb_handler().
>
> - pernode: Based on the v4 patch method.
>
> - pie: Enable RANDOMIZE_BASE (KASLR).
>
> - nopie: Disable RANDOMIZE_BASE and RELOCATABLE.
>
>
> The UnixBench test results are as follows:
>
> - nopernode-nopie: 3938.7
>
> - pernode-nopie: 4062.2
>
> - nopernode-pie: 4009.7
>
> - pernode-pie: 4028.7
>
> In general, `pernode` is higher than `nopernode`, and `nopie` is higher
> than `pie`. (except that nopernode-pie is higher than nopernode-nopie,
> which is not as expected, which may be caused by the instability of the
> machine).
>
> Everyone is more inclined to use `pernode` or `nopernode` to implement
> in the exception handling process?
>
> Youling.

Hi, Youling,


Thanks for your test results.


I did an informal patch to keep la.abs, which think la.abs as a macro. 
just qemu test.

To test this patch, patch the [PATCH v4 1/5] [PATCH v4 3/5] as prediction.

This following patch just provides a method. I'm busy with other things. 
Hopefully it will help you simplify [PATCH v4 2/5].


Thanks,

Jinyang



diff --git a/arch/loongarch/include/asm/asmmacro.h 
b/arch/loongarch/include/asm/asmmacro.h
index 328bb956f241..6ebad458d662 100644
--- a/arch/loongarch/include/asm/asmmacro.h
+++ b/arch/loongarch/include/asm/asmmacro.h
@@ -667,4 +667,19 @@
      nor    \dst, \src, zero
  .endm

+.macro la.abs reg, sym
+766:
+    nop
+    nop
+    nop
+    nop
+    .pushsection ".laabs", "aw", %progbits
+768:
+    .word 768b-766b
+    parse_r regno, \reg
+    .word regno
+    .dword \sym
+    .popsection
+.endm
+
  #endif /* _ASM_ASMMACRO_H */
diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index d2ac26b5b22b..3b273f05be8c 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -86,6 +86,7 @@ SYM_CODE_START(kernel_entry)            # kernel entry 
point
      PTR_ADD        sp, sp, tp
      set_saved_sp    sp, t0, t1

+    bl        relocate_laabs
      bl        start_kernel
      ASM_BUG()

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 4344502c0b31..9f8833a2524a 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -582,3 +582,30 @@ void __init setup_arch(char **cmdline_p)

      paging_init();
  }
+
+void __init relocate_laabs(void)
+{
+    extern void *__laabs_begin;
+    extern void *__laabs_end;
+    struct laabs {
+        int offset;
+        int reg;
+        long symvalue;
+    } *p;
+
+    for (p = (void *)&__laabs_begin; (void *)p < (void *)&__laabs_end; p++)
+    {
+        int lu12iw, ori, lu32id, lu52id;
+        long v = p->symvalue;
+        int reg = p->reg;
+        int *insn = (void *)p - p->offset;
+        lu12iw = 0x14000000 | reg | (((v & 0xfffff000) >> 12) << 5);
+        ori = 0x03800000 | reg | (reg<<5) | ((v & 0xfff) << 10);
+        lu32id = 0x16000000 | reg | (((v & 0x000fffff00000000) >> 32) 
<< 5);
+        lu52id = 0x03000000 | reg | (reg<<5) | (((v >> 52) & 0xfff) << 10);
+        insn[0] = lu12iw;
+        insn[1] = ori;
+        insn[2] = lu32id;
+        insn[3] = lu52id;
+    }
+}
diff --git a/arch/loongarch/kernel/vmlinux.lds.S 
b/arch/loongarch/kernel/vmlinux.lds.S
index 733b16e8d55d..4d128e089393 100644
--- a/arch/loongarch/kernel/vmlinux.lds.S
+++ b/arch/loongarch/kernel/vmlinux.lds.S
@@ -66,6 +66,13 @@ SECTIONS
          __alt_instructions_end = .;
      }

+    . = ALIGN(4);
+    .laabs : AT(ADDR(.laabs) - LOAD_OFFSET) {
+        __laabs_begin = .;
+        *(.laabs)
+        __laabs_end = .;
+    }
+
      .got : ALIGN(16) { *(.got) }
      .plt : ALIGN(16) { *(.plt) }
      .got.plt : ALIGN(16) { *(.got.plt) }




