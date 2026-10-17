Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE423EC826
	for <loongarch@lists.linux.dev>; Sat, 17 Oct 2026 10:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792234708; cv=none; b=Bl4P5Ivkt4hLZW3UkmstCnjuPxWBv3+xVnYMqoV9jhFM4bIOgs0kQkP6H8g9GJ00xYm+dxIc3NjlEJnx+A4ivMRlrj1+TnpUXH8hjWUFPjHn1OGmG4M2w8T+lPM+zmwqDMsX6IoPFnGf43IKffILLVCrsHeMW8slsXyVlNo80Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792234708; c=relaxed/simple;
	bh=i5Nuk1yzuLP1jBUjm1Q0HVfm1BE0asN2mliPT/+MHOg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=U/P4EGeOmyESeoSMkuNfGUoZLlKZl+HINfL09uBlrFFp5Gq0JAZSun+CYFJ282UlDs/ndqZJ3zIXJO+EM/0eMq1qLxI3cECwdx0iMzHUc18T1pTIDrkTOkdYw7G7IpYCw2c0QcrVuoroEdhioTRNzUDXLlRX0VVp5TVG1om3WuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxX9PPVNNqdMgWAA--.779S3;
	Sat, 17 Oct 2026 18:58:23 +0800 (CST)
Received: from [10.130.40.83] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxRs3OVNNqJW8tAA--.16816S2;
	Sat, 17 Oct 2026 18:58:23 +0800 (CST)
Subject: Re: [PATCH v3 3/3] LoongArch: BPF: Optimize 32-bit operations using
 native instructions
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261016081006.26069-1-yangtiezhu@loongson.cn>
 <20261016081006.26069-4-yangtiezhu@loongson.cn>
 <DM6D33SL63BR.HOFSY6JUHO44@gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <c6a049d4-80c1-c3a4-e4de-87b582864e01@loongson.cn>
Date: Sat, 17 Oct 2026 18:58:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <DM6D33SL63BR.HOFSY6JUHO44@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxRs3OVNNqJW8tAA--.16816S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXF1DZw1ruFyfuFy3tFy3KFX_yoW5tr13pF
	WqgF1fKw4UXFnavan7AF1DJa4DuF4DG3WDXrW3Xr43Grn8Arn5Xry0krsIvFWqgrWSvw45
	Ar1ayr92qFyDJrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82g43UU
	UUU==

On 2026/10/16 下午11:18, Alexei Starovoitov wrote:
> On Fri, Oct 16, 2026 at 04:10 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> 
>> All of the testcases of test_bpf passed on Loongson-3A6000 (with DIV32)
>> and Loongson-3A5000 (without DIV32), here are the test results:
> 
> fyi test_bpf is gone. See
> commit 4532e525b286 ("selftests/bpf: Remove the old test_bpf module").
> Pls run test_progs

I tested this series based on bpf-next tree with "./test_progs -a jit_insns"
and "./test_progs -a jit_insns_blinded", there are 3 pre-existing failures:
(1) #191/1   jit_insns/arena access with zero offset:FAIL
(2) #191/25  jit_insns/ldst_offsets:FAIL
(3) #192/11  jit_insns_blinded/ldst_offsets:FAIL

These 3 failures are entirely unrelated to this series; they still fail on
the clean, original bpf-next tree without this series.

The root cause is that LoongArch BPF JIT support for arena atomics and
sign-extending loads from arena is still a work-in-progress.

IIUC, there are already two patches to fix them, but need revisions:
https://lore.kernel.org/loongarch/20260702022322.51033-8-dongtai.guo@linux.dev/
https://lore.kernel.org/loongarch/20260702022322.51033-7-dongtai.guo@linux.dev/

Bypassing these known architectural gaps using the blacklist (-b) option
allows the remaining subtests under jit_insns and jit_insns_blinded to pass:

$ sudo ./test_progs -a jit_insns -b "jit_insns/arena access with zero 
offset,jit_insns/ldst_offsets"
#191/2   jit_insns/cast to a user address:OK
#191/3   jit_insns/alu_imm:OK
#191/4   jit_insns/alu_reg:OK
#191/5   jit_insns/alu_imm_regs:OK
#191/6   jit_insns/div_const:OK
#191/7   jit_insns/alu_reg_pairs:OK
#191/8   jit_insns/alu_edges:OK
#191/9   jit_insns/shifts:OK
#191/10  jit_insns/shift_counts:OK
#191/11  jit_insns/atomics:OK
#191/12  jit_insns/atomic_reg_pairs:OK
#191/13  jit_insns/xadd_chain:OK
#191/14  jit_insns/ld_imm64:OK
#191/15  jit_insns/jmp_imm:OK
#191/16  jit_insns/jmp_reg:OK
#191/17  jit_insns/jmp_reg_pairs:OK
#191/18  jit_insns/jmp_edges:OK
#191/19  jit_insns/staggered_jumps:OK
#191/20  jit_insns/max_jmp:OK
#191/21  jit_insns/convergence:OK
#191/22  jit_insns/calls:OK
#191/23  jit_insns/helper_calls:OK
#191/24  jit_insns/ldst_zero_off:OK
#191/26  jit_insns/acq_rel:OK
#191/27  jit_insns/movsx:OK
#191/28  jit_insns/jset_imm:OK
#191/29  jit_insns/cmp_imm:OK
#191/30  jit_insns/alu_consts:OK
#191/31  jit_insns/bswap:OK
#191/32  jit_insns/probe_mem:OK
#191     jit_insns:OK
Summary: 1/30 PASSED, 0 SKIPPED, 0/0 FAILED

$ sudo ./test_progs -a jit_insns_blinded -b jit_insns_blinded/ldst_offsets
#192/1   jit_insns_blinded/alu_imm:OK
#192/2   jit_insns_blinded/alu_imm_regs:OK
#192/3   jit_insns_blinded/alu_edges:OK
#192/4   jit_insns_blinded/div_const:OK
#192/5   jit_insns_blinded/shifts:OK
#192/6   jit_insns_blinded/xadd_chain:OK
#192/7   jit_insns_blinded/ld_imm64:OK
#192/8   jit_insns_blinded/jmp_imm:OK
#192/9   jit_insns_blinded/jmp_edges:OK
#192/10  jit_insns_blinded/ldst_zero_off:OK
#192/12  jit_insns_blinded/jset_imm:OK
#192/13  jit_insns_blinded/cmp_imm:OK
#192/14  jit_insns_blinded/alu_consts:OK
#192     jit_insns_blinded:OK
Summary: 1/13 PASSED, 0 SKIPPED, 0/0 FAILED

Thanks,
Tiezhu

