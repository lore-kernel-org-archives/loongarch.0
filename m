Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15CF4422
	for <loongarch@lists.linux.dev>; Fri, 22 Dec 2023 01:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxG+me6YRl8LYDAA--.18841S3;
	Fri, 22 Dec 2023 09:42:55 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxzuSd6YRl19AEAA--.24763S3;
	Fri, 22 Dec 2023 09:42:53 +0800 (CST)
Subject: Re: [PATCH] LoongArch: BPF: Support 64-bit pointers to kfuncs
To: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev
References: <20231215142138.3281-1-hengqi.chen@gmail.com>
Cc: chenhuacai@kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <14161bfc-c561-f93b-a219-a31583a679fc@loongson.cn>
Date: Fri, 22 Dec 2023 09:42:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231215142138.3281-1-hengqi.chen@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8AxzuSd6YRl19AEAA--.24763S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJFWDKrWDGr4rGF4UKr4DGFX_yoW5uFWDpF
	4rtr4qkF4kt34fCFnrt34xZrWqvF4kWr4UGa4Yk3ySkF1DWrs7trW0ka13WF9xJw40v3WF
	y3yIvrW7JryUt3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1QVy3UU
	UUU==

Hi Hengqi,

Thanks for the patch, sorry for the late reply.

On 12/15/2023 10:21 PM, Hengqi Chen wrote:
> Like commit 1cf3bfc60f98 ("bpf: Support 64-bit pointers to kfuncs")
> for s390x, add support for 64-bit pointers to kfuncs for LoongArch.
> Since the infrastructure is already implemented in BPF core, the only
> thing need to be done is to override bpf_jit_supports_far_kfunc_call().
>
> Before this change, several test_verifier tests failed:
>
>   # ./test_verifier | grep # | grep FAIL

[root@linux bpf]# ./test_verifier | grep # | grep FAIL
Usage: grep [OPTION]... PATTERNS [FILE]...
Try 'grep --help' for more information.

It should be:
[root@linux bpf]# ./test_verifier | grep "#" | grep FAIL

>   #119/p calls: invalid kfunc call: ptr_to_mem to struct with non-scalar FAIL
>   #120/p calls: invalid kfunc call: ptr_to_mem to struct with nesting depth > 4 FAIL
>   #121/p calls: invalid kfunc call: ptr_to_mem to struct with FAM FAIL
>   #122/p calls: invalid kfunc call: reg->type != PTR_TO_CTX FAIL
>   #123/p calls: invalid kfunc call: void * not allowed in func proto without mem size arg FAIL
>   #124/p calls: trigger reg2btf_ids[reg->type] for reg->type > __BPF_REG_TYPE_MAX FAIL
>   #125/p calls: invalid kfunc call: reg->off must be zero when passed to release kfunc FAIL
>   #126/p calls: invalid kfunc call: don't match first member type when passed to release kfunc FAIL
>   #127/p calls: invalid kfunc call: PTR_TO_BTF_ID with negative offset FAIL
>   #128/p calls: invalid kfunc call: PTR_TO_BTF_ID with variable offset FAIL
>   #129/p calls: invalid kfunc call: referenced arg needs refcounted PTR_TO_BTF_ID FAIL
>   #130/p calls: valid kfunc call: referenced arg needs refcounted PTR_TO_BTF_ID FAIL
>   #486/p map_kptr: ref: reference state created and released on xchg FAIL
>
> This is because the kfuncs in the loaded module are far away from
> __bpf_call_base:
>
>   ffff800002009440 t bpf_kfunc_call_test_fail1    [bpf_testmod]
>   9000000002e128d8 T __bpf_call_base
>
> The offset relative to __bpf_call_base does NOT fit in s32, which breaks
> the assumption in BPF core. Enable bpf_jit_supports_far_kfunc_call() lifts
> this limit.
>
> With this change, the test_verifier tests now all passed:
>
>   # ./test_verifier
>   ...
>   Summary: 777 PASSED, 0 SKIPPED, 0 FAILED

I met build errors and failed/skipped tests at the beginning, so I spent
some time to analysis the problems. In order to achieve success, it is
necessary to do the following steps:

(1) build with loongson3_defconfig and also set
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
CONFIG_DEBUG_INFO_BTF=y
CONFIG_FTRACE_SYSCALLS=y
CONFIG_BPF_LSM=y

(2) enable bpf jit and enable unprivileged bpf before test
echo 1 > /proc/sys/net/core/bpf_jit_enable
echo 0 > /proc/sys/kernel/unprivileged_bpf_disabled

Otherwise there exist build errors when execute

   make headers && cd tools/testing/selftests/bpf && make -j4

Furthermore, there exist failed test "#507/p sleepable lsm accept FAIL"
and many skipped tests when execute "./test_verifier".

I think it would be best to add the above info in the commit message so
that the users know how to test and how to solve or avoid the failures.

>
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>

Feel free to add a

Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Thanks,
Tiezhu

